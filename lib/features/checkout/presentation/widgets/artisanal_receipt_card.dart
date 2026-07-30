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

    final subtotal = table.items.fold<double>(
      0.0,
      (sum, i) => sum + (i.price * i.quantity),
    );
    final tax = subtotal * 0.08;
    final totalAmount = subtotal + tax + tipAmount;

    final formattedTime = table.openedAt != null
        ? '${table.openedAt!.hour.toString().padLeft(2, '0')}:${table.openedAt!.minute.toString().padLeft(2, '0')} PM'
        : '14:22 PM';

    return ClipPath(
      clipper: const SerratedEdgeClipper(
        triangleWidth: 10.0,
        triangleHeight: 8.0,
      ),
      child: Container(
        color: colorScheme.surfaceContainerLowest, // Theme White (#FFFFFF)
        padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 24.h),
        child: Column(
          children: [
            // 1. Title & Subtitle (Monospace)
            Text(
              AppStrings.shopCaptain,
              style: textTheme.titleMedium?.copyWith(
                fontFamily: 'JetBrains Mono',
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                color: colorScheme.onSurface,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              '${AppStrings.artisanalWorkspace} • Order #${table.id.length > 4 ? table.id.substring(table.id.length - 4) : '8821'}',
              style: textTheme.labelSmall?.copyWith(
                fontFamily: 'JetBrains Mono',
                color: colorScheme.onSurfaceVariant,
                fontSize: 11.sp,
              ),
            ),
            SizedBox(height: 16.h),

            // Dotted Divider
            const _DottedLine(),
            SizedBox(height: 16.h),

            // 2. Status Banner
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
            //   decoration: BoxDecoration(
            //     color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.35),
            //     borderRadius: BorderRadius.circular(10.r),
            //     border: Border(
            //       left: BorderSide(
            //         color: theme.primaryColor,
            //         width: 4.w,
            //       ),
            //     ),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             AppStrings.statusLabel,
            //             style: textTheme.labelSmall?.copyWith(
            //               fontFamily: 'JetBrains Mono',
            //               color: colorScheme.onSurfaceVariant,
            //               fontSize: 10.sp,
            //             ),
            //           ),
            //           SizedBox(height: 2.h),
            //           Text(
            //             AppStrings.readyForCheckout,
            //             style: textTheme.bodyMedium?.copyWith(
            //               fontWeight: FontWeight.bold,
            //               color: colorScheme.onSurface,
            //               fontSize: 15.sp,
            //             ),
            //           ),
            //         ],
            //       ),
            //       Icon(
            //         Icons.check_circle_rounded,
            //         color: theme.primaryColor,
            //         size: 24.r,
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 18.h),

            // 3. Itemized Receipt Items (Monospace)
            if (table.items.isEmpty)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Text(
                  AppStrings.noItemsAdded,
                  style: textTheme.bodySmall?.copyWith(
                    fontFamily: 'JetBrains Mono',
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              )
            else
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: table.items.length,
                separatorBuilder: (_, __) => SizedBox(height: 10.h),
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
                              fontFamily: 'JetBrains Mono',
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onSurface,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            item.name,
                            style: textTheme.bodyMedium?.copyWith(
                              fontFamily: 'JetBrains Mono',
                              color: colorScheme.onSurface,
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${AppStrings.currencySymbol}${(item.price * item.quantity).toStringAsFixed(2)}',
                        style: textTheme.bodyMedium?.copyWith(
                          fontFamily: 'JetBrains Mono',
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  );
                },
              ),

            SizedBox(height: 18.h),
            const _DottedLine(),
            SizedBox(height: 16.h),

            // 4. Subtotal & Tax Breakdown (Monospace)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.subtotal,
                  style: textTheme.bodySmall?.copyWith(
                    fontFamily: 'JetBrains Mono',
                    color: colorScheme.onSurfaceVariant,
                    fontSize: 12.sp,
                  ),
                ),
                Text(
                  '${AppStrings.currencySymbol}${subtotal.toStringAsFixed(2)}',
                  style: textTheme.bodySmall?.copyWith(
                    fontFamily: 'JetBrains Mono',
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.tax8Percent,
                  style: textTheme.bodySmall?.copyWith(
                    fontFamily: 'JetBrains Mono',
                    color: colorScheme.onSurfaceVariant,
                    fontSize: 12.sp,
                  ),
                ),
                Text(
                  '${AppStrings.currencySymbol}${tax.toStringAsFixed(2)}',
                  style: textTheme.bodySmall?.copyWith(
                    fontFamily: 'JetBrains Mono',
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
            if (tipAmount > 0) ...[
              SizedBox(height: 6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.tipAmountLabel,
                    style: textTheme.bodySmall?.copyWith(
                      fontFamily: 'JetBrains Mono',
                      color: colorScheme.onSurfaceVariant,
                      fontSize: 12.sp,
                    ),
                  ),
                  Text(
                    '${AppStrings.currencySymbol}${tipAmount.toStringAsFixed(2)}',
                    style: textTheme.bodySmall?.copyWith(
                      fontFamily: 'JetBrains Mono',
                      fontWeight: FontWeight.w600,
                      color: theme.primaryColor,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ],

            SizedBox(height: 14.h),

            // 5. Total Amount Line
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.totalAmountLabel,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                    fontSize: 17.sp,
                  ),
                ),
                Text(
                  '${AppStrings.currencySymbol}${totalAmount.toStringAsFixed(2)}',
                  style: textTheme.titleLarge?.copyWith(
                    fontFamily: 'JetBrains Mono',
                    fontWeight: FontWeight.w800,
                    color: colorScheme.onSurface,
                    fontSize: 22.sp,
                  ),
                ),
              ],
            ),

            SizedBox(height: 22.h),

            // 6. Footer metadata: Table & Captain & Time (Monospace)
            Text(
              'Table ${table.tableNumber} • Waiter: Captain Portrait • $formattedTime',
              style: textTheme.labelSmall?.copyWith(
                fontFamily: 'JetBrains Mono',
                color: colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
                fontSize: 10.sp,
              ),
            ),
            SizedBox(height: 14.h),

            // Barcode Representation
            BarcodeWidget(height: 36.h),
            SizedBox(height: 8.h),
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
              child: DecoratedBox(decoration: BoxDecoration(color: color)),
            );
          }),
        );
      },
    );
  }
}
