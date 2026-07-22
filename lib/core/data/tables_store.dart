import '../../features/active_tables/domain/entities/table_entity.dart';

class TablesStore {
  // Singleton instance
  static final TablesStore _instance = TablesStore._internal();
  factory TablesStore() => _instance;
  TablesStore._internal();

  // In-memory list of active tables
  final List<TableEntity> _activeTables = [];

  List<TableEntity> getTables() {
    return List.unmodifiable(_activeTables);
  }

  void addTable(TableEntity table) {
    // Replace if exists, otherwise add
    final index = _activeTables.indexWhere(
      (t) => t.tableNumber == table.tableNumber,
    );
    if (index != -1) {
      _activeTables[index] = table;
    } else {
      _activeTables.add(table);
    }
  }

  bool isTableOccupied(String tableNumber) {
    return _activeTables.any(
      (t) => t.tableNumber == tableNumber && t.status == TableStatus.occupied,
    );
  }
}
