import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/table_entity.dart';
import '../../domain/repositories/active_tables_repository.dart';
import '../datasources/active_tables_local_datasource.dart';

@LazySingleton(as: ActiveTablesRepository)
class ActiveTablesRepositoryImpl implements ActiveTablesRepository {
  final ActiveTablesLocalDataSource _dataSource;

  ActiveTablesRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<TableEntity>>> getActiveTables() async {
    try {
      final result = await _dataSource.getActiveTables();
      return right(result);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}