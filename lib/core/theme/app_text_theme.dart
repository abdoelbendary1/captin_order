import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextTheme {
  static TextTheme textTheme(Color color) {
    return TextTheme(
      // Display LG: Hanken Grotesk 32px / 700 / 40px height / -0.02em letterSpacing
      displayLarge: TextStyle(
        fontFamily: 'Hanken Grotesk',
        fontSize: 32.sp,
        fontWeight: FontWeight.w700,
        height: 40 / 32,
        letterSpacing: -0.64,
        color: color,
      ),
      // Display LG Mobile: Hanken Grotesk 26px / 700 / 32px height
      displayMedium: TextStyle(
        fontFamily: 'Hanken Grotesk',
        fontSize: 26.sp,
        fontWeight: FontWeight.w700,
        height: 32 / 26,
        color: color,
      ),
      // Headline MD: Hanken Grotesk 24px / 600 / 32px height
      headlineMedium: TextStyle(
        fontFamily: 'Hanken Grotesk',
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        height: 32 / 24,
        color: color,
      ),
      // Headline SM: Hanken Grotesk 20px / 600 / 28px height
      headlineSmall: TextStyle(
        fontFamily: 'Hanken Grotesk',
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        height: 28 / 20,
        color: color,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Hanken Grotesk',
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        height: 24 / 18,
        color: color,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Hanken Grotesk',
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        height: 22 / 16,
        color: color,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Hanken Grotesk',
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        height: 20 / 14,
        color: color,
      ),
      // Body LG: Work Sans 18px / 400 / 28px height
      bodyLarge: TextStyle(
        fontFamily: 'Work Sans',
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
        height: 28 / 18,
        color: color,
      ),
      // Body MD: Work Sans 16px / 400 / 24px height
      bodyMedium: TextStyle(
        fontFamily: 'Work Sans',
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        height: 24 / 16,
        color: color,
      ),
      // Body SM: Work Sans 14px / 400 / 20px height
      bodySmall: TextStyle(
        fontFamily: 'Work Sans',
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        height: 20 / 14,
        color: color,
      ),
      // Label Caps: JetBrains Mono 12px / 500 / 16px height / 0.05em letterSpacing
      labelMedium: TextStyle(
        fontFamily: 'JetBrains Mono',
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        height: 16 / 12,
        letterSpacing: 0.6,
        color: color,
      ),
      // Status Nano: JetBrains Mono 10px / 700 / 12px height
      labelSmall: TextStyle(
        fontFamily: 'JetBrains Mono',
        fontSize: 10.sp,
        fontWeight: FontWeight.w700,
        height: 12 / 10,
        color: color,
      ),
    );
  }
}