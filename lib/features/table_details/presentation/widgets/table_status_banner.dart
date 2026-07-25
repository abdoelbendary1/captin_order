import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(10.0),
        border: Border(
          left: BorderSide(
            color: colorScheme.error,
            width: 3.5,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.04),
            blurRadius: 3.0,
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
              letterSpacing: 1.2,
              fontWeight: FontWeight.bold,
              color: colorScheme.error,
              fontSize: 10.0,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            statusText,
            style: textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
