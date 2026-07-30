import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/router/app_router.dart';
import '../../domain/entities/table_entity.dart';
import '../bloc/active_tables_bloc.dart';
import '../bloc/active_tables_event.dart';

class TableCard extends StatelessWidget {
  final TableEntity table;

  const TableCard({
    super.key,
    required this.table,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final isOccupied = table.status == TableStatus.occupied || table.status == TableStatus.reserved;

    return GestureDetector(
      onTap: () async {
        if (isOccupied) {
          TableDetailsRoute(tableId: table.id).go(context);
        } else {
          // Navigate to menu selection without changing status to occupied yet
          await OrderItemsRoute(
            tableNumber: table.tableNumber,
            areaName: table.areaName,
          ).push(context);

          if (context.mounted) {
            context.read<ActiveTablesBloc>().add(
                  const ActiveTablesEvent.refreshTables(),
                );
          }
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isOccupied
              ? theme.primaryColor
              : colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(8.r),
          border: isOccupied
              ? null
              : Border(
                  left: BorderSide(
                    color: colorScheme.outline,
                    width: 3.5.w,
                  ),
                ),
          boxShadow: isOccupied
              ? [
                  BoxShadow(
                    color: theme.primaryColor.withValues(alpha: 0.2),
                    blurRadius: 4.r,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                table.tableNumber,
                style: textTheme.titleMedium?.copyWith(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w700,
                  color: isOccupied
                      ? colorScheme.onPrimary
                      : colorScheme.onSurface,
                ),
              ),
            ),
            if (isOccupied)
              Positioned(
                top: 4.r,
                right: 4.r,
                child: Icon(
                  Icons.check_circle_rounded,
                  color: colorScheme.onPrimary,
                  size: 13.r,
                ),
              ),
          ],
        ),
      ),
    );
  }
}