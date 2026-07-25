import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';

class CheckoutHeader extends StatelessWidget {
  final String tableNumber;
  final VoidCallback onBack;

  const CheckoutHeader({
    super.key,
    required this.tableNumber,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_rounded, color: colorScheme.onSurface),
                onPressed: onBack,
              ),
              const SizedBox(width: 8.0),
              Text(
                AppStrings.checkout,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(14.0),
                ),
                child: Text(
                  'Table $tableNumber',
                  style: textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSecondaryContainer,
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              IconButton(
                icon: Icon(Icons.info_outline_rounded, color: colorScheme.onSurfaceVariant),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
