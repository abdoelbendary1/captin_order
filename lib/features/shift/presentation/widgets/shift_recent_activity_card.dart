import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entities/shift_activity_entity.dart';

class ShiftRecentActivityCard extends StatelessWidget {
  final List<ShiftActivityEntity> activities;

  const ShiftRecentActivityCard({
    super.key,
    required this.activities,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.04),
            blurRadius: 10.r,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Icon(
                Icons.sensors_rounded,
                color: colorScheme.onSurface,
                size: 22.r,
              ),
              SizedBox(width: 8.w),
              Text(
                'Recent Activity',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // Timeline List
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: activities.length,
            itemBuilder: (context, index) {
              final activity = activities[index];
              final isFirst = index == 0;
              final isLast = index == activities.length - 1;

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Vertical Timeline Indicator
                  Column(
                    children: [
                      Container(
                        width: 10.r,
                        height: 10.r,
                        margin: EdgeInsets.only(top: 4.h),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isFirst
                              ? theme.primaryColor
                              : colorScheme.outlineVariant,
                        ),
                      ),
                      if (!isLast)
                        Container(
                          width: 1.5.w,
                          height: 48.h,
                          color: colorScheme.outlineVariant.withValues(alpha: 0.4),
                        ),
                    ],
                  ),
                  SizedBox(width: 12.w),

                  // Content
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: isLast ? 0 : 14.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                activity.time,
                                style: textTheme.labelSmall?.copyWith(
                                  fontFamily: 'JetBrains Mono',
                                  color: colorScheme.onSurfaceVariant,
                                  fontSize: 11.sp,
                                ),
                              ),
                              Text(
                                activity.eventType,
                                style: textTheme.labelSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: isFirst ? theme.primaryColor : colorScheme.onSurfaceVariant,
                                  fontSize: 11.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            activity.description,
                            style: textTheme.bodySmall?.copyWith(
                              fontWeight: isFirst ? FontWeight.bold : FontWeight.w500,
                              color: colorScheme.onSurface,
                              fontSize: 12.5.sp,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
