import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/menu_item_entity.dart';

part 'order_items_event.freezed.dart';

@freezed
class OrderItemsEvent with _$OrderItemsEvent {
  const factory OrderItemsEvent.loadMenuItems({String? tableNumber}) = LoadMenuItemsEvent;
  const factory OrderItemsEvent.selectCategory({required String category}) = SelectCategoryEvent;
  const factory OrderItemsEvent.searchItems({required String query}) = SearchItemsEvent;
  const factory OrderItemsEvent.incrementItem({required MenuItemEntity item}) = IncrementItemEvent;
  const factory OrderItemsEvent.decrementItem({required MenuItemEntity item}) = DecrementItemEvent;
  const factory OrderItemsEvent.removeItem({required MenuItemEntity item}) = RemoveItemEvent;
  const factory OrderItemsEvent.confirmOrder({
    required String tableNumber,
    required String areaName,
  }) = ConfirmOrderEvent;
}
