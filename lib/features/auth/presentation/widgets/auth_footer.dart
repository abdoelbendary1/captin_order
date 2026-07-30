import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.local_cafe_outlined,
                size: 20.r,
                color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
              ),
              SizedBox(width: 16.w),
              Icon(
                Icons.receipt_long_outlined,
                size: 20.r,
                color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
              ),
              SizedBox(width: 16.w),
              Icon(
                Icons.bar_chart_outlined,
                size: 20.r,
                color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            AppStrings.precisionQualityCraft,
            style: textTheme.labelSmall?.copyWith(
              fontFamily: 'JetBrains Mono',
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
              fontSize: 10.sp,
            ),
          ),
        ],
      ),
    );
  }
}
