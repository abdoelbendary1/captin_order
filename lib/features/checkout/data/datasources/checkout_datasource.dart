import 'package:injectable/injectable.dart';
import '../../../../core/data/tables_store.dart';
import '../../../active_tables/domain/entities/table_entity.dart';

abstract class CheckoutDataSource {
  Future<TableEntity> getTableCheckoutDetails(String tableId);
  Future<TableEntity> settleAndCloseTable({
    required String tableId,
    required String paymentMethod,
    required double tipAmount,
    required double totalPaid,
  });
}

@LazySingleton(as: CheckoutDataSource)
class CheckoutDataSourceImpl implements CheckoutDataSource {
  final TablesStore _tablesStore;

  CheckoutDataSourceImpl(this._tablesStore);

  @override
  Future<TableEntity> getTableCheckoutDetails(String tableId) async {
    final table = await _tablesStore.getTableById(tableId);
    if (table != null) return table;
    throw Exception('Table not found.');
  }

  @override
  Future<TableEntity> settleAndCloseTable({
    required String tableId,
    required String paymentMethod,
    required double tipAmount,
    required double totalPaid,
  }) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return await _tablesStore.closeAndSettleTable(
      tableId: tableId,
      paymentMethod: paymentMethod,
      tipAmount: tipAmount,
      totalPaid: totalPaid,
    );
  }
}
