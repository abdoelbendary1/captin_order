import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';

class OpenTableZoneToggle extends StatelessWidget {
  final int selectedZoneIndex;
  final ValueChanged<int> onZoneSelected;

  const OpenTableZoneToggle({
    super.key,
    required this.selectedZoneIndex,
    required this.onZoneSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        height: 48.h,
        padding: EdgeInsets.all(4.r),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            Expanded(
              child: _buildZoneTab(
                context: context,
                index: 0,
                title: AppStrings.tabInside.toUpperCase(),
                isSelected: selectedZoneIndex == 0,
                textTheme: textTheme,
                colorScheme: colorScheme,
                theme: theme,
                isRtl: isRtl,
              ),
            ),
            Expanded(
              child: _buildZoneTab(
                context: context,
                index: 1,
                title: AppStrings.tabOutside.toUpperCase(),
                isSelected: selectedZoneIndex == 1,
                textTheme: textTheme,
                colorScheme: colorScheme,
                theme: theme,
                isRtl: isRtl,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildZoneTab({
    required BuildContext context,
    required int index,
    required String title,
    required bool isSelected,
    required TextTheme textTheme,
    required ColorScheme colorScheme,
    required ThemeData theme,
    required bool isRtl,
  }) {
    return GestureDetector(
      onTap: () => onZoneSelected(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isSelected ? theme.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Center(
          child: Text(
            title,
            style: textTheme.labelLarge?.copyWith(
              color: isSelected
                  ? colorScheme.onPrimary
                  : colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.bold,
              letterSpacing: isRtl ? 0.0 : 1.1,
              fontSize: 13.sp,
            ),
          ),
        ),
      ),
    );
  }
}
