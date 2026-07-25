import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../domain/entities/table_entity.dart';
import 'table_card.dart';

class TablesGridView extends StatelessWidget {
  final List<TableEntity> tables;

  const TablesGridView({
    super.key,
    required this.tables,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    if (tables.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.table_restaurant_outlined,
              size: 48.0,
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 12.0),
            Text(
              AppStrings.noActiveTables,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 24.0,
        childAspectRatio: 1.15,
      ),
      itemCount: tables.length,
      itemBuilder: (context, index) {
        return TableCard(table: tables[index]);
      },
    );
  }
}
