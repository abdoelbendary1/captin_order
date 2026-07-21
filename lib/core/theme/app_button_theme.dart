import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_size.dart';

class AppButtonTheme {
  static ElevatedButtonThemeData elevatedButtonTheme(ColorScheme colorScheme) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        minimumSize: Size.fromHeight(AppSize.minTouchTarget),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.radiusMd),
        ),
        elevation: 1,
        textStyle: TextStyle(
          fontFamily: 'Work Sans',
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}