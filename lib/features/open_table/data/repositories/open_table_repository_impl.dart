import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failure.dart';
import '../../../active_tables/domain/entities/table_entity.dart';
import '../../domain/repositories/open_table_repository.dart';
import '../datasources/open_table_local_datasource.dart';

@LazySingleton(as: OpenTableRepository)
class OpenTableRepositoryImpl implements OpenTableRepository {
  final OpenTableLocalDataSource _dataSource;

  OpenTableRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<TableEntity>>> getAvailableTables(TableLocation location) async {
    try {
      final tables = await _dataSource.getAvailableTables(location);
      return right(tables);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, TableEntity>> openTable({
    required String zone,
    required String tableNumber,
    required int guestCount,
    required String captainName,
  }) async {
    try {
      final table = await _dataSource.openTable(
        zone: zone,
        tableNumber: tableNumber,
        guestCount: guestCount,
        captainName: captainName,
      );
      return right(table);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
