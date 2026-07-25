import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/router/app_router.dart';
import '../../../active_tables/domain/entities/table_entity.dart';

class TableDetailsHeader extends StatelessWidget {
  final TableEntity table;

  const TableDetailsHeader({
    super.key,
    required this.table,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20.0,
                  backgroundColor: colorScheme.primaryContainer,
                  child: Icon(
                    Icons.person,
                    color: colorScheme.onPrimaryContainer,
                    size: 22.0,
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: Text(
                    '${AppStrings.tablePrefix}${table.tableNumber} • ${table.areaName}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.settings_outlined,
              color: colorScheme.onSurface,
              size: 22.0,
            ),
            onPressed: () {
              const SettingsRoute().push(context);
            },
          ),
        ],
      ),
    );
  }
}
