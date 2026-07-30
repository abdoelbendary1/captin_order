import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../domain/entities/admin_staff_entity.dart';

class StaffCard extends StatelessWidget {
  final AdminStaffEntity staff;
  final VoidCallback? onEditPin;

  const StaffCard({
    super.key,
    required this.staff,
    this.onEditPin,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.04),
            blurRadius: 10.r,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Circular Avatar
          CircleAvatar(
            radius: 24.r,
            backgroundColor: colorScheme.primaryContainer,
            child: Icon(
              Icons.person_rounded,
              color: colorScheme.onPrimaryContainer,
              size: 26.r,
            ),
          ),
          SizedBox(width: 14.w),

          // Name & Role
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  staff.name,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  staff.role,
                  style: textTheme.bodySmall?.copyWith(
                    fontFamily: 'JetBrains Mono',
                    color: colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),

          // PIN & Edit Pencil Icon
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                AppStrings.pin,
                style: textTheme.labelSmall?.copyWith(
                  fontFamily: 'JetBrains Mono',
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                  fontSize: 10.sp,
                ),
              ),
              SizedBox(height: 2.h),
              Row(
                children: [
                  Text(
                    staff.pin,
                    style: textTheme.bodyMedium?.copyWith(
                      fontFamily: 'JetBrains Mono',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      color: colorScheme.onSurface,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  GestureDetector(
                    onTap: onEditPin,
                    child: Icon(
                      Icons.edit_outlined,
                      color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                      size: 16.r,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
