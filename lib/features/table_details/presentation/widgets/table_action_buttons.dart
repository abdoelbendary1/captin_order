import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../active_tables/domain/entities/table_entity.dart';

class TableActionButtons extends StatelessWidget {
  final TableEntity table;
  final VoidCallback onAddItem;
  final VoidCallback onRequestCheck;
  final ValueChanged<String> onMoveTable;

  const TableActionButtons({
    super.key,
    required this.table,
    required this.onAddItem,
    required this.onRequestCheck,
    required this.onMoveTable,
  });

  void _showMoveTableDialog(BuildContext context) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title:  Text(AppStrings.moveTableTitle),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration:  InputDecoration(
              hintText: AppStrings.enterNewTableHint,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child:  Text(AppStrings.cancel),
            ),
            ElevatedButton(
              onPressed: () {
                final newNum = controller.text.trim();
                if (newNum.isNotEmpty) {
                  Navigator.of(ctx).pop();
                  onMoveTable(newNum);
                }
              },
              child:  Text(AppStrings.move),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Column(
      children: [
        // 1. Add Item Button (Dark Espresso)
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onAddItem,
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_circle_outline_rounded,
                  color: colorScheme.onPrimary,
                  size: 20.0,
                ),
                const SizedBox(width: 8.0),
                Text(
                  AppStrings.addItem,
                  style: textTheme.titleSmall?.copyWith(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10.0),

        // 2. Request Check Button (Light Container)
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onRequestCheck,
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.surfaceContainerHigh,
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.payments_outlined,
                  color: colorScheme.onSurface,
                  size: 20.0,
                ),
                const SizedBox(width: 8.0),
                Text(
                  AppStrings.requestCheck,
                  style: textTheme.titleSmall?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10.0),

        // 3. Move Table Button (Outlined)
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () => _showMoveTableDialog(context),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              side: BorderSide(
                color: colorScheme.outlineVariant,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.swap_horiz_rounded,
                  color: colorScheme.onSurface,
                  size: 20.0,
                ),
                const SizedBox(width: 8.0),
                Text(
                  AppStrings.moveTable,
                  style: textTheme.titleSmall?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
