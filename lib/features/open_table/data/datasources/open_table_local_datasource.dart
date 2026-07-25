import 'package:injectable/injectable.dart';
import '../../../../core/data/tables_store.dart';
import '../../../active_tables/domain/entities/table_entity.dart';

abstract class OpenTableLocalDataSource {
  Future<List<TableEntity>> getAvailableTables(TableLocation location);
  Future<TableEntity> openTable({
    required String zone,
    required String tableNumber,
    required int guestCount,
    required String captainName,
  });
}

@LazySingleton(as: OpenTableLocalDataSource)
class OpenTableLocalDataSourceImpl implements OpenTableLocalDataSource {
  final TablesStore _tablesStore;

  OpenTableLocalDataSourceImpl(this._tablesStore);

  @override
  Future<List<TableEntity>> getAvailableTables(TableLocation location) async {
    await Future.delayed(const Duration(milliseconds: 150));
    return await _tablesStore.getAvailableTables(location: location);
  }

  @override
  Future<TableEntity> openTable({
    required String zone,
    required String tableNumber,
    required int guestCount,
    required String captainName,
  }) async {
    await Future.delayed(const Duration(milliseconds: 150));
    return await _tablesStore.openTableForGuest(
      tableNumber: tableNumber,
      areaName: zone,
      guestCount: guestCount,
      captainName: captainName,
    );
  }
}
