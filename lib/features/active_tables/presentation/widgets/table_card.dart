import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_size.dart';
import '../../domain/entities/table_entity.dart';

class TableCard extends StatelessWidget {
  final TableEntity table;
  final VoidCallback? onTap;

  const TableCard({
    super.key,
    required this.table,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.radiusMd),
        side: BorderSide(
          color: colorScheme.outline.withOpacity(0.12),
          width: 1.w,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(AppSize.spaceSm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'TABLE  ${table.tableNumber}',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  _StatusChip(status: table.status),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CURRENT TOTAL',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurface.withOpacity(0.6),
                      fontSize: 10.sp,
                      letterSpacing: 0.8,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    '\$${table.currentTotal.toStringAsFixed(2)}',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.person_outline_rounded,
                    size: 16.r,
                    color: colorScheme.onSurface.withOpacity(0.7),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    '${table.guestCount} ${table.guestCount == 1 ? 'Guest' : 'Guests'}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurface.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ],
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: const Color(0xFFFFDAD6),
        borderRadius: BorderRadius.circular(AppSize.radiusSm),
      ),
      child: Text(
        status.name.toUpperCase(),
        style: TextStyle(
          fontFamily: 'JetBrains Mono',
          fontSize: 10.sp,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF93000A),
        ),
      ),
    );
  }
}