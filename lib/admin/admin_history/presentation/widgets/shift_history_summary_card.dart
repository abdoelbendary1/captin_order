import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/theme_context_extension.dart';
import '../../domain/entities/admin_shift_summary_entity.dart';

class ShiftHistorySummaryCard extends StatelessWidget {
  final AdminShiftSummaryEntity summary;

  const ShiftHistorySummaryCard({
    super.key,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: context.theme.shadowColor.withValues(alpha: 0.02),
            blurRadius: 8.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Row 1: Total Shifts & Total Hours
          Row(
            children: [
              Expanded(
                child: _SummaryMetricTile(
                  label: AppStrings.totalShifts,
                  value: '${summary.totalShifts}',
                  icon: Icons.access_time_filled_rounded,
                ),
              ),
              Container(
                height: 36.h,
                width: 1,
                color: colorScheme.outlineVariant.withValues(alpha: 0.3),
              ),
              Expanded(
                child: _SummaryMetricTile(
                  label: AppStrings.totalHours,
                  value: '${summary.totalHours.toStringAsFixed(1)}h',
                  icon: Icons.timelapse_rounded,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Divider(
            height: 1,
            color: colorScheme.outlineVariant.withValues(alpha: 0.2),
          ),
          SizedBox(height: 12.h),
          // Row 2: Orders Completed & Sales Processed
          Row(
            children: [
              Expanded(
                child: _SummaryMetricTile(
                  label: AppStrings.ordersCompleted,
                  value: '${summary.ordersCompleted}',
                  icon: Icons.task_alt_rounded,
                ),
              ),
              Container(
                height: 36.h,
                width: 1,
                color: colorScheme.outlineVariant.withValues(alpha: 0.3),
              ),
              Expanded(
                child: _SummaryMetricTile(
                  label: AppStrings.salesProcessed,
                  value:
                      '${AppStrings.currencySymbol}${summary.salesProcessed.toStringAsFixed(0)}',
                  icon: Icons.payments_rounded,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SummaryMetricTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _SummaryMetricTile({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: colorScheme.secondaryContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 16.r,
              color: colorScheme.onSecondaryContainer,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    value,
                    style: textTheme.titleMedium,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  label,
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
