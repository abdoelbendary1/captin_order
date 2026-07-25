import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';

class CustomSearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const CustomSearchBar({
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
          hintText: AppStrings.searchHint,
          hintStyle: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
          ),
          prefixIcon: Icon(
            Icons.search_rounded,
            color: colorScheme.onSurfaceVariant,
          ),
          filled: true,
          fillColor: colorScheme.surfaceContainerHigh,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
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
