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
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: colorScheme.outline, width: 1.w),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: colorScheme.outlineVariant, width: 1.w),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: colorScheme.primary, width: 1.5.w),
      ),
    );
  }
}