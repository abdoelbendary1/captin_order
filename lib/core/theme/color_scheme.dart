import 'package:captin_order/core/theme/status_colors.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppColorScheme {
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.lightPrimary,
    onPrimary: AppColors.lightOnPrimary,
    primaryContainer: AppColors.lightPrimary,
    onPrimaryContainer: AppColors.lightOnPrimary,
    secondary: AppColors.lightSecondary,
    onSecondary: AppColors.lightOnSecondary,
    secondaryContainer: AppColors.lightSecondaryContainer,
    onSecondaryContainer: AppColors.lightOnSecondaryContainer,
    tertiary: AppColors.lightTertiary,
    onTertiary: Color(0xFFFFFFFF),
    error: AppColors.lightError,
    onError: Color(0xFFFFFFFF),
    errorContainer: AppColors.lightErrorContainer,
    onErrorContainer: AppColors.lightOnErrorContainer,
    surface: AppColors.lightSurface,
    onSurface: AppColors.lightOnSurface,
    surfaceContainer: AppColors.lightSurface,
    surfaceContainerHigh: AppColors.lightSurfaceVariant,
    onSurfaceVariant: AppColors.lightOnSurfaceVariant,
    outline: AppColors.lightOutline,
    outlineVariant: AppColors.lightOutlineVariant,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.darkPrimary,
    onPrimary: AppColors.darkOnPrimary,
    primaryContainer: AppColors.darkPrimary,
    onPrimaryContainer: AppColors.darkOnPrimary,
    secondary: AppColors.darkSecondary,
    onSecondary: AppColors.darkOnSecondary,
    secondaryContainer: AppColors.darkSecondaryContainer,
    onSecondaryContainer: AppColors.darkOnSecondaryContainer,
    tertiary: AppColors.darkTertiary,
    onTertiary: Color(0xFF333024),
    error: AppColors.darkError,
    onError: Color(0xFF690005),
    errorContainer: AppColors.darkErrorContainer,
    onErrorContainer: AppColors.darkOnErrorContainer,
    surface: AppColors.darkSurface,
    onSurface: AppColors.darkOnSurface,
    surfaceContainer: AppColors.darkSurface,
    surfaceContainerHigh: AppColors.darkSurfaceVariant,
    onSurfaceVariant: AppColors.darkOnSurfaceVariant,
    outline: AppColors.darkOutline,
    outlineVariant: AppColors.darkOutlineVariant,
  );

  static final StatusColors lightStatusColors = StatusColors(
    occupiedBackground: const Color(0xFFFFD8D8), // Custom light pink
    occupiedText: const Color(0xFFA30000), // Custom dark red
    reservedBackground: AppColors.lightSecondaryContainer,
    reservedText: AppColors.lightOnSecondaryContainer,
    availableBackground: AppColors.lightSurfaceVariant,
    availableText: AppColors.lightOnSurface,
    dirtyBackground: AppColors.lightSurfaceVariant,
    dirtyText: AppColors.lightOnSurfaceVariant,
  );

  // Define Dark Mode Status Colors
  static final StatusColors darkStatusColors = StatusColors(
    occupiedBackground: const Color(0xFF8C1D18), // Dark mode adjusted
    occupiedText: const Color(0xFFFFDAD6),
    reservedBackground: AppColors.darkSecondaryContainer,
    reservedText: AppColors.darkOnSecondaryContainer,
    availableBackground: AppColors.darkSurfaceVariant,
    availableText: AppColors.darkOnSurface,
    dirtyBackground: AppColors.darkSurfaceVariant,
    dirtyText: AppColors.darkOnSurfaceVariant,
  );
}
