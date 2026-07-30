import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../active_tables/domain/entities/timeline_event.dart';

class OrderTimelineView extends StatelessWidget {
  final List<TimelineEvent> timeline;

  const OrderTimelineView({
    super.key,
    required this.timeline,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.orderTimeline,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 14.h),
        if (timeline.isEmpty)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Text(
              'No timeline events recorded.',
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          )
        else
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: timeline.length,
            itemBuilder: (context, index) {
              final event = timeline[index];
              final isLast = index == timeline.length - 1;
              final isFirst = index == 0;

              final timeStr =
                  '${event.timestamp.hour.toString().padLeft(2, '0')}:${event.timestamp.minute.toString().padLeft(2, '0')}';

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Dot and line
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
                              : colorScheme.outlineVariant.withValues(alpha: 0.8),
                        ),
                      ),
                      if (!isLast)
                        Container(
                          width: 1.5.w,
                          height: 38.h,
                          color: colorScheme.outlineVariant.withValues(alpha: 0.4),
                        ),
                    ],
                  ),
                  SizedBox(width: 12.w),
                  // Event details
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: isLast ? 0 : 12.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            event.title,
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: isFirst ? FontWeight.bold : FontWeight.w600,
                              color: isFirst
                                  ? colorScheme.onSurface
                                  : colorScheme.onSurfaceVariant,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            '$timeStr • ${event.actor}',
                            style: textTheme.labelSmall?.copyWith(
                              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
                              fontSize: 11.sp,
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
    );
  }
}
