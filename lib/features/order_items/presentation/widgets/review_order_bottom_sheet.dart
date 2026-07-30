import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            color: colorScheme.surface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
          ),
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 16.h,
            top: 10.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 1. Drag Handle
              Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              SizedBox(height: 12.h),

              // 2. Header Row (Title + Circular Close X Button)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.reviewOrder,
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: colorScheme.onSurface,
                        fontSize: 20.sp,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        width: 36.r,
                        height: 36.r,
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.6),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Icon(
                          Icons.close_rounded,
                          color: colorScheme.onSurface,
                          size: 18.r,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Divider(height: 1.h, color: colorScheme.outlineVariant.withValues(alpha: 0.3)),
              SizedBox(height: 16.h),

              // 3. Item Cards List
              if (selectedItems.isEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.h),
                  child: Text(
                    AppStrings.noItemsAdded,
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                )
              else
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.4,
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    physics: const BouncingScrollPhysics(),
                    itemCount: selectedItems.length,
                    separatorBuilder: (_, __) => SizedBox(height: 12.h),
                    itemBuilder: (context, index) {
                      final entry = selectedItems[index];

                      return Container(
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.35),
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border(
                            left: BorderSide(
                              color: theme.primaryColor,
                              width: 4.w,
                            ),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                        child: Row(
                          children: [
                            // Item Title & Price
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    entry.item.name,
                                    style: textTheme.titleSmall?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: colorScheme.onSurface,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SizedBox(height: 3.h),
                                  Text(
                                    '${entry.item.price.toStringAsFixed(0)} ${AppStrings.currency}',
                                    style: textTheme.bodySmall?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Quantity controls: [-] qty [+]
                            Row(
                              children: [
                                _QuantityButton(
                                  icon: Icons.remove_rounded,
                                  onTap: () {
                                    if (entry.quantity == 1) {
                                      onRemove(entry.item);
                                    } else {
                                      onDecrement(entry.item);
                                    }
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Text(
                                    '${entry.quantity}',
                                    style: textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: colorScheme.onSurface,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ),
                                _QuantityButton(
                                  icon: Icons.add_rounded,
                                  onTap: () => onIncrement(entry.item),
                                ),
                              ],
                            ),

                            SizedBox(width: 8.w),

                            // Delete Trash Button
                            GestureDetector(
                              onTap: () => onRemove(entry.item),
                              child: Padding(
                                padding: EdgeInsets.all(4.r),
                                child: Icon(
                                  Icons.delete_outline_rounded,
                                  color: const Color(0xFFC62828),
                                  size: 20.r,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

              SizedBox(height: 20.h),

              // 4. Subtotal, Tax, Total Amount Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.subtotal,
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            fontSize: 13.5.sp,
                          ),
                        ),
                        Text(
                          '${subtotal.toStringAsFixed(2)} ${AppStrings.currency}',
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurfaceVariant,
                            fontSize: 13.5.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.tax14Percent,
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            fontSize: 13.5.sp,
                          ),
                        ),
                        Text(
                          '${tax.toStringAsFixed(2)} ${AppStrings.currency}',
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurfaceVariant,
                            fontSize: 13.5.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Divider(height: 1.h, color: colorScheme.outlineVariant.withValues(alpha: 0.4)),
                    SizedBox(height: 12.h),

                    // Grand Total Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.totalAmountLabel,
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                            fontSize: 16.sp,
                          ),
                        ),
                        Text(
                          '${grandTotal.toStringAsFixed(2)} ${AppStrings.currency}',
                          style: textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: colorScheme.onSurface,
                            fontSize: 20.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              // 5. Confirm & Submit Order Full-Width Primary Button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SizedBox(
                  width: double.infinity,
                  height: 52.h,
                  child: ElevatedButton(
                    onPressed: (selectedItems.isEmpty || isConfirming)
                        ? null
                        : onConfirmAndSubmit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: isConfirming
                        ? SizedBox(
                            width: 22.r,
                            height: 22.r,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              color: colorScheme.onPrimary,
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.confirmAndSubmitOrder,
                                style: textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.onPrimary,
                                  fontSize: 15.sp,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Icon(
                                Icons.arrow_forward_rounded,
                                color: colorScheme.onPrimary,
                                size: 18.r,
                              ),
                            ],
                          ),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
            ],
          ),
        );
      },
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QuantityButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32.r,
        height: 32.r,
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.7),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Icon(
          icon,
          size: 16.r,
          color: colorScheme.onSurface,
        ),
      ),
    );
  }
}
