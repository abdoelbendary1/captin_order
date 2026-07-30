import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../domain/entities/z_report_entity.dart';

class AdminZReportsCard extends StatelessWidget {
  final List<ZReportEntity> zReports;

  const AdminZReportsCard({
    super.key,
    required this.zReports,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title
        Text(
          AppStrings.zReports,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 12.h),

        // List of Reports
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: zReports.length,
          separatorBuilder: (_, __) => SizedBox(height: 10.h),
          itemBuilder: (context, index) {
            final report = zReports[index];
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(14.r),
                boxShadow: [
                  BoxShadow(
                    color: theme.shadowColor.withValues(alpha: 0.03),
                    blurRadius: 8.r,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        report.date,
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        '${report.shiftType} • ${report.captainName}',
                        style: textTheme.labelSmall?.copyWith(
                          fontFamily: 'JetBrains Mono',
                          color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                          fontSize: 10.5.sp,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '${AppStrings.currencySymbol}${report.totalSalesAmount.toStringAsFixed(2)}',
                        style: textTheme.titleMedium?.copyWith(
                          fontFamily: 'JetBrains Mono',
                          fontWeight: FontWeight.w800,
                          color: colorScheme.onSurface,
                          fontSize: 15.5.sp,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: colorScheme.onSurface,
                        size: 20.r,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
