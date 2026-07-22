import '../../../../core/data/tables_store.dart';
import '../../../active_tables/domain/entities/table_entity.dart';

abstract class OpenTableLocalDataSource {
  Future<void> openTable({
    required String zone,
    required String tableNumber,
    required int guestCount,
    required String serverName,
  });
}

class OpenTableLocalDataSourceImpl implements OpenTableLocalDataSource {
  final TablesStore _tablesStore;

  OpenTableLocalDataSourceImpl(this._tablesStore);

  @override
  Future<void> openTable({
    required String zone,
    required String tableNumber,
    required int guestCount,
    required String serverName,
  }) async {
    // Simulate slight local processing delay
    await Future.delayed(const Duration(milliseconds: 200));

    final newTable = TableEntity(
      // 1. Generate a temporary unique ID (or use the 'uuid' package)
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      tableNumber: tableNumber,
      status: TableStatus.occupied,
      guestCount: guestCount,
      currentTotal: 0.00,
      // 2. Add the required seatedAt timestamp
      seatedAt: DateTime.now(),
      // 3. Add an empty list for the required items
      items: [],
      // Optional: Map the server and zone to your entity
      assignedCaptain: serverName,
      areaName: zone,
    );

    _tablesStore.addTable(newTable);
  }
}
