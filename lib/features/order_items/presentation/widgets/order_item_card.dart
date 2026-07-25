import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../domain/entities/menu_item_entity.dart';

class OrderItemCard extends StatelessWidget {
  final MenuItemEntity item;
  final int selectedQuantity; // 0 if not selected, >=1 if selected
  final VoidCallback onTap;
  final VoidCallback onDecrement;

  const OrderItemCard({
    super.key,
    required this.item,
    required this.selectedQuantity,
    required this.onTap,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final isSelected = selectedQuantity > 0;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: isSelected
                  ? colorScheme.secondaryContainer
                  : colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: isSelected
                    ? theme.primaryColor
                    : colorScheme.outlineVariant,
                width: isSelected ? 1.5 : 1.0,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Item Name
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isSelected
                          ? colorScheme.onSecondaryContainer
                          : colorScheme.onSurface,
                    ),
                  ),
                ),
                const SizedBox(height: 6.0),
                // Price string e.g. "30 EGP"
                Text(
                  '${item.price.toStringAsFixed(0)} ${AppStrings.currency}',
                  style: textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isSelected
                        ? colorScheme.onSecondaryContainer.withValues(alpha: 0.8)
                        : colorScheme.onSurfaceVariant,
                    fontSize: 10.5,
                  ),
                ),
              ],
            ),
          ),

          // Top-Left Circular Quantity Badge (Tapping badge decrements quantity / removes item)
          if (isSelected)
            Positioned(
              top: -6.0,
              left: -6.0,
              child: GestureDetector(
                onTap: onDecrement,
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: theme.shadowColor.withValues(alpha: 0.25),
                        blurRadius: 4.0,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 24.0,
                    minHeight: 24.0,
                  ),
                  child: Center(
                    child: Text(
                      'x$selectedQuantity',
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.onPrimary,
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
