import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/theme_context_extension.dart';
import '../../domain/entities/admin_shift_record_entity.dart';

class ShiftHistoryRecordCard extends StatelessWidget {
  final AdminShiftRecordEntity shift;

  const ShiftHistoryRecordCard({
    super.key,
    required this.shift,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;
    final dateStr = DateFormat('EEE, MMM dd').format(shift.date);

    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18.r,
                backgroundColor: colorScheme.secondaryContainer,
                child: Text(
                  shift.staffName.isNotEmpty ? shift.staffName[0] : 'S',
                  style: textTheme.titleSmall?.copyWith(
                    color: colorScheme.onSecondaryContainer,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shift.staffName,
                      style: textTheme.titleSmall,
                    ),
                    Text(
                      '${shift.role} • ${shift.shiftName}',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  dateStr,
                  style: textTheme.labelSmall,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Divider(
            height: 1,
            color: colorScheme.outlineVariant.withValues(alpha: 0.2),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.schedule_rounded,
                    size: 14.r,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    '${shift.startTime} - ${shift.endTime}',
                    style: textTheme.bodySmall,
                  ),
                ],
              ),
              Text(
                '${shift.totalOrders} ${AppStrings.units} • ${AppStrings.currencySymbol}${shift.totalSales.toStringAsFixed(0)}',
                style: textTheme.titleSmall?.copyWith(
                  color: colorScheme.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
