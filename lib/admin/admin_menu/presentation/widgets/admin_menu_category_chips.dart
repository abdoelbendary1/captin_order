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
      height: 42.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length + 1,
        separatorBuilder: (context, index) => SizedBox(width: 10.w),
        itemBuilder: (context, index) {
          if (index == 0) {
            final isSelected = selectedCategoryId == null || selectedCategoryId == 'all';
            return _CategoryChip(
              label: 'All',
              isSelected: isSelected,
              onTap: () => onSelectCategory('all'),
              textTheme: textTheme,
              colorScheme: colorScheme,
            );
          }

          final category = categories[index - 1];
          final isSelected = selectedCategoryId == category.id;

          return _CategoryChip(
            label: category.name,
            isSelected: isSelected,
            onTap: () => onSelectCategory(category.id),
            textTheme: textTheme,
            colorScheme: colorScheme,
          );
        },
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const _CategoryChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.textTheme,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    final activeBg = const Color(0xFF33261D);
    final inactiveBg = const Color(0xFFFAF7F2);
    final inactiveBorder = const Color(0xFFE5DECE);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? activeBg : inactiveBg,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected ? activeBg : inactiveBorder,
            width: 1.w,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: textTheme.labelLarge?.copyWith(
              color: isSelected ? Colors.white : colorScheme.onSurface,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    );
  }
}
