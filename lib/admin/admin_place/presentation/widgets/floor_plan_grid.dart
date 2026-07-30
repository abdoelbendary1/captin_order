import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';

class FloorPlanGrid extends StatelessWidget {
  final List<int> tableNumbers;
  final VoidCallback onAddManualTable;

  const FloorPlanGrid({
    super.key,
    required this.tableNumbers,
    required this.onAddManualTable,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final totalCount = tableNumbers.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.activeFloorPlan,
              style: textTheme.labelSmall?.copyWith(
                fontFamily: 'JetBrains Mono',
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                fontSize: 10.5.sp,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                '$totalCount ${AppStrings.tablesBadge}',
                style: textTheme.labelSmall?.copyWith(
                  fontFamily: 'JetBrains Mono',
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSecondaryContainer,
                  fontSize: 10.5.sp,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 14.h),

        // 4-Column Grid of Table Tiles
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 10.w,
            childAspectRatio: 1.0,
          ),
          itemCount: tableNumbers.length + 1,
          itemBuilder: (context, index) {
            if (index < tableNumbers.length) {
              final number = tableNumbers[index];
              return Container(
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: theme.primaryColor.withValues(alpha: 0.2),
                      blurRadius: 6.r,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    '$number',
                    style: textTheme.titleLarge?.copyWith(
                      fontFamily: 'Hanken Grotesk',
                      fontWeight: FontWeight.w800,
                      color: colorScheme.onPrimary,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
              );
            }

            // Plus Manual Tile at end
            return GestureDetector(
              onTap: onAddManualTable,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: colorScheme.outlineVariant.withValues(alpha: 0.6),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_rounded,
                      color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                      size: 20.r,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      AppStrings.manualTile,
                      style: textTheme.labelSmall?.copyWith(
                        fontFamily: 'JetBrains Mono',
                        color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                        fontSize: 9.5.sp,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
