import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../active_tables/domain/entities/table_entity.dart';

abstract class TableDetailsRepository {
  Future<Either<Failure, TableEntity>> getTableDetails(String tableId);
  Future<Either<Failure, TableEntity>> requestCheck(String tableId);
  Future<Either<Failure, TableEntity>> moveTable(String tableId, String newTableNumber);
}
