import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/router/app_router.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: colorScheme.surfaceContainerHigh,
                  child: Icon(
                    Icons.local_cafe_rounded,
                    color: theme.primaryColor,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        AppStrings.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        AppStrings.subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8.0),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.notifications_none_rounded, color: colorScheme.onSurface),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.settings_outlined, color: colorScheme.onSurface),
                onPressed: () {
                  const SettingsRoute().push(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
