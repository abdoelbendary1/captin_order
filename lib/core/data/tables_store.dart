import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/active_tables/domain/entities/order_item.dart';
import '../../features/active_tables/domain/entities/table_entity.dart';
import '../../features/active_tables/domain/entities/timeline_event.dart';

@LazySingleton()
class TablesStore {
  static const String _storageKey = 'key_captin_order_tables_v3';
  List<TableEntity> _tables = [];
  bool _isInitialized = false;

  Future<void> init() async {
    if (_isInitialized) return;
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(_storageKey);

      if (jsonString != null && jsonString.isNotEmpty) {
        try {
          final List<dynamic> jsonList = jsonDecode(jsonString);
          _tables = jsonList.map((e) => TableEntity.fromJson(e)).toList();
        } catch (e) {
          _tables = _generateDefaultFullRestaurantTables();
          await _saveToDisk();
        }
      } else {
        _tables = _generateDefaultFullRestaurantTables();
        await _saveToDisk();
      }
    } catch (e) {
      if (_tables.isEmpty) {
        _tables = _generateDefaultFullRestaurantTables();
      }
    }
    _isInitialized = true;
  }

  Future<void> _saveToDisk() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonList = _tables.map((t) => t.toJson()).toList();
      await prefs.setString(_storageKey, jsonEncode(jsonList));
    } catch (_) {}
  }

  // --- QUERIES (SIMULATING SERVER DB) ---

  Future<List<TableEntity>> getAllTables() async {
    await init();
    return List.unmodifiable(_tables);
  }

  Future<List<TableEntity>> getAvailableTables({TableLocation? location}) async {
    await init();
    final available = _tables.where((t) => t.status == TableStatus.available);
    if (location != null) {
      return List.unmodifiable(available.where((t) => t.location == location).toList());
    }
    return List.unmodifiable(available.toList());
  }

  Future<List<TableEntity>> getActiveTables({TableLocation? location}) async {
    await init();
    final active = _tables.where((t) => t.status == TableStatus.occupied || t.status == TableStatus.reserved);
    if (location != null) {
      return List.unmodifiable(active.where((t) => t.location == location).toList());
    }
    return List.unmodifiable(active.toList());
  }

  Future<TableEntity?> getTableById(String idOrNumber) async {
    await init();
    final cleanId = idOrNumber.trim();
    final normId = int.tryParse(cleanId)?.toString();

    final index = _tables.indexWhere((t) {
      if (t.id == cleanId || t.tableNumber == cleanId) return true;
      if (normId != null) {
        final tNumNorm = int.tryParse(t.tableNumber)?.toString();
        if (tNumNorm == normId) return true;
      }
      return false;
    });

    if (index != -1) {
      return _tables[index];
    }
    return null;
  }

  // --- MUTATIONS (SIMULATING SERVER API) ---

  Future<TableEntity> openTableForGuest({
    required String tableNumber,
    required String areaName,
    required int guestCount,
    required String captainName,
  }) async {
    await init();
    final now = DateTime.now();
    final areaLower = areaName.toLowerCase();
    final isOutside = areaLower.contains('outdoor') ||
        areaLower.contains('outside') ||
        areaLower.contains('patio');

    final existingTable = await getTableById(tableNumber);

    final TimelineEvent checkInEvent = TimelineEvent(
      id: 't_${now.millisecondsSinceEpoch}_checkin',
      title: 'Table Checked-in',
      timestamp: now,
      actor: 'BY $captainName',
    );

    final List<TimelineEvent> timeline = existingTable != null
        ? (List.from(existingTable.timeline)..insert(0, checkInEvent))
        : [checkInEvent];

    final updatedTable = TableEntity(
      id: existingTable?.id ?? now.millisecondsSinceEpoch.toString(),
      tableNumber: tableNumber,
      tableCode: 'T-${tableNumber.padLeft(2, '0')}',
      status: TableStatus.occupied,
      location: existingTable?.location ?? (isOutside ? TableLocation.outside : TableLocation.inside),
      guestCount: guestCount,
      currentTotal: existingTable?.currentTotal ?? 0.00,
      timeSeated: '00:00',
      openedAt: existingTable?.openedAt ?? now,
      seatedAt: existingTable?.seatedAt ?? now,
      areaName: areaName,
      assignedCaptain: captainName,
      items: existingTable?.items ?? const [],
      timeline: timeline,
      tableStatusDescription: 'Occupied for 0 minutes.',
      capacity: existingTable?.capacity ?? 4,
    );

    await saveOrUpdateTable(updatedTable);
    return updatedTable;
  }

  Future<TableEntity> closeAndSettleTable({
    required String tableId,
    required String paymentMethod,
    required double tipAmount,
    required double totalPaid,
  }) async {
    await init();
    final table = await getTableById(tableId);
    final now = DateTime.now();

    final newTimeline = List<TimelineEvent>.from(table?.timeline ?? []);
    newTimeline.insert(
      0,
      TimelineEvent(
        id: 't_${now.millisecondsSinceEpoch}',
        title: 'Table Settled ($paymentMethod)\n• Total: ${totalPaid.toStringAsFixed(2)} EGP',
        timestamp: now,
        actor: 'BY CAPTAIN AHMED M.',
      ),
    );

    final updated = (table ?? TableEntity(
      id: tableId,
      tableNumber: tableId,
      status: TableStatus.available,
      guestCount: 0,
      currentTotal: 0.0,
      areaName: 'Inside Hall',
    )).copyWith(
      status: TableStatus.available,
      currentTotal: 0.0,
      guestCount: 0,
      items: const [],
      timeline: newTimeline,
      tableStatusDescription: 'Available for seating',
    );

    await saveOrUpdateTable(updated);
    return updated;
  }

  Future<void> saveOrUpdateTable(TableEntity table) async {
    await init();
    final cleanId = table.id.trim();
    final normNum = int.tryParse(table.tableNumber)?.toString();

    final index = _tables.indexWhere((t) {
      if (t.id == cleanId || t.tableNumber == table.tableNumber) return true;
      if (normNum != null) {
        final tNumNorm = int.tryParse(t.tableNumber)?.toString();
        if (tNumNorm == normNum) return true;
      }
      return false;
    });

    if (index != -1) {
      _tables[index] = table;
    } else {
      _tables.add(table);
    }
    await _saveToDisk();
  }

  Future<void> addTable(TableEntity table) async {
    await saveOrUpdateTable(table);
  }

  Future<void> removeTable(String id) async {
    await init();
    final cleanId = id.trim();
    final normId = int.tryParse(cleanId)?.toString();

    _tables.removeWhere((t) {
      if (t.id == cleanId || t.tableNumber == cleanId) return true;
      if (normId != null) {
        final tNumNorm = int.tryParse(t.tableNumber)?.toString();
        if (tNumNorm == normId) return true;
      }
      return false;
    });

    await _saveToDisk();
  }

  // --- DEFAULT RESTAURANT SEED DATA ---

  List<TableEntity> _generateDefaultFullRestaurantTables() {
    final now = DateTime.now();
    final List<TableEntity> result = [];

    // 1. Inside Hall Tables (20 Tables)
    for (int i = 1; i <= 20; i++) {
      final formattedNumber = i.toString().padLeft(2, '0');

      if (i == 1) {
        // Table 01: Occupied
        result.add(TableEntity(
          id: '1',
          tableNumber: '01',
          tableCode: 'T-01',
          status: TableStatus.occupied,
          location: TableLocation.inside,
          guestCount: 2,
          currentTotal: 45.00,
          timeSeated: '15:20',
          openedAt: now.subtract(const Duration(minutes: 15, seconds: 20)),
          seatedAt: now.subtract(const Duration(minutes: 15, seconds: 20)),
          areaName: 'Inside Hall',
          assignedCaptain: 'Captain Ahmed M.',
          capacity: 4,
          items: const [
            OrderItem(id: '1', name: 'French Coffee', price: 30.0, quantity: 1),
            OrderItem(id: '2', name: 'Karkadeh Tea', price: 15.0, quantity: 1),
          ],
          tableStatusDescription: 'Occupied for 15 minutes. Kitchen is preparing drinks.',
          timeline: [
            TimelineEvent(
              id: 't1',
              title: 'Order Sent to Kitchen',
              timestamp: now.subtract(const Duration(minutes: 15)),
              actor: 'BY CAPTAIN AHMED M.',
            ),
            TimelineEvent(
              id: 't2',
              title: 'Table Checked-in',
              timestamp: now.subtract(const Duration(minutes: 16)),
              actor: 'QR SCAN',
            ),
          ],
        ));
      } else if (i == 2) {
        // Table 02: Occupied
        result.add(TableEntity(
          id: '2',
          tableNumber: '02',
          tableCode: 'T-02',
          status: TableStatus.occupied,
          location: TableLocation.inside,
          guestCount: 1,
          currentTotal: 20.00,
          timeSeated: '05:15',
          openedAt: now.subtract(const Duration(minutes: 5, seconds: 15)),
          seatedAt: now.subtract(const Duration(minutes: 5, seconds: 15)),
          areaName: 'Inside Hall',
          assignedCaptain: 'Captain Ahmed M.',
          capacity: 2,
          items: const [
            OrderItem(id: '2', name: 'Plain Coffee', price: 20.0, quantity: 1),
          ],
          tableStatusDescription: 'Occupied for 5 minutes.',
          timeline: [
            TimelineEvent(
              id: 't3',
              title: 'Order Sent to Kitchen',
              timestamp: now.subtract(const Duration(minutes: 5)),
              actor: 'BY CAPTAIN AHMED M.',
            ),
          ],
        ));
      } else {
        // Available Inside Tables
        result.add(TableEntity(
          id: 'in_$i',
          tableNumber: formattedNumber,
          tableCode: 'T-$formattedNumber',
          status: TableStatus.available,
          location: TableLocation.inside,
          guestCount: 0,
          currentTotal: 0.00,
          timeSeated: '00:00',
          areaName: 'Inside Hall',
          capacity: (i % 3 == 0) ? 6 : (i % 2 == 0 ? 4 : 2),
        ));
      }
    }

    // 2. Outside Patio Tables (20 Tables)
    for (int i = 1; i <= 20; i++) {
      final formattedNumber = (i + 20).toString().padLeft(2, '0');

      if (i == 6 || formattedNumber == '06') {
        // Table 06: Occupied
        result.add(TableEntity(
          id: '6',
          tableNumber: '06',
          tableCode: 'T-06',
          status: TableStatus.occupied,
          location: TableLocation.outside,
          guestCount: 2,
          currentTotal: 40.69,
          timeSeated: '42:00',
          openedAt: now.subtract(const Duration(minutes: 42, seconds: 0)),
          seatedAt: now.subtract(const Duration(minutes: 42, seconds: 0)),
          areaName: 'Outside Patio',
          assignedCaptain: 'Captain Ahmed M.',
          capacity: 4,
          items: const [
            OrderItem(id: '101', name: 'Cappuccino', price: 9.00, quantity: 2),
            OrderItem(id: '102', name: 'Avocado Toast', price: 14.00, quantity: 1),
            OrderItem(id: '103', name: 'Blueberry Muffin', price: 10.00, quantity: 2),
            OrderItem(id: '104', name: 'Flat White', price: 4.50, quantity: 1),
          ],
          tableStatusDescription: 'Occupied for 42 minutes. Kitchen is processing muffins.',
          timeline: [
            TimelineEvent(
              id: 't4',
              title: 'Order Sent to Kitchen',
              timestamp: now.subtract(const Duration(minutes: 20)),
              actor: 'BY CAPTAIN AHMED M.',
            ),
            TimelineEvent(
              id: 't5',
              title: 'Drinks Prepared',
              timestamp: now.subtract(const Duration(minutes: 24)),
              actor: 'BY BARISTA MIKE',
            ),
            TimelineEvent(
              id: 't6',
              title: 'Table Checked-in',
              timestamp: now.subtract(const Duration(minutes: 42)),
              actor: 'QR SCAN',
            ),
          ],
        ));
      } else {
        // Available Outside Tables
        result.add(TableEntity(
          id: 'out_$i',
          tableNumber: formattedNumber,
          tableCode: 'T-$formattedNumber',
          status: TableStatus.available,
          location: TableLocation.outside,
          guestCount: 0,
          currentTotal: 0.00,
          timeSeated: '00:00',
          areaName: 'Outside Patio',
          capacity: (i % 4 == 0) ? 8 : (i % 2 == 0 ? 4 : 2),
        ));
      }
    }

    return result;
  }
}
