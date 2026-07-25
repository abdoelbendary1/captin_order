import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failure.dart';
import '../../../active_tables/domain/entities/table_entity.dart';
import '../../domain/repositories/checkout_repository.dart';
import '../datasources/checkout_datasource.dart';

@LazySingleton(as: CheckoutRepository)
class CheckoutRepositoryImpl implements CheckoutRepository {
  final CheckoutDataSource _dataSource;

  CheckoutRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, TableEntity>> getTableCheckoutDetails(String tableId) async {
    try {
      final table = await _dataSource.getTableCheckoutDetails(tableId);
      return right(table);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, TableEntity>> settleAndCloseTable({
    required String tableId,
    required String paymentMethod,
    required double tipAmount,
    required double totalPaid,
  }) async {
    try {
      final table = await _dataSource.settleAndCloseTable(
        tableId: tableId,
        paymentMethod: paymentMethod,
        tipAmount: tipAmount,
        totalPaid: totalPaid,
      );
      return right(table);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
