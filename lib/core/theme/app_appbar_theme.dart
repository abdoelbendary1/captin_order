import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppAppBarTheme {
  static AppBarTheme appBarTheme(ColorScheme colorScheme) {
    return AppBarTheme(
      backgroundColor: colorScheme.surface,
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: colorScheme.onSurface),
      titleTextStyle: TextStyle(
        fontFamily: 'Hanken Grotesk',
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
      ),
    );
  }
}