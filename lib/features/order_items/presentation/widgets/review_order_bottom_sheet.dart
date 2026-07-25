import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_strings.dart';
import '../../domain/entities/menu_item_entity.dart';
import '../../domain/entities/selected_order_item.dart';
import '../bloc/order_items_bloc.dart';
import '../bloc/order_items_state.dart';

class ReviewOrderBottomSheet extends StatelessWidget {
  final ValueChanged<MenuItemEntity> onIncrement;
  final ValueChanged<MenuItemEntity> onDecrement;
  final ValueChanged<MenuItemEntity> onRemove;
  final VoidCallback onConfirmAndSubmit;

  const ReviewOrderBottomSheet({
    super.key,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
    required this.onConfirmAndSubmit,
  });

  static void show(
    BuildContext context, {
    required ValueChanged<MenuItemEntity> onIncrement,
    required ValueChanged<MenuItemEntity> onDecrement,
    required ValueChanged<MenuItemEntity> onRemove,
    required VoidCallback onConfirmAndSubmit,
  }) {
    final bloc = context.read<OrderItemsBloc>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (modalContext) {
        return BlocProvider.value(
          value: bloc,
          child: ReviewOrderBottomSheet(
            onIncrement: onIncrement,
            onDecrement: onDecrement,
            onRemove: onRemove,
            onConfirmAndSubmit: onConfirmAndSubmit,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return BlocBuilder<OrderItemsBloc, OrderItemsState>(
      builder: (context, state) {
        final List<SelectedOrderItem> selectedItems = state.maybeWhen(
          success: (_, __, items, ___, ____, _____, ______) => items,
          orElse: () => const [],
        );

        final bool isConfirming = state.maybeWhen(
          success: (_, __, ___, ____, _____, ______, confirming) => confirming,
          orElse: () => false,
        );

        final subtotal = selectedItems.fold<double>(
          0.0,
          (sum, item) => sum + (item.item.price * item.quantity),
        );
        final tax = subtotal * 0.14;
        final grandTotal = subtotal + tax;

        return Container(
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerLowest,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 20.0,
            left: 20.0,
            right: 20.0,
            top: 12.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Drag Indicator Pill
              Container(
                width: 36.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
              const SizedBox(height: 16.0),

              // Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.reviewOrder,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close_rounded, color: colorScheme.onSurface),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 12.0),

              // Selected Items List
              if (selectedItems.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(
                    AppStrings.noItemsAdded,
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                )
              else
                Flexible(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: selectedItems.length,
                    separatorBuilder: (_, __) => const Divider(height: 16.0),
                    itemBuilder: (context, index) {
                      final entry = selectedItems[index];

                      return Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  entry.item.name,
                                  style: textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: colorScheme.onSurface,
                                  ),
                                ),
                                const SizedBox(height: 2.0),
                                Text(
                                  '${entry.item.price.toStringAsFixed(2)} ${AppStrings.currency}',
                                  style: textTheme.labelSmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Quantity Selector Controls
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  entry.quantity == 1
                                      ? Icons.delete_outline_rounded
                                      : Icons.remove_circle_outline_rounded,
                                  color: colorScheme.error,
                                  size: 20.0,
                                ),
                                onPressed: () {
                                  if (entry.quantity == 1) {
                                    onRemove(entry.item);
                                  } else {
                                    onDecrement(entry.item);
                                  }
                                },
                              ),
                              Text(
                                '${entry.quantity}',
                                style: textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.onSurface,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.add_circle_outline_rounded,
                                  color: theme.primaryColor,
                                  size: 20.0,
                                ),
                                onPressed: () => onIncrement(entry.item),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),

              const Divider(height: 24.0),

              // Summary Calculation Lines
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.subtotal,
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    '${subtotal.toStringAsFixed(2)} ${AppStrings.currency}',
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.tax14Percent,
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    '${tax.toStringAsFixed(2)} ${AppStrings.currency}',
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.totalAmountLabel,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    '${grandTotal.toStringAsFixed(2)} ${AppStrings.currency}',
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.primaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),

              // Confirm & Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (selectedItems.isEmpty || isConfirming)
                      ? null
                      : onConfirmAndSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 0,
                  ),
                  child: isConfirming
                      ? SizedBox(
                          width: 22.0,
                          height: 22.0,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: colorScheme.onPrimary,
                          ),
                        )
                      : Text(
                          AppStrings.confirmAndSubmitOrder,
                          style: textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
