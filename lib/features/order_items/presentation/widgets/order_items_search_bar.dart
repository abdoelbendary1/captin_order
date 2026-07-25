import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';

class OrderItemsSearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const OrderItemsSearchBar({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        onChanged: onChanged,
        style: textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurface,
        ),
        decoration: InputDecoration(
          hintText: AppStrings.searchItemsHint,
          hintStyle: textTheme.bodyMedium?.copyWith(
            color: theme.hintColor,
          ),
          filled: true,
          fillColor: colorScheme.surface,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 12.0,
          ),
          suffixIcon: Icon(
            Icons.search_rounded,
            color: colorScheme.onSurfaceVariant,
            size: 22.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: colorScheme.outlineVariant,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: theme.primaryColor,
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
