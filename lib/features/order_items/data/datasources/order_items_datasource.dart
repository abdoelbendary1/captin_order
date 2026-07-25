import 'package:injectable/injectable.dart';
import '../../../../core/data/tables_store.dart';
import '../../../active_tables/domain/entities/order_item.dart';
import '../../../active_tables/domain/entities/table_entity.dart';
import '../../../active_tables/domain/entities/timeline_event.dart';
import '../../domain/entities/menu_item_entity.dart';
import '../../domain/entities/selected_order_item.dart';

abstract class OrderItemsDataSource {
  Future<List<MenuItemEntity>> getMenuItems();
  Future<TableEntity> confirmOrder({
    required String tableNumber,
    required String areaName,
    required List<SelectedOrderItem> items,
    required double totalAmount,
  });
}

@LazySingleton(as: OrderItemsDataSource)
class OrderItemsDataSourceImpl implements OrderItemsDataSource {
  final TablesStore _tablesStore;

  OrderItemsDataSourceImpl(this._tablesStore);

  @override
  Future<List<MenuItemEntity>> getMenuItems() async {
    await Future.delayed(const Duration(milliseconds: 200));

    return const [
      MenuItemEntity(id: '101', name: 'Cappuccino', price: 9.0, category: 'Hot Drinks'),
      MenuItemEntity(id: '102', name: 'Avocado Toast', price: 14.0, category: 'Food'),
      MenuItemEntity(id: '103', name: 'Blueberry Muffin', price: 10.0, category: 'Food'),
      MenuItemEntity(id: '104', name: 'Flat White', price: 4.5, category: 'Hot Drinks'),
      MenuItemEntity(id: '1', name: 'French Coffee', price: 30.0, category: 'Hot Drinks'),
      MenuItemEntity(id: '2', name: 'Plain Coffee', price: 20.0, category: 'Hot Drinks'),
      MenuItemEntity(id: '3', name: 'Karkadeh Tea', price: 15.0, category: 'Hot Drinks'),
      MenuItemEntity(id: '4', name: 'Shisha Kas', price: 40.0, category: 'Shisha'),
      MenuItemEntity(id: '5', name: 'Shisha Apple', price: 45.0, category: 'Shisha'),
      MenuItemEntity(id: '6', name: 'Sahlab', price: 35.0, category: 'Hot Drinks'),
      MenuItemEntity(id: '7', name: 'Mango Juice', price: 35.0, category: 'Juices'),
      MenuItemEntity(id: '8', name: 'Mineral Water', price: 10.0, category: 'Cold Drinks'),
      MenuItemEntity(id: '9', name: 'Pepsi', price: 15.0, category: 'Cold Drinks'),
      MenuItemEntity(id: '10', name: 'Energy Drink', price: 50.0, category: 'Cold Drinks'),
    ];
  }

  @override
  Future<TableEntity> confirmOrder({
    required String tableNumber,
    required String areaName,
    required List<SelectedOrderItem> items,
    required double totalAmount,
  }) async {
    final now = DateTime.now();
    final areaLower = areaName.toLowerCase();
    final isOutside = areaLower.contains('outdoor') ||
        areaLower.contains('outside') ||
        areaLower.contains('patio');

    final existingTable = await _tablesStore.getTableById(tableNumber);

    final newOrderItems = items
        .map((e) => OrderItem(
              id: e.item.id,
              name: e.item.name,
              price: e.item.price,
              quantity: e.quantity,
            ))
        .toList();

    List<OrderItem> combinedItems = [];
    List<TimelineEvent> combinedTimeline = [];
    DateTime openedAt = now;

    if (existingTable != null) {
      // Merge item quantities when adding items to an existing active table order
      final itemMap = <String, OrderItem>{};
      for (final item in existingTable.items) {
        itemMap[item.id] = item;
      }
      for (final newItem in newOrderItems) {
        if (itemMap.containsKey(newItem.id)) {
          final existing = itemMap[newItem.id]!;
          itemMap[newItem.id] = existing.copyWith(
            quantity: existing.quantity + newItem.quantity,
          );
        } else {
          itemMap[newItem.id] = newItem;
        }
      }
      combinedItems = itemMap.values.toList();
      combinedTimeline = List.from(existingTable.timeline);
      openedAt = existingTable.openedAt ?? now;
    } else {
      combinedItems = newOrderItems;
      combinedTimeline = [
        TimelineEvent(
          id: 't_${now.millisecondsSinceEpoch}_checkin',
          title: 'Table Checked-in',
          timestamp: now.subtract(const Duration(minutes: 1)),
          actor: 'QR SCAN',
        ),
      ];
    }

    final newTimelineEvent = TimelineEvent(
      id: 't_${now.millisecondsSinceEpoch}',
      title: 'Order Sent to Kitchen',
      timestamp: now,
      actor: 'BY CAPTAIN AHMED M.',
    );
    combinedTimeline.insert(0, newTimelineEvent);

    final grandTotal = combinedItems.fold<double>(
      0.0,
      (sum, item) => sum + (item.price * item.quantity),
    );

    final TableLocation location = existingTable != null
        ? existingTable.location
        : (isOutside ? TableLocation.outside : TableLocation.inside);

    final updatedTable = TableEntity(
      id: existingTable?.id ?? now.millisecondsSinceEpoch.toString(),
      tableNumber: tableNumber,
      tableCode: 'T-${tableNumber.padLeft(2, '0')}',
      status: TableStatus.occupied,
      location: location,
      guestCount: existingTable?.guestCount ?? 2,
      currentTotal: grandTotal,
      timeSeated: '00:00',
      openedAt: openedAt,
      seatedAt: openedAt,
      areaName: areaName,
      assignedCaptain: 'Captain Ahmed M.',
      items: combinedItems,
      timeline: combinedTimeline,
      tableStatusDescription:
          'Occupied for ${now.difference(openedAt).inMinutes} minutes. Kitchen is processing order.',
      capacity: existingTable?.capacity ?? 4,
    );

    await _tablesStore.saveOrUpdateTable(updatedTable);
    return updatedTable;
  }
}
