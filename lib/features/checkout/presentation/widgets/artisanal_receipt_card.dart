import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../active_tables/domain/entities/table_entity.dart';
import 'barcode_widget.dart';
import 'serrated_edge_clipper.dart';

class ArtisanalReceiptCard extends StatelessWidget {
  final TableEntity table;
  final double tipAmount;

  const ArtisanalReceiptCard({
    super.key,
    required this.table,
    this.tipAmount = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final subtotal = table.items.fold<double>(0.0, (sum, i) => sum + (i.price * i.quantity));
    final tax = subtotal * 0.08;
    final totalAmount = subtotal + tax + tipAmount;

    final formattedTime = table.openedAt != null
        ? '${table.openedAt!.hour.toString().padLeft(2, '0')}:${table.openedAt!.minute.toString().padLeft(2, '0')} PM'
        : '14:22 PM';

    return ClipPath(
      clipper: const SerratedEdgeClipper(triangleWidth: 10.0, triangleHeight: 8.0),
      child: Container(
        color: colorScheme.surfaceContainerLowest,
        padding: const EdgeInsets.fromLTRB(20.0, 24.0, 20.0, 24.0),
        child: Column(
          children: [
            // Title & Subtitle
            Text(
              AppStrings.shopCaptain,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              '${AppStrings.artisanalWorkspace} • Order #${table.id.length > 4 ? table.id.substring(table.id.length - 4) : '8821'}',
              style: textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontSize: 11.0,
              ),
            ),
            const SizedBox(height: 16.0),

            // Dotted Divider
            const _DottedLine(),
            const SizedBox(height: 16.0),

            // Status Banner
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
              decoration: BoxDecoration(
                color: colorScheme.secondaryContainer.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(10.0),
                border: Border(
                  left: BorderSide(
                    color: theme.primaryColor,
                    width: 3.5,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.statusLabel,
                        style: textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontSize: 10.0,
                        ),
                      ),
                      const SizedBox(height: 2.0),
                      Text(
                        AppStrings.readyForCheckout,
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSecondaryContainer,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.check_circle_rounded,
                    color: theme.primaryColor,
                    size: 24.0,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),

            // Items List
            if (table.items.isEmpty)
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 10.h ),
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
                separatorBuilder: (_, __) => const SizedBox(height: 10.0),
                itemBuilder: (context, index) {
                  final item = table.items[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${item.quantity}x',
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Text(
                            item.name,
                            style: textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurface,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${(item.price * item.quantity).toStringAsFixed(2)} ${AppStrings.currency}',
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ],
                  );
                },
              ),

            const SizedBox(height: 16.0),
            const _DottedLine(),
            const SizedBox(height: 16.0),

            // Subtotal & Tax Breakdown
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.subtotal,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  '${subtotal.toStringAsFixed(2)} ${AppStrings.currency}',
                  style: textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.tax8Percent,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  '${tax.toStringAsFixed(2)} ${AppStrings.currency}',
                  style: textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            if (tipAmount > 0) ...[
              const SizedBox(height: 6.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.tipAmountLabel,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    '${tipAmount.toStringAsFixed(2)} ${AppStrings.currency}',
                    style: textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.primaryColor,
                    ),
                  ),
                ],
              ),
            ],

            const SizedBox(height: 12.0),

            // Total Amount Line
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
                  '${totalAmount.toStringAsFixed(2)} ${AppStrings.currency}',
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.primaryColor,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20.0),

            // Footer metadata: Table & Captain & Time
            Text(
              'Table ${table.tableNumber} • ${AppStrings.waiter}: ${table.assignedCaptain ?? AppStrings.captainName} • $formattedTime',
              style: textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
                fontSize: 10.0,
              ),
            ),
            const SizedBox(height: 12.0),

            // Barcode Representation
            const BarcodeWidget(height: 32.0),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}

class _DottedLine extends StatelessWidget {
  const _DottedLine();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme.outlineVariant.withValues(alpha: 0.6);

    return LayoutBuilder(
      builder: (context, constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 4.0;
        const dashSpace = 3.0;
        final dashCount = (boxWidth / (dashWidth + dashSpace)).floor();

        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: 1.0,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
