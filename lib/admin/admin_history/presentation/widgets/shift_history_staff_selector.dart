import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/theme_context_extension.dart';

class ShiftHistoryStaffSelector extends StatelessWidget {
  final String selectedStaffId;
  final ValueChanged<String> onStaffSelected;

  const ShiftHistoryStaffSelector({
    super.key,
    required this.selectedStaffId,
    required this.onStaffSelected,
  });

  static const List<Map<String, String>> _staffOptions = [
    {'id': 'all', 'name': 'All Staff'},
    {'id': 'staff_1', 'name': 'Ahmed M. (Captain)'},
    {'id': 'staff_2', 'name': 'Julian Vane (Barista)'},
    {'id': 'staff_3', 'name': 'Lucas Nathan (Manager)'},
    {'id': 'staff_4', 'name': 'Sarah Manager (Admin)'},
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.4),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedStaffId,
          isExpanded: true,
          icon: Icon(
            Icons.arrow_drop_down_rounded,
            color: colorScheme.primary,
          ),
          items: _staffOptions.map((staff) {
            return DropdownMenuItem<String>(
              value: staff['id'],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.selectStaffMember,
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    staff['name']!,
                    style: textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: (val) {
            if (val != null) {
              onStaffSelected(val);
            }
          },
        ),
      ),
    );
  }
}
