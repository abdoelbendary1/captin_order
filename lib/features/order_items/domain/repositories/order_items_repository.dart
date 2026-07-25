import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../../../active_tables/domain/entities/table_entity.dart';
import '../entities/menu_item_entity.dart';
import '../entities/selected_order_item.dart';

abstract class OrderItemsRepository {
  Future<Either<Failure, List<MenuItemEntity>>> getMenuItems();
  Future<Either<Failure, TableEntity>> confirmOrder({
    required String tableNumber,
    required String areaName,
    required List<SelectedOrderItem> items,
    required double totalAmount,
  });
}
