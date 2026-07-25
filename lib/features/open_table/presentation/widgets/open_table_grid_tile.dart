import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OpenTableGridTile extends StatelessWidget {
  final String tableNumber;
  final bool isSelected;
  final VoidCallback onTap;

  const OpenTableGridTile({
    super.key,
    required this.tableNumber,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isSelected
              ? theme.primaryColor
              : colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(6.r),
          border: isSelected
              ? null
              : Border(
                  left: BorderSide(
                    color: colorScheme.outline,
                    width: 4.w,
                  ),
                ),
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                tableNumber,
                style: textTheme.headlineMedium?.copyWith(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: isSelected
                      ? colorScheme.onPrimary
                      : colorScheme.onSurface,
                ),
              ),
            ),
            if (isSelected)
              Positioned(
                top: 6.r,
                right: 6.r,
                child: Icon(
                  Icons.check_circle_rounded,
                  color: colorScheme.onPrimary,
                  size: 16.r,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
