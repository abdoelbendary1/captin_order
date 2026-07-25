import 'package:injectable/injectable.dart';
import '../../../../core/data/tables_store.dart';
import '../../../active_tables/domain/entities/table_entity.dart';
import '../../../active_tables/domain/entities/timeline_event.dart';

abstract class TableDetailsDataSource {
  Future<TableEntity> getTableDetails(String tableId);
  Future<TableEntity> requestCheck(String tableId);
  Future<TableEntity> moveTable(String tableId, String newTableNumber);
}

@LazySingleton(as: TableDetailsDataSource)
class TableDetailsDataSourceImpl implements TableDetailsDataSource {
  final TablesStore _tablesStore;

  TableDetailsDataSourceImpl(this._tablesStore);

  @override
  Future<TableEntity> getTableDetails(String tableId) async {
    final table = await _tablesStore.getTableById(tableId);
    if (table != null) return table;
    throw Exception('Table not found.');
  }

  @override
  Future<TableEntity> requestCheck(String tableId) async {
    final table = await getTableDetails(tableId);
    final now = DateTime.now();

    final newTimeline = List<TimelineEvent>.from(table.timeline);
    newTimeline.insert(
      0,
      TimelineEvent(
        id: 't_${now.millisecondsSinceEpoch}',
        title: 'Check Requested',
        timestamp: now,
        actor: 'BY CAPTAIN AHMED M.',
      ),
    );

    final updated = table.copyWith(
      status: TableStatus.reserved,
      tableStatusDescription: 'Check requested. Waiting for settlement.',
      timeline: newTimeline,
    );

    await _tablesStore.saveOrUpdateTable(updated);
    return updated;
  }

  @override
  Future<TableEntity> moveTable(String tableId, String newTableNumber) async {
    final table = await getTableDetails(tableId);
    final now = DateTime.now();

    final newTimeline = List<TimelineEvent>.from(table.timeline);
    newTimeline.insert(
      0,
      TimelineEvent(
        id: 't_${now.millisecondsSinceEpoch}',
        title: 'Table Moved to T-${newTableNumber.padLeft(2, '0')}',
        timestamp: now,
        actor: 'BY CAPTAIN AHMED M.',
      ),
    );

    final updated = table.copyWith(
      tableNumber: newTableNumber,
      tableCode: 'T-${newTableNumber.padLeft(2, '0')}',
      tableStatusDescription: 'Occupied for ${now.difference(table.openedAt ?? now).inMinutes} minutes. Moved to T-$newTableNumber.',
      timeline: newTimeline,
    );

    await _tablesStore.saveOrUpdateTable(updated);
    return updated;
  }
}
