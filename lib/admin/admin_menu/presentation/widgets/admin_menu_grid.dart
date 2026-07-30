import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/admin_menu_item_entity.dart';
import 'admin_menu_item_card.dart';

class AdminMenuGrid extends StatelessWidget {
  final List<AdminMenuItemEntity> items;

  const AdminMenuGrid({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      final theme = Theme.of(context);
      return Center(
        child: Text(
          'No items found in this category.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            fontSize: 15.sp,
          ),
        ),
      );
    }

    return GridView.builder(
      padding: EdgeInsets.only(bottom: 88.h),
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 14.h,
        crossAxisSpacing: 14.w,
        childAspectRatio: 1.45,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return AdminMenuItemCard(item: item);
      },
    );
  }
}
