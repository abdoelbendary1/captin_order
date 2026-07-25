import 'package:freezed_annotation/freezed_annotation.dart';
import 'menu_item_entity.dart';

part 'selected_order_item.freezed.dart';

@freezed
abstract class SelectedOrderItem with _$SelectedOrderItem {
  const factory SelectedOrderItem({
    required MenuItemEntity item,
    @Default(1) int quantity,
  }) = _SelectedOrderItem;
}
