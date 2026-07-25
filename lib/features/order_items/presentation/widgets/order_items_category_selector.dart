import 'package:flutter/material.dart';

class OrderItemsCategorySelector extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  const OrderItemsCategorySelector({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return SizedBox(
      height: 40.0,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8.0),
        itemBuilder: (context, index) {
          final cat = categories[index];
          final isSelected = cat == selectedCategory;

          return GestureDetector(
            onTap: () => onCategorySelected(cat),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: isSelected
                    ? theme.primaryColor
                    : colorScheme.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  cat,
                  style: textTheme.bodySmall?.copyWith(
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    color: isSelected
                        ? colorScheme.onPrimary
                        : colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
