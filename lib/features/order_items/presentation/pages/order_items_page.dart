import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/services/app_notification_service.dart';
import '../../domain/entities/selected_order_item.dart';
import '../bloc/order_items_bloc.dart';
import '../bloc/order_items_event.dart';
import '../bloc/order_items_state.dart';
import '../widgets/order_item_card.dart';
import '../widgets/order_items_category_selector.dart';
import '../widgets/order_items_header.dart';
import '../widgets/order_items_search_bar.dart';
import '../widgets/order_items_summary_bar.dart';
import '../widgets/review_order_bottom_sheet.dart';

class OrderItemsPage extends StatelessWidget {
  final String tableNumber;
  final String areaName;

  const OrderItemsPage({
    super.key,
    required this.tableNumber,
    required this.areaName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderItemsBloc>(
      create: (context) =>
          getIt<OrderItemsBloc>()..add(OrderItemsEvent.loadMenuItems(tableNumber: tableNumber)),
      child: OrderItemsView(
        tableNumber: tableNumber,
        areaName: areaName,
      ),
    );
  }
}

class OrderItemsView extends StatelessWidget {
  final String tableNumber;
  final String areaName;

  const OrderItemsView({
    super.key,
    required this.tableNumber,
    required this.areaName,
  });

  void _openReviewBottomSheet(
    BuildContext context,
  ) {
    ReviewOrderBottomSheet.show(
      context,
      onIncrement: (item) {
        context.read<OrderItemsBloc>().add(
              OrderItemsEvent.incrementItem(item: item),
            );
      },
      onDecrement: (item) {
        context.read<OrderItemsBloc>().add(
              OrderItemsEvent.decrementItem(item: item),
            );
      },
      onRemove: (item) {
        context.read<OrderItemsBloc>().add(
              OrderItemsEvent.removeItem(item: item),
            );
      },
      onConfirmAndSubmit: () {
        context.read<OrderItemsBloc>().add(
              OrderItemsEvent.confirmOrder(
                tableNumber: tableNumber,
                areaName: areaName,
              ),
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocConsumer<OrderItemsBloc, OrderItemsState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (message) {
            AppNotificationService.showError(context, message);
          },
          confirmed: (table) {
            // 1. Dismiss bottom sheet if open
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }

            // 2. Show overlay success notification
            AppNotificationService.showSuccess(
              context,
              'Order updated for Table ${table.tableNumber}!',
            );

            // 3. Always go to TableDetailsPage (pressing back from TableDetailsPage goes to Home)
            TableDetailsRoute(tableId: table.id).go(context);
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 1. Header (Settings & Profile)
                const OrderItemsHeader(),

                // 2. Search Bar
                OrderItemsSearchBar(
                  onChanged: (query) {
                    context.read<OrderItemsBloc>().add(
                          OrderItemsEvent.searchItems(query: query),
                        );
                  },
                ),
                const SizedBox(height: 8.0),

                // 3. Category Selector Chips
                state.maybeWhen(
                  success: (_, __, ___, categories, selectedCategory, ____, _____) =>
                      OrderItemsCategorySelector(
                    categories: categories,
                    selectedCategory: selectedCategory,
                    onCategorySelected: (cat) {
                      context.read<OrderItemsBloc>().add(
                            OrderItemsEvent.selectCategory(category: cat),
                          );
                    },
                  ),
                  orElse: () => const SizedBox.shrink(),
                ),
                const SizedBox(height: 14.0),

                // 4. Menu Items Grid
                Expanded(
                  child: state.map(
                    loading: (_) => const Center(child: CircularProgressIndicator()),
                    error: (err) => Center(child: Text(err.message)),
                    confirmed: (_) => const SizedBox.shrink(),
                    success: (successState) {
                      return GridView.builder(
                        padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 16.0),
                        physics: const BouncingScrollPhysics(),
                        itemCount: successState.filteredItems.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 12.0,
                          childAspectRatio: 1.1,
                        ),
                        itemBuilder: (context, index) {
                          final item = successState.filteredItems[index];

                          final selectedEntry = successState.selectedItems
                              .cast<SelectedOrderItem?>()
                              .firstWhere(
                                (e) => e?.item.id == item.id,
                                orElse: () => null,
                              );

                          final qty = selectedEntry?.quantity ?? 0;

                          return OrderItemCard(
                            item: item,
                            selectedQuantity: qty,
                            onTap: () {
                              context.read<OrderItemsBloc>().add(
                                    OrderItemsEvent.incrementItem(item: item),
                                  );
                            },
                            onLongPress: () {
                              context.read<OrderItemsBloc>().add(
                                    OrderItemsEvent.removeItem(item: item),
                                  );
                            },
                            onDecrement: () {
                              context.read<OrderItemsBloc>().add(
                                    OrderItemsEvent.decrementItem(item: item),
                                  );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // 5. Summary & Confirmation Bottom Bar
          bottomNavigationBar: state.maybeWhen(
            success: (_, __, selectedItems, ___, ____, _____, isConfirming) {
              final totalAmount = selectedItems.fold<double>(
                0.0,
                (sum, item) => sum + (item.item.price * item.quantity),
              );
              final totalCount = selectedItems.fold<int>(
                0,
                (sum, item) => sum + item.quantity,
              );

              return OrderItemsSummaryBar(
                totalAmount: totalAmount,
                selectedCount: totalCount,
                isConfirming: isConfirming,
                onConfirm: () => _openReviewBottomSheet(context),
              );
            },
            orElse: () => const SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
