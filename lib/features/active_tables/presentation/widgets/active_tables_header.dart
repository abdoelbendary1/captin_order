import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';

class ActiveTablesHeader extends StatelessWidget {
  const ActiveTablesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.activeTablesTitle,
          style: theme.textTheme.displayLarge?.copyWith(
            fontSize: 26.sp,
            fontWeight: FontWeight.w800,
            color: colorScheme.onSurface,
            height: 1.1,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          AppStrings.activeTablesSubtitle,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: 14.sp,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
