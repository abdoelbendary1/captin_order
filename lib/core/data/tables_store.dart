import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';

import '../../features/active_tables/domain/entities/table_entity.dart';
import '../../features/active_tables/domain/entities/timeline_event.dart';

@lazySingleton
class TablesStore {
  static const String _storageKey = 'tables_store_v1';
  final List<TableEntity> _tables = [];
  bool _initialized = false;

  TablesStore();

  Future<void> init() async {
    if (_initialized) return;
    final prefs = await SharedPreferences.getInstance();
    final rawJson = prefs.getString(_storageKey);

    if (rawJson != null && rawJson.isNotEmpty) {
      try {
        final List<dynamic> decoded = jsonDecode(rawJson);
        _tables.clear();
        _tables.addAll(
          decoded.map(
            (item) => TableEntity.fromJson(item as Map<String, dynamic>),
          ),
        );
        _initialized = true;
        return;
      } catch (e) {
        debugPrint('Error parsing saved tables from storage: $e');
      }
    }

    // Seed default 40 tables if empty
    _tables.clear();
    _tables.addAll(_generateDefaultTables());
    _initialized = true;
    await _saveToDisk();
  }

  Future<void> _saveToDisk() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final encoded = jsonEncode(_tables.map((t) => t.toJson()).toList());
      await prefs.setString(_storageKey, encoded);
    } catch (e) {
      debugPrint('Error saving tables to storage: $e');
    }
  }

  bool _isTakeaway(TableEntity t) {
    return t.tableNumber.toLowerCase().contains('takeaway') ||
        t.areaName.toLowerCase().contains('takeaway') ||
        t.id.toLowerCase().contains('takeaway');
  }

  // --- QUERIES ---

  Future<List<TableEntity>> getAllTables() async {
    await init();
    final restaurantTables = _tables.where((t) => !_isTakeaway(t));
    return List.unmodifiable(restaurantTables.toList());
  }

  Future<List<TableEntity>> getTakeawayOrders() async {
    await init();
    final takeawayOrders = _tables.where((t) => _isTakeaway(t));
    return List.unmodifiable(takeawayOrders.toList());
  }

  Future<List<TableEntity>> getAvailableTables({
    TableLocation? location,
  }) async {
    await init();
    final available = _tables.where(
      (t) => t.status == TableStatus.available && !_isTakeaway(t),
    );
    if (location != null) {
      return List.unmodifiable(
        available.where((t) => t.location == location).toList(),
      );
    }
    return List.unmodifiable(available.toList());
  }

  Future<List<TableEntity>> getActiveTables({TableLocation? location}) async {
    await init();
    final active = _tables.where(
      (t) =>
          (t.status == TableStatus.occupied ||
              t.status == TableStatus.reserved) &&
          !_isTakeaway(t),
    );
    if (location != null) {
      return List.unmodifiable(
        active.where((t) => t.location == location).toList(),
      );
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

  // --- MUTATIONS ---

  Future<TableEntity> openTableForGuest({
    required String tableNumber,
    required String areaName,
    required int guestCount,
    required String captainName,
  }) async {
    await init();
    final now = DateTime.now();
    final areaLower = areaName.toLowerCase();
    final isOutside =
        areaLower.contains('outdoor') ||
        areaLower.contains('outside') ||
        areaLower.contains('patio');

    final existingTable = await getTableById(tableNumber);

    final checkInEvent = TimelineEvent(
      id: 't_${now.millisecondsSinceEpoch}',
      title: 'Table Checked-in',
      timestamp: now,
      actor: 'BY ${captainName.toUpperCase()}',
    );

    final List<TimelineEvent> timeline = existingTable != null
        ? (List.from(existingTable.timeline)..insert(0, checkInEvent))
        : [checkInEvent];

    final updatedTable = TableEntity(
      id: existingTable?.id ?? now.millisecondsSinceEpoch.toString(),
      tableNumber: tableNumber,
      tableCode: 'T-${tableNumber.padLeft(2, '0')}',
      status: TableStatus.occupied,
      location:
          existingTable?.location ??
          (isOutside ? TableLocation.outside : TableLocation.inside),
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
        title:
            'Table Settled ($paymentMethod)\n• Total: ${totalPaid.toStringAsFixed(2)} EGP',
        timestamp: now,
        actor: 'BY CAPTAIN AHMED M.',
      ),
    );

    final isTakeawayOrder = table != null && _isTakeaway(table);

    final updated =
        (table ??
                TableEntity(
                  id: tableId,
                  tableNumber: tableId,
                  status: TableStatus.available,
                  guestCount: 0,
                  currentTotal: 0.0,
                  areaName: 'Inside Hall',
                ))
            .copyWith(
              status: isTakeawayOrder
                  ? TableStatus.occupied
                  : TableStatus.available,
              currentTotal: isTakeawayOrder ? totalPaid : 0.0,
              guestCount: isTakeawayOrder ? table?.guestCount ?? 1 : 0,
              items: isTakeawayOrder ? table?.items ?? const [] : const [],
              timeline: newTimeline,
              tableStatusDescription: isTakeawayOrder
                  ? 'Settled & Completed'
                  : 'Available for seating',
            );

    await saveOrUpdateTable(updated);
    return updated;
  }

  Future<void> saveOrUpdateTable(TableEntity table) async {
    await init();
    final cleanId = table.id.trim();
    final isTakeaway = _isTakeaway(table);
    final normNum = isTakeaway
        ? null
        : int.tryParse(table.tableNumber)?.toString();

    final index = _tables.indexWhere((t) {
      if (t.id == cleanId) return true;
      if (!isTakeaway && t.tableNumber == table.tableNumber) return true;
      if (!isTakeaway && normNum != null) {
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
    await init();
    _tables.add(table);
    await _saveToDisk();
  }

  Future<void> updateTableStatus(String tableId, TableStatus status) async {
    await init();
    final index = _tables.indexWhere(
      (t) => t.id == tableId || t.tableNumber == tableId,
    );
    if (index != -1) {
      _tables[index] = _tables[index].copyWith(status: status);
      await _saveToDisk();
    }
  }

  Future<void> resetAllTables() async {
    _tables.clear();
    _tables.addAll(_generateDefaultTables());
    await _saveToDisk();
  }

  List<TableEntity> _generateDefaultTables() {
    final now = DateTime.now();
    return [
      // Table 1
      TableEntity(
        id: '1',
        tableNumber: '01',
        tableCode: 'T-01',
        status: TableStatus.available,
        location: TableLocation.inside,
        guestCount: 0,
        currentTotal: 0.00,
        areaName: 'Main Hall',
        capacity: 4,
      ),
      // Table 2
      TableEntity(
        id: '2',
        tableNumber: '02',
        tableCode: 'T-02',
        status: TableStatus.available,
        location: TableLocation.inside,
        guestCount: 0,
        currentTotal: 0.00,
        areaName: 'Main Hall',
        capacity: 2,
      ),
      // Tables 3 - 40
      ...List.generate(38, (index) {
        final num = index + 3;
        final numStr = num.toString().padLeft(2, '0');
        final isOutside = num > 30;
        final area = isOutside
            ? 'Terrace'
            : (num > 15 ? 'VIP Section' : 'Main Hall');
        final capacity = (num % 3 == 0) ? 6 : ((num % 2 == 0) ? 4 : 2);

        return TableEntity(
          id: num.toString(),
          tableNumber: numStr,
          tableCode: 'T-$numStr',
          status: TableStatus.available,
          location: isOutside ? TableLocation.outside : TableLocation.inside,
          guestCount: 0,
          currentTotal: 0.00,
          areaName: area,
          capacity: capacity,
        );
      }),
    ];
  }
}
