import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';

class AdminHeader extends StatelessWidget {
  final VoidCallback? onLogout;

  const AdminHeader({
    super.key,
    this.onLogout,
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
                Icons.coffee_rounded,
                color: colorScheme.onSurface,
                size: 24.r,
              ),
              SizedBox(width: 8.w),
              Text(
                AppStrings.brewMasterAdmin,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: colorScheme.onSurface,
                  fontSize: 20.sp,
                  letterSpacing: -0.3,
                ),
              ),
            ],
          ),

          // Right Circular Profile Picture Avatar & Logout Button
          Row(
            children: [
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
              if (onLogout != null) ...[
                SizedBox(width: 4.w),
                IconButton(
                  icon: Icon(
                    Icons.logout_rounded,
                    color: colorScheme.error,
                    size: 22.r,
                  ),
                  tooltip: 'Logout',
                  onPressed: onLogout,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
