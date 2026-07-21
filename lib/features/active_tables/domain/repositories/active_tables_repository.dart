import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../entities/table_entity.dart';

abstract class ActiveTablesRepository {
  Future<Either<Failure, List<TableEntity>>> getActiveTables();
}