import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';

class ShiftSalesCard extends StatelessWidget {
  final double salesAmount;
  final double salesTrendPercent;
  final double dailyTargetPercent;

  const ShiftSalesCard({
    super.key,
    required this.salesAmount,
    required this.salesTrendPercent,
    required this.dailyTargetPercent,
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
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: theme.primaryColor.withValues(alpha: 0.25),
            blurRadius: 10.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SHIFT SALES',
            style: textTheme.labelSmall?.copyWith(
              fontFamily: 'JetBrains Mono',
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: colorScheme.onPrimary.withValues(alpha: 0.6),
              fontSize: 11.sp,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            '${AppStrings.currencySymbol}${salesAmount.toStringAsFixed(2)}',
            style: textTheme.displayMedium?.copyWith(
              fontFamily: 'JetBrains Mono',
              fontWeight: FontWeight.w800,
              color: colorScheme.onPrimary,
              fontSize: 28.sp,
            ),
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              Icon(
                Icons.trending_up_rounded,
                color: const Color(0xFF4ADE80), // Emerald Green
                size: 16.r,
              ),
              SizedBox(width: 4.w),
              Text(
                '+${salesTrendPercent.toStringAsFixed(0)}% vs last shift',
                style: textTheme.labelSmall?.copyWith(
                  fontFamily: 'JetBrains Mono',
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF4ADE80),
                  fontSize: 11.5.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          // Horizontal Progress Bar
          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: LinearProgressIndicator(
              value: dailyTargetPercent.clamp(0.0, 1.0),
              minHeight: 6.h,
              backgroundColor: colorScheme.onPrimary.withValues(alpha: 0.15),
              valueColor: AlwaysStoppedAnimation<Color>(
                colorScheme.secondaryContainer,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '${(dailyTargetPercent * 100).toStringAsFixed(0)}% of daily target reached',
            style: textTheme.labelSmall?.copyWith(
              color: colorScheme.onPrimary.withValues(alpha: 0.6),
              fontSize: 11.sp,
            ),
          ),
        ],
      ),
    );
  }
}
