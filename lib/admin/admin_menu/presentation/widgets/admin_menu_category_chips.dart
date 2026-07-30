import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/admin_menu_category_entity.dart';

class AdminMenuCategoryChips extends StatelessWidget {
  final List<AdminMenuCategoryEntity> categories;
  final String? selectedCategoryId;
  final ValueChanged<String> onSelectCategory;

  const AdminMenuCategoryChips({
    super.key,
    required this.categories,
    required this.selectedCategoryId,
    required this.onSelectCategory,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length + 1,
        separatorBuilder: (_, __) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          if (index == 0) {
            final isSelected = selectedCategoryId == null || selectedCategoryId == 'all';
            return ChoiceChip(
              label: const Text('All Items'),
              selected: isSelected,
              onSelected: (_) => onSelectCategory('all'),
              selectedColor: theme.primaryColor,
              labelStyle: textTheme.labelMedium?.copyWith(
                color: isSelected ? colorScheme.onPrimary : colorScheme.onSurface,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
            );
          }

          final category = categories[index - 1];
          final isSelected = selectedCategoryId == category.id;

          return ChoiceChip(
            label: Text(category.name),
            selected: isSelected,
            onSelected: (_) => onSelectCategory(category.id),
            selectedColor: theme.primaryColor,
            labelStyle: textTheme.labelMedium?.copyWith(
              color: isSelected ? colorScheme.onPrimary : colorScheme.onSurface,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
          );
        },
      ),
    );
  }
}
