import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme_context_extension.dart';
import '../../domain/entities/admin_shift_record_entity.dart';
import 'shift_history_record_card.dart';

class ShiftHistoryList extends StatelessWidget {
  final List<AdminShiftRecordEntity> records;

  const ShiftHistoryList({
    super.key,
    required this.records,
  });

  @override
  Widget build(BuildContext context) {
    if (records.isEmpty) {
      final colorScheme = context.colorScheme;
      final textTheme = context.textTheme;

      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(32.r),
        alignment: Alignment.center,
        child: Column(
          children: [
            Icon(
              Icons.history_toggle_off_rounded,
              size: 40.r,
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
            ),
            SizedBox(height: 8.h),
            Text(
              'No shift records match the selected filter.',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: records.length,
      separatorBuilder: (_, __) => SizedBox(height: 10.h),
      itemBuilder: (context, index) {
        return ShiftHistoryRecordCard(shift: records[index]);
      },
    );
  }
}
