import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/localization/locale_cubit.dart';
import '../../../../core/theme/theme_cubit.dart';

class AppAppearanceLanguageCard extends StatelessWidget {
  const AppAppearanceLanguageCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.04),
            blurRadius: 10.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Row(
            children: [
              Icon(
                Icons.palette_outlined,
                color: theme.primaryColor,
                size: 20.r,
              ),
              SizedBox(width: 8.w),
              Text(
                AppStrings.themeSettings,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),

          // 1. Theme Selector Row
          Text(
            'Theme Mode',
            style: textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurfaceVariant,
              fontSize: 12.sp,
            ),
          ),
          SizedBox(height: 8.h),
          BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, currentMode) {
              return Row(
                children: [
                  Expanded(
                    child: _ThemeOptionSegment(
                      icon: Icons.brightness_auto_rounded,
                      label: AppStrings.systemDefault,
                      isSelected: currentMode == ThemeMode.system,
                      onTap: () => context.read<ThemeCubit>().setThemeMode(ThemeMode.system),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: _ThemeOptionSegment(
                      icon: Icons.light_mode_rounded,
                      label: AppStrings.lightMode,
                      isSelected: currentMode == ThemeMode.light,
                      onTap: () => context.read<ThemeCubit>().setThemeMode(ThemeMode.light),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: _ThemeOptionSegment(
                      icon: Icons.dark_mode_rounded,
                      label: AppStrings.darkMode,
                      isSelected: currentMode == ThemeMode.dark,
                      onTap: () => context.read<ThemeCubit>().setThemeMode(ThemeMode.dark),
                    ),
                  ),
                ],
              );
            },
          ),

          SizedBox(height: 18.h),
          Divider(
            height: 1,
            color: colorScheme.outlineVariant.withValues(alpha: 0.3),
          ),
          SizedBox(height: 18.h),

          // 2. Language Selector Row
          Row(
            children: [
              Icon(
                Icons.language_rounded,
                color: theme.primaryColor,
                size: 20.r,
              ),
              SizedBox(width: 8.w),
              Text(
                AppStrings.chooseLanguage,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          BlocBuilder<LocaleCubit, Locale>(
            builder: (context, currentLocale) {
              final isArabic = currentLocale.languageCode == 'ar';

              return Row(
                children: [
                  Expanded(
                    child: _LanguageOptionSegment(
                      flag: '🇪🇬',
                      label: AppStrings.arabicMasri,
                      isSelected: isArabic,
                      onTap: () {
                        context.read<LocaleCubit>().setLocale(const Locale('ar'));
                      },
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: _LanguageOptionSegment(
                      flag: '🇬🇧',
                      label: AppStrings.english,
                      isSelected: !isArabic,
                      onTap: () {
                        context.read<LocaleCubit>().setLocale(const Locale('en'));
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ThemeOptionSegment extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _ThemeOptionSegment({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? theme.primaryColor : colorScheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: isSelected ? theme.primaryColor : colorScheme.outlineVariant.withValues(alpha: 0.4),
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 20.r,
              color: isSelected ? colorScheme.onPrimary : colorScheme.onSurfaceVariant,
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: textTheme.labelSmall?.copyWith(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected ? colorScheme.onPrimary : colorScheme.onSurfaceVariant,
                fontSize: 11.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguageOptionSegment extends StatelessWidget {
  final String flag;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageOptionSegment({
    required this.flag,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? colorScheme.secondaryContainer : colorScheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: isSelected ? colorScheme.primary : colorScheme.outlineVariant.withValues(alpha: 0.4),
            width: isSelected ? 1.5 : 1.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(flag, style: textTheme.titleMedium),
            SizedBox(width: 8.w),
            Flexible(
              child: Text(
                label,
                style: textTheme.labelMedium?.copyWith(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  color: isSelected ? colorScheme.onSecondaryContainer : colorScheme.onSurface,
                  fontSize: 12.sp,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (isSelected) ...[
              SizedBox(width: 6.w),
              Icon(
                Icons.check_circle_rounded,
                size: 16.r,
                color: theme.primaryColor,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
