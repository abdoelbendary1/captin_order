import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/localization/locale_cubit.dart';
import '../../../../core/router/app_router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return BlocBuilder<LocaleCubit, Locale>(
      builder: (context, currentLocale) {
        final isArabic = currentLocale.languageCode == 'ar';

        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_rounded, color: colorScheme.onSurface),
              onPressed: () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                } else {
                  const ActiveTablesRoute().go(context);
                }
              },
            ),
            title: Text(
              AppStrings.settings,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
          ),
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              physics: const BouncingScrollPhysics(),
              children: [
                // 1. Staff Profile Card
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(
                      color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                    ),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 26.0,
                        backgroundColor: colorScheme.primaryContainer,
                        child: Icon(
                          Icons.person_rounded,
                          color: colorScheme.onPrimaryContainer,
                          size: 30.0,
                        ),
                      ),
                      const SizedBox(width: 14.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.captainName,
                            style: textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 2.0),
                          Text(
                            AppStrings.morningShift,
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),

                // 2. Language Switcher Section
                Text(
                  AppStrings.chooseLanguage,
                  style: textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(
                      color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                    ),
                  ),
                  child: Column(
                    children: [
                      // Arabic Option (Masri 🇪🇬)
                      ListTile(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                        ),
                        title: Text(
                          AppStrings.arabicMasri,
                          style: textTheme.bodyLarge?.copyWith(
                            fontWeight: isArabic ? FontWeight.bold : FontWeight.normal,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        trailing: isArabic
                            ? Icon(Icons.check_circle_rounded, color: theme.primaryColor)
                            : null,
                        onTap: () {
                          context.read<LocaleCubit>().setLocale(const Locale('ar'));
                        },
                      ),
                      Divider(height: 1.0, color: colorScheme.outlineVariant.withValues(alpha: 0.4)),
                      // English Option 🇬🇧
                      ListTile(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.0)),
                        ),
                        title: Text(
                          AppStrings.english,
                          style: textTheme.bodyLarge?.copyWith(
                            fontWeight: !isArabic ? FontWeight.bold : FontWeight.normal,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        trailing: !isArabic
                            ? Icon(Icons.check_circle_rounded, color: theme.primaryColor)
                            : null,
                        onTap: () {
                          context.read<LocaleCubit>().setLocale(const Locale('en'));
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24.0),

                // 3. App Information Section
                Text(
                  AppStrings.appInformation,
                  style: textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(
                      color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.appTitle,
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        AppStrings.version,
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
        );
      },
    );
  }
}
