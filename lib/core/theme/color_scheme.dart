import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'status_colors.dart';

class AppColorScheme {
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.lightPrimary,
    onPrimary: AppColors.lightOnPrimary,
    primaryContainer: AppColors.lightPrimaryContainer,
    onPrimaryContainer: AppColors.lightOnPrimaryContainer,
    secondary: AppColors.lightSecondary,
    onSecondary: AppColors.lightOnSecondary,
    secondaryContainer: AppColors.lightSecondaryContainer,
    onSecondaryContainer: AppColors.lightOnSecondaryContainer,
    tertiary: AppColors.lightTertiary,
    onTertiary: AppColors.lightOnTertiary,
    tertiaryContainer: AppColors.lightTertiaryContainer,
    onTertiaryContainer: AppColors.lightOnTertiaryContainer,
    error: AppColors.lightError,
    onError: AppColors.lightOnError,
    errorContainer: AppColors.lightErrorContainer,
    onErrorContainer: AppColors.lightOnErrorContainer,
    surface: AppColors.lightSurface,
    onSurface: AppColors.lightOnSurface,
    surfaceContainerLowest: AppColors.lightSurfaceContainerLowest,
    surfaceContainerLow: AppColors.lightSurfaceContainerLow,
    surfaceContainer: AppColors.lightSurfaceContainer,
    surfaceContainerHigh: AppColors.lightSurfaceContainerHigh,
    surfaceContainerHighest: AppColors.lightSurfaceContainerHighest,
    onSurfaceVariant: AppColors.lightOnSurfaceVariant,
    outline: AppColors.lightOutline,
    outlineVariant: AppColors.lightOutlineVariant,
    surfaceTint: AppColors.lightSurfaceTint,
    inverseSurface: AppColors.lightInverseSurface,
    onInverseSurface: AppColors.lightInverseOnSurface,
    inversePrimary: AppColors.lightInversePrimary,
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
    occupiedBackground: AppColors.lightErrorContainer,
    occupiedText: AppColors.occupiedError,
    reservedBackground: const Color(0xFFFEF3C7), // Light amber tint
    reservedText: AppColors.reservedWarning,
    availableBackground: const Color(0xFFD1FAE5), // Light emerald tint
    availableText: AppColors.emptySuccess,
    dirtyBackground: AppColors.lightSurfaceContainerHighest,
    dirtyText: AppColors.lightOnSurfaceVariant,
  );

  static final StatusColors darkStatusColors = StatusColors(
    occupiedBackground: const Color(0xFF8C1D18),
    occupiedText: const Color(0xFFFFDAD6),
    reservedBackground: AppColors.darkSecondaryContainer,
    reservedText: AppColors.darkOnSecondaryContainer,
    availableBackground: AppColors.darkSurfaceVariant,
    availableText: AppColors.darkOnSurface,
    dirtyBackground: AppColors.darkSurfaceVariant,
    dirtyText: AppColors.darkOnSurfaceVariant,
  );
}
