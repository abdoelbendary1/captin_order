import 'package:captin_order/core/theme/status_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';
import '../../domain/entities/table_entity.dart';

class TableCard extends StatelessWidget {
  final TableEntity table;
  final VoidCallback? onTap;

  const TableCard({super.key, required this.table, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: colorScheme.outline, width: 1.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(4.r),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header: Table Number & Status Chip
                // Header: Table Number & Status Chip
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        '${AppStrings.tablePrefix} ${table.tableNumber.padLeft(2, '0')}',
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontSize: 11.sp,
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      _StatusChip(status: table.status),
                    ],
                  ),
                ),
                const Spacer(),

                // Middle: Current Total
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.currentTotal,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontSize: 10.sp,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${AppStrings.currencySymbol}${table.currentTotal.toStringAsFixed(2)}',
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w800,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),

                // Footer: Guest Count
                Row(
                  children: [
                    Icon(
                      Icons.person_outline_rounded,
                      size: 16.r,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    SizedBox(width: 6.w),
                    Expanded(
                      child: Text(
                        '${table.guestCount} ${table.guestCount == 1 ? AppStrings.guestSingular : AppStrings.guestPlural}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 13.sp,
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final TableStatus status;

  const _StatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    // Safely extract our custom status colors from the current theme
    final statusColors = Theme.of(context).extension<StatusColors>()!;

    Color backgroundColor;
    Color textColor;
    String label;

    switch (status) {
      case TableStatus.occupied:
        backgroundColor = statusColors.occupiedBackground!;
        textColor = statusColors.occupiedText!;
        label = AppStrings.statusOccupied;
        break;
      case TableStatus.reserved:
        backgroundColor = statusColors.reservedBackground!;
        textColor = statusColors.reservedText!;
        label = AppStrings.statusReserved;
        break;
      case TableStatus.available:
        backgroundColor = statusColors.availableBackground!;
        textColor = statusColors.availableText!;
        label = AppStrings.statusAvailable;
        break;
      case TableStatus.dirty:
        backgroundColor = statusColors.dirtyBackground!;
        textColor = statusColors.dirtyText!;
        label = AppStrings.statusDirty;
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        label,
        maxLines: 1,
        style: TextStyle(
          fontSize: 9.sp,
          fontWeight: FontWeight.w700,
          color: textColor,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
