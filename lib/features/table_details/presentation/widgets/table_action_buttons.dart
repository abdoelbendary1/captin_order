import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../active_tables/domain/entities/table_entity.dart';

class TableActionButtons extends StatelessWidget {
  final TableEntity table;
  final VoidCallback onAddItem;
  final VoidCallback onRequestCheck;
  final ValueChanged<String> onMoveTable;

  const TableActionButtons({
    super.key,
    required this.table,
    required this.onAddItem,
    required this.onRequestCheck,
    required this.onMoveTable,
  });

  void _showMoveTableDialog(BuildContext context) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text(AppStrings.moveTableTitle),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: AppStrings.enterNewTableHint,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text(AppStrings.cancel),
            ),
            ElevatedButton(
              onPressed: () {
                final newNum = controller.text.trim();
                if (newNum.isNotEmpty) {
                  Navigator.of(ctx).pop();
                  onMoveTable(newNum);
                }
              },
              child: Text(AppStrings.move),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Column(
      children: [
        // 1. Add Item Button (Dark Espresso, Icon on Top)
        SizedBox(
          width: double.infinity,
          height: 60.h,
          child: ElevatedButton(
            onPressed: onAddItem,
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.primaryColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_circle_outline_rounded,
                  color: colorScheme.onPrimary,
                  size: 20.r,
                ),
                SizedBox(height: 2.h),
                Text(
                  AppStrings.addItem,
                  style: textTheme.titleSmall?.copyWith(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.h),

        // 2. Request Check Button (Light Gray Container, Icon on Top)
        SizedBox(
          width: double.infinity,
          height: 60.h,
          child: ElevatedButton(
            onPressed: onRequestCheck,
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.6),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
                side: BorderSide(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.payments_outlined,
                  color: colorScheme.onSurface,
                  size: 20.r,
                ),
                SizedBox(height: 2.h),
                Text(
                  AppStrings.requestCheck,
                  style: textTheme.titleSmall?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.h),

        // 3. Move Table Button (Outlined)
        SizedBox(
          width: double.infinity,
          height: 48.h,
          child: OutlinedButton(
            onPressed: () => _showMoveTableDialog(context),
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: colorScheme.outlineVariant,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.swap_horiz_rounded,
                  color: colorScheme.onSurface,
                  size: 20.r,
                ),
                SizedBox(width: 8.w),
                Text(
                  AppStrings.moveTable,
                  style: textTheme.titleSmall?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.5.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
