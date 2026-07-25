import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failure.dart';
import '../../../active_tables/domain/entities/table_entity.dart';
import '../../domain/repositories/table_details_repository.dart';
import '../datasources/table_details_datasource.dart';

@LazySingleton(as: TableDetailsRepository)
class TableDetailsRepositoryImpl implements TableDetailsRepository {
  final TableDetailsDataSource _dataSource;

  TableDetailsRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, TableEntity>> getTableDetails(String tableId) async {
    try {
      final table = await _dataSource.getTableDetails(tableId);
      return right(table);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, TableEntity>> requestCheck(String tableId) async {
    try {
      final table = await _dataSource.requestCheck(tableId);
      return right(table);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, TableEntity>> moveTable(
    String tableId,
    String newTableNumber,
  ) async {
    try {
      final table = await _dataSource.moveTable(tableId, newTableNumber);
      return right(table);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
