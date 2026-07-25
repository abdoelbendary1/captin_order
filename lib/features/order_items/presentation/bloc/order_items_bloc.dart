import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/menu_item_entity.dart';
import '../../domain/entities/selected_order_item.dart';
import '../../domain/repositories/order_items_repository.dart';
import 'order_items_event.dart';
import 'order_items_state.dart';

@injectable
class OrderItemsBloc extends Bloc<OrderItemsEvent, OrderItemsState> {
  final OrderItemsRepository _repository;

  OrderItemsBloc(this._repository) : super(const OrderItemsState.loading()) {
    on<LoadMenuItemsEvent>(_onLoadMenuItems);
    on<SelectCategoryEvent>(_onSelectCategory);
    on<SearchItemsEvent>(_onSearchItems);
    on<IncrementItemEvent>(_onIncrementItem);
    on<DecrementItemEvent>(_onDecrementItem);
    on<RemoveItemEvent>(_onRemoveItem);
    on<ConfirmOrderEvent>(_onConfirmOrder);
  }

  Future<void> _onLoadMenuItems(
    LoadMenuItemsEvent event,
    Emitter<OrderItemsState> emit,
  ) async {
    emit(const OrderItemsState.loading());
    final result = await _repository.getMenuItems();
    result.fold(
      (failure) => emit(OrderItemsState.error(message: failure.displayMessage)),
      (items) {
        final categories = items.map((e) => e.category).toSet().toList();
        final selectedCat = categories.isNotEmpty ? categories.first : 'All';
        final filtered = items.where((e) => e.category == selectedCat).toList();

        emit(OrderItemsState.success(
          allItems: items,
          filteredItems: filtered,
          selectedItems: const [],
          categories: categories,
          selectedCategory: selectedCat,
        ));
      },
    );
  }

  void _onSelectCategory(
    SelectCategoryEvent event,
    Emitter<OrderItemsState> emit,
  ) {
    if (state is SuccessState) {
      final currentState = state as SuccessState;
      final filtered = _filterItems(
        currentState.allItems,
        event.category,
        currentState.searchQuery,
      );

      emit(currentState.copyWith(
        selectedCategory: event.category,
        filteredItems: filtered,
      ));
    }
  }

  void _onSearchItems(
    SearchItemsEvent event,
    Emitter<OrderItemsState> emit,
  ) {
    if (state is SuccessState) {
      final currentState = state as SuccessState;
      final filtered = _filterItems(
        currentState.allItems,
        currentState.selectedCategory,
        event.query,
      );

      emit(currentState.copyWith(
        searchQuery: event.query,
        filteredItems: filtered,
      ));
    }
  }

  void _onIncrementItem(
    IncrementItemEvent event,
    Emitter<OrderItemsState> emit,
  ) {
    if (state is SuccessState) {
      final currentState = state as SuccessState;
      final currentList = List<SelectedOrderItem>.from(currentState.selectedItems);

      final index = currentList.indexWhere((e) => e.item.id == event.item.id);
      if (index >= 0) {
        final currentQty = currentList[index].quantity;
        currentList[index] = currentList[index].copyWith(quantity: currentQty + 1);
      } else {
        currentList.add(SelectedOrderItem(item: event.item, quantity: 1));
      }

      emit(currentState.copyWith(selectedItems: currentList));
    }
  }

  void _onDecrementItem(
    DecrementItemEvent event,
    Emitter<OrderItemsState> emit,
  ) {
    if (state is SuccessState) {
      final currentState = state as SuccessState;
      final currentList = List<SelectedOrderItem>.from(currentState.selectedItems);

      final index = currentList.indexWhere((e) => e.item.id == event.item.id);
      if (index >= 0) {
        final currentQty = currentList[index].quantity;
        if (currentQty > 1) {
          currentList[index] = currentList[index].copyWith(quantity: currentQty - 1);
        } else {
          currentList.removeAt(index);
        }
      }

      emit(currentState.copyWith(selectedItems: currentList));
    }
  }

  void _onRemoveItem(
    RemoveItemEvent event,
    Emitter<OrderItemsState> emit,
  ) {
    if (state is SuccessState) {
      final currentState = state as SuccessState;
      final currentList = List<SelectedOrderItem>.from(currentState.selectedItems);
      currentList.removeWhere((e) => e.item.id == event.item.id);
      emit(currentState.copyWith(selectedItems: currentList));
    }
  }

  Future<void> _onConfirmOrder(
    ConfirmOrderEvent event,
    Emitter<OrderItemsState> emit,
  ) async {
    if (state is SuccessState) {
      final currentState = state as SuccessState;
      if (currentState.selectedItems.isEmpty) return;

      emit(currentState.copyWith(isConfirming: true));

      final total = currentState.selectedItems.fold<double>(
        0.0,
        (sum, item) => sum + (item.item.price * item.quantity),
      );

      final result = await _repository.confirmOrder(
        tableNumber: event.tableNumber,
        areaName: event.areaName,
        items: currentState.selectedItems,
        totalAmount: total,
      );

      result.fold(
        (failure) {
          emit(OrderItemsState.error(message: failure.displayMessage));
        },
        (table) => emit(OrderItemsState.confirmed(table: table)),
      );
    }
  }

  List<MenuItemEntity> _filterItems(
    List<MenuItemEntity> all,
    String category,
    String query,
  ) {
    final trimmedQuery = query.toLowerCase().trim();
    return all.where((e) {
      final matchesCategory = category == 'All' || e.category == category;
      final matchesQuery = trimmedQuery.isEmpty || e.name.toLowerCase().contains(trimmedQuery);
      return matchesCategory && matchesQuery;
    }).toList();
  }
}
