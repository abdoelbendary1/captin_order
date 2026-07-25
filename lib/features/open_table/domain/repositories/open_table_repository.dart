import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../active_tables/domain/entities/table_entity.dart';

abstract class OpenTableRepository {
  Future<Either<Failure, List<TableEntity>>> getAvailableTables(TableLocation location);
  Future<Either<Failure, TableEntity>> openTable({
    required String zone,
    required String tableNumber,
    required int guestCount,
    required String captainName,
  });
}
