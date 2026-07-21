import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppColorScheme {
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.lightPrimary,
    onPrimary: AppColors.lightOnPrimary,
    secondary: AppColors.lightSecondary,
    onSecondary: AppColors.lightOnSecondary,
    tertiary: AppColors.lightTertiary,
    onTertiary: Color(0xFFFFFFFF),
    error: AppColors.lightError,
    onError: Color(0xFFFFFFFF),
    surface: AppColors.lightSurface,
    onSurface: AppColors.lightOnSurface,
    outline: AppColors.lightOutline,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.darkPrimary,
    onPrimary: AppColors.darkOnPrimary,
    secondary: AppColors.darkSecondary,
    onSecondary: AppColors.darkOnSecondary,
    tertiary: AppColors.darkTertiary,
    onTertiary: Color(0xFF333024),
    error: AppColors.darkError,
    onError: Color(0xFF690005),
    surface: AppColors.darkSurface,
    onSurface: AppColors.darkOnSurface,
    outline: AppColors.darkOutline,
  );
}