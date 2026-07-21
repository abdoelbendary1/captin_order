import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_size.dart';

class AppInputTheme {
  static InputDecorationTheme inputDecorationTheme(ColorScheme colorScheme) {
    return InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.surface,
      contentPadding: EdgeInsets.all(AppSize.spaceSm),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.radiusSm),
        borderSide: BorderSide(color: colorScheme.outline, width: 1.w),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.radiusSm),
        borderSide: BorderSide(color: colorScheme.secondary, width: 2.w),
      ),
    );
  }
}