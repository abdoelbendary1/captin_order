import 'package:flutter/material.dart';
import '../constants/app_size.dart';

class AppIconButtonTheme {
  static IconButtonThemeData iconButtonTheme(ColorScheme colorScheme) {
    return IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: colorScheme.onSurface,
        minimumSize: Size(AppSize.minTouchTarget, AppSize.minTouchTarget),
      ),
    );
  }
}