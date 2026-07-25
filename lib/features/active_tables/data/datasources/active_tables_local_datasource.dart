import 'package:injectable/injectable.dart';
import '../../../../core/data/tables_store.dart';
import '../../domain/entities/table_entity.dart';

abstract class ActiveTablesLocalDataSource {
  Future<List<TableEntity>> getActiveTables();
}

@LazySingleton(as: ActiveTablesLocalDataSource)
class ActiveTablesLocalDataSourceImpl implements ActiveTablesLocalDataSource {
  final TablesStore _tablesStore;

  ActiveTablesLocalDataSourceImpl(this._tablesStore);

  @override
  Future<List<TableEntity>> getActiveTables() async {
    return await _tablesStore.getActiveTables();
  }
}