import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../active_tables/domain/entities/table_entity.dart';

class TableActiveOrderCard extends StatelessWidget {
  final TableEntity table;

  const TableActiveOrderCard({
    super.key,
    required this.table,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final itemsCount = table.items.fold<int>(0, (sum, i) => sum + i.quantity);
    final subtotal = table.items.fold<double>(0.0, (sum, i) => sum + (i.price * i.quantity));
    final tax = subtotal * 0.14;
    final total = subtotal + tax;

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border(
          left: BorderSide(
            color: theme.primaryColor,
            width: 4.w,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.05),
            blurRadius: 8.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Header: Icon + "Active Order" + Badge "X ITEMS"
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.receipt_long_outlined,
                    color: colorScheme.onSurface,
                    size: 20.r,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    AppStrings.activeOrder,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: colorScheme.onSurface,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  '$itemsCount ${AppStrings.itemsSuffix}',
                  style: textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSecondaryContainer,
                    fontSize: 10.sp,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // 2. Alternating Items List
          if (table.items.isEmpty)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Text(
                AppStrings.noItemsAdded,
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            )
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: table.items.length,
              itemBuilder: (context, index) {
                final item = table.items[index];
                final isEven = index % 2 == 1;

                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    color: isEven
                        ? colorScheme.surfaceContainerHighest.withValues(alpha: 0.3)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Row(
                    children: [
                      // Quantity Tag e.g. 2x
                      Text(
                        '${item.quantity}x',
                        style: textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.primaryColor,
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      // Item Name
                      Expanded(
                        child: Text(
                          item.name,
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurface,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      // Price
                      Text(
                        '${(item.price * item.quantity).toStringAsFixed(2)} ${AppStrings.currency}',
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

          SizedBox(height: 12.h),
          Divider(height: 1.h, color: colorScheme.outlineVariant.withValues(alpha: 0.4)),
          SizedBox(height: 14.h),

          // 3. Financial Breakdown (Subtotal, Tax, Total)
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
                  fontWeight: FontWeight.w500,
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
                  fontWeight: FontWeight.w500,
                  color: colorScheme.onSurfaceVariant,
                  fontSize: 13.5.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.totalLabel,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                  fontSize: 16.sp,
                ),
              ),
              Text(
                '${total.toStringAsFixed(2)} ${AppStrings.currency}',
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
    );
  }
}
