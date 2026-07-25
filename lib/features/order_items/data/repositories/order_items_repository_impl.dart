import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failure.dart';
import '../../../active_tables/domain/entities/table_entity.dart';
import '../../domain/entities/menu_item_entity.dart';
import '../../domain/entities/selected_order_item.dart';
import '../../domain/repositories/order_items_repository.dart';
import '../datasources/order_items_datasource.dart';

@LazySingleton(as: OrderItemsRepository)
class OrderItemsRepositoryImpl implements OrderItemsRepository {
  final OrderItemsDataSource _dataSource;

  OrderItemsRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<MenuItemEntity>>> getMenuItems() async {
    try {
      final items = await _dataSource.getMenuItems();
      return right(items);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, TableEntity>> confirmOrder({
    required String tableNumber,
    required String areaName,
    required List<SelectedOrderItem> items,
    required double totalAmount,
  }) async {
    try {
      if (items.isEmpty) {
        return left(const Failure.unknownError('Please select at least 1 item.'));
      }
      final table = await _dataSource.confirmOrder(
        tableNumber: tableNumber,
        areaName: areaName,
        items: items,
        totalAmount: totalAmount,
      );
      return right(table);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
