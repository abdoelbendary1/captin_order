// lib/core/theme/app_text_theme.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextTheme {
  static TextTheme textTheme(Color color) {
    return TextTheme(
      // Headline Specs: Hanken Grotesk
      displayLarge: TextStyle(
        fontFamily: 'Hanken Grotesk',
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
        height: 40 / 32,
        letterSpacing: -0.64,
        color: color,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Hanken Grotesk',
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        height: 32 / 24,
        color: color,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Hanken Grotesk',
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        height: 28 / 20,
        color: color,
      ),
      // Body Specs: Work Sans
      bodyLarge: TextStyle(
        fontFamily: 'Work Sans',
        fontSize: 18.sp,
        fontWeight: FontWeight.normal,
        height: 28 / 18,
        color: color,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Work Sans',
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        height: 24 / 16,
        color: color,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Work Sans',
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        height: 20 / 14,
        color: color,
      ),
      // Label Caps Specs: JetBrains Mono
      labelSmall: TextStyle(
        fontFamily: 'JetBrains Mono',
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        height: 16 / 12,
        letterSpacing: 0.6,
        color: color,
      ),
    );
  }
}