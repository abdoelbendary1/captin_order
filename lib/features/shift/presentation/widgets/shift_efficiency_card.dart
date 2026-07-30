import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShiftEfficiencyCard extends StatelessWidget {
  final String avgPrepTime;
  final double customerSatisfaction;

  const ShiftEfficiencyCard({
    super.key,
    required this.avgPrepTime,
    required this.customerSatisfaction,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final satisfactionRatio = (customerSatisfaction / 5.0).clamp(0.0, 1.0);

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
          Text(
            'Efficiency',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 16.h),

          // Metric 1: Avg. Prep Time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Avg. Prep Time',
                style: textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                  fontSize: 12.5.sp,
                ),
              ),
              Text(
                avgPrepTime,
                style: textTheme.labelSmall?.copyWith(
                  fontFamily: 'JetBrains Mono',
                  color: colorScheme.onSurfaceVariant,
                  fontSize: 11.5.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: LinearProgressIndicator(
              value: 0.75,
              minHeight: 6.h,
              backgroundColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
              valueColor: AlwaysStoppedAnimation<Color>(
                theme.primaryColor,
              ),
            ),
          ),
          SizedBox(height: 16.h),

          // Metric 2: Customer Satisfaction
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Customer Satisfaction',
                style: textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                  fontSize: 12.5.sp,
                ),
              ),
              Text(
                '${customerSatisfaction.toStringAsFixed(1)}/5.0',
                style: textTheme.labelSmall?.copyWith(
                  fontFamily: 'JetBrains Mono',
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                  fontSize: 11.5.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: LinearProgressIndicator(
              value: satisfactionRatio,
              minHeight: 6.h,
              backgroundColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
              valueColor: AlwaysStoppedAnimation<Color>(
                colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
