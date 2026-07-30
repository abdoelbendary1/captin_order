import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';

class TeamHeader extends StatelessWidget {
  final bool isAuditLog;

  const TeamHeader({
    super.key,
    this.isAuditLog = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.menu_rounded,
                color: colorScheme.onSurface,
                size: 24.r,
              ),
              SizedBox(width: 12.w),
              Text(
                isAuditLog ? AppStrings.auditLog : AppStrings.cafeAdmin,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: colorScheme.onSurface,
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),

          // Right circular profile avatar
          Container(
            padding: EdgeInsets.all(2.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                width: 1.5,
              ),
            ),
            child: CircleAvatar(
              radius: 18.r,
              backgroundColor: colorScheme.secondaryContainer,
              child: Icon(
                Icons.person_rounded,
                color: colorScheme.onSecondaryContainer,
                size: 20.r,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
