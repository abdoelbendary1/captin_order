import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../active_tables/domain/entities/table_entity.dart';

class TableStatusBanner extends StatelessWidget {
  final TableEntity table;

  const TableStatusBanner({
    super.key,
    required this.table,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final openedAt = table.openedAt ?? table.seatedAt ?? DateTime.now();
    final elapsedMinutes = DateTime.now().difference(openedAt).inMinutes;

    final statusText = table.tableStatusDescription ??
        'Occupied for $elapsedMinutes minutes.';

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(10.r),
        border: Border(
          left: BorderSide(
            color: const Color(0xFFC62828),
            width: 3.5.w,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.04),
            blurRadius: 4.r,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.tableStatusUpper,
            style: textTheme.labelSmall?.copyWith(
              letterSpacing: 1.1,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFC62828),
              fontSize: 10.sp,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            statusText,
            style: textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: colorScheme.onSurface,
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
    );
  }
}
