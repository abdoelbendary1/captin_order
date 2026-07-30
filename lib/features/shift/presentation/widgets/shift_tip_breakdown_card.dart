import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';

class ShiftTipBreakdownCard extends StatelessWidget {
  final double digitalTips;
  final double cashTips;

  const ShiftTipBreakdownCard({
    super.key,
    required this.digitalTips,
    required this.cashTips,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final totalTips = digitalTips + cashTips;

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
          Text(
            'Tip Breakdown',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 16.h),

          // Digital Tips Row
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHigh.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.credit_card_rounded,
                  color: colorScheme.onSurfaceVariant,
                  size: 20.r,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  'Digital Tips',
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              Text(
                '${AppStrings.currencySymbol}${digitalTips.toStringAsFixed(2)}',
                style: textTheme.bodyMedium?.copyWith(
                  fontFamily: 'JetBrains Mono',
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // Cash Tips Row
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHigh.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.payments_outlined,
                  color: colorScheme.onSurfaceVariant,
                  size: 20.r,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  'Cash Tips',
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              Text(
                '${AppStrings.currencySymbol}${cashTips.toStringAsFixed(2)}',
                style: textTheme.bodyMedium?.copyWith(
                  fontFamily: 'JetBrains Mono',
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // Total Tips Footer Container
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: colorScheme.secondaryContainer.withValues(alpha: 0.35),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Tips',
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurfaceVariant,
                    fontSize: 13.5.sp,
                  ),
                ),
                Text(
                  '${AppStrings.currencySymbol}${totalTips.toStringAsFixed(2)}',
                  style: textTheme.titleMedium?.copyWith(
                    fontFamily: 'JetBrains Mono',
                    fontWeight: FontWeight.w800,
                    color: colorScheme.onSecondaryContainer,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
