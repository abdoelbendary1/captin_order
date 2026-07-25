import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../active_tables/domain/entities/table_entity.dart';
import '../../domain/entities/menu_item_entity.dart';
import '../../domain/entities/selected_order_item.dart';

part 'order_items_state.freezed.dart';

@freezed
class OrderItemsState with _$OrderItemsState {
  const factory OrderItemsState.loading() = LoadingState;
  const factory OrderItemsState.error({required String message}) = ErrorState;
  const factory OrderItemsState.success({
    required List<MenuItemEntity> allItems,
    required List<MenuItemEntity> filteredItems,
    required List<SelectedOrderItem> selectedItems,
    required List<String> categories,
    required String selectedCategory,
    @Default('') String searchQuery,
    @Default(false) bool isConfirming,
  }) = SuccessState;
  const factory OrderItemsState.confirmed({required TableEntity table}) = ConfirmedState;
}
