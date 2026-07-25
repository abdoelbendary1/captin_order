import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.05),
            blurRadius: 6.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Icon + "Active Order" + Items Badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.receipt_long_rounded,
                    color: colorScheme.onSurface,
                    size: 22.0,
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    AppStrings.activeOrder,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  '$itemsCount ${AppStrings.itemsSuffix}',
                  style: textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSecondaryContainer,
                    fontSize: 10.0,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),

          // Items List
          if (table.items.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                AppStrings.noItemsAdded,
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            )
          else
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: table.items.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8.0),
              itemBuilder: (context, index) {
                final item = table.items[index];
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLow.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '${item.quantity}x',
                        style: textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.primaryColor,
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      Expanded(
                        child: Text(
                          item.name,
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ),
                      Text(
                        '${(item.price * item.quantity).toStringAsFixed(2)} ${AppStrings.currency}',
                        style: textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

          const Divider(height: 24.0),

          // Financial Breakdown
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
                AppStrings.totalLabel,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
              Text(
                '${total.toStringAsFixed(2)} ${AppStrings.currency}',
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
