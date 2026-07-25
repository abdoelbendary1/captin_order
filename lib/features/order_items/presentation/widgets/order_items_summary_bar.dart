import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';

class OrderItemsSummaryBar extends StatelessWidget {
  final double totalAmount;
  final int selectedCount;
  final bool isConfirming;
  final VoidCallback onConfirm;

  const OrderItemsSummaryBar({
    super.key,
    required this.totalAmount,
    required this.selectedCount,
    required this.isConfirming,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final isDisabled = selectedCount == 0 || isConfirming;

    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerLowest,
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withValues(alpha: 0.08),
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$selectedCount ${AppStrings.itemsSelectedLabel}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontSize: 11.0,
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          AppStrings.totalLabel,
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(width: 6.0),
                        Text(
                          '${totalAmount.toStringAsFixed(2)} ${AppStrings.currency}',
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12.0),
            ElevatedButton(
              onPressed: isDisabled ? null : onConfirm,
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.primaryColor,
                minimumSize: const Size(130.0, 44.0),
                maximumSize: const Size(180.0, 44.0),
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 0,
              ),
              child: isConfirming
                  ? SizedBox(
                      width: 20.0,
                      height: 20.0,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                        color: colorScheme.onPrimary,
                      ),
                    )
                  : Text(
                      AppStrings.confirmOrder,
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onPrimary,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
