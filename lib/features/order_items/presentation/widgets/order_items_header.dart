import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/router/app_router.dart';

class OrderItemsHeader extends StatelessWidget {
  const OrderItemsHeader({super.key});

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
          // Left: Settings Icon
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

          // Right: Title & Avatar
          Row(
            children: [
              Text(
                AppStrings.shopCaptain,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(width: 10.0),
              CircleAvatar(
                radius: 18.0,
                backgroundColor: colorScheme.primaryContainer,
                child: Icon(
                  Icons.person,
                  color: colorScheme.onPrimaryContainer,
                  size: 20.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
