import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../active_tables/domain/entities/table_entity.dart';

abstract class CheckoutRepository {
  Future<Either<Failure, TableEntity>> getTableCheckoutDetails(String tableId);
  Future<Either<Failure, TableEntity>> settleAndCloseTable({
    required String tableId,
    required String paymentMethod,
    required double tipAmount,
    required double totalPaid,
  });
}
