// lib/features/active_tables/data/datasources/active_tables_local_datasource.dart
import 'package:injectable/injectable.dart';
import '../../domain/entities/order_item.dart';
import '../../domain/entities/table_entity.dart';

abstract class ActiveTablesLocalDataSource {
  Future<List<TableEntity>> getActiveTables();
}

@LazySingleton(as: ActiveTablesLocalDataSource)
class ActiveTablesLocalDataSourceImpl implements ActiveTablesLocalDataSource {
  @override
  Future<List<TableEntity>> getActiveTables() async {
    // Simulate network latency & DB read
    await Future.delayed(const Duration(milliseconds: 800));

    return [
      TableEntity(
        id: '1',
        tableNumber: '01',
        status: TableStatus.occupied,
        guestCount: 2,
        currentTotal: 24.50,
        seatedAt: DateTime.now().subtract(const Duration(minutes: 45)),
        areaName: 'Main Dining Area',
        assignedCaptain: 'Alex',
        items: const [
          OrderItem(id: 'i1', name: 'Espresso', price: 4.50, quantity: 2),
          OrderItem(id: 'i2', name: 'Avocado Toast', price: 15.50, quantity: 1),
        ],
      ),
      TableEntity(
        id: '2',
        tableNumber: '04',
        status: TableStatus.occupied,
        guestCount: 1,
        currentTotal: 12.00,
        seatedAt: DateTime.now().subtract(const Duration(minutes: 20)),
        areaName: 'Main Dining Area',
        assignedCaptain: 'Alex',
        items: const [
          OrderItem(id: 'i3', name: 'Pour Over', price: 7.00, quantity: 1),
          OrderItem(id: 'i4', name: 'Croissant', price: 5.00, quantity: 1),
        ],
      ),
      TableEntity(
        id: '3',
        tableNumber: '06',
        status: TableStatus.occupied,
        guestCount: 4,
        currentTotal: 45.00,
        seatedAt: DateTime.now().subtract(const Duration(minutes: 60)),
        areaName: 'Main Dining Area',
        assignedCaptain: 'Alex',
        items: const [
          OrderItem(id: 'i5', name: 'Flat White', price: 5.00, quantity: 3),
          OrderItem(id: 'i6', name: 'Pancakes', price: 15.00, quantity: 2),
        ],
      ),
    ];
  }
}