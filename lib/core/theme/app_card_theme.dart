import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_size.dart';

class AppCardTheme {
  static CardThemeData cardTheme(ColorScheme colorScheme) {
    return CardThemeData(
      color: colorScheme.surfaceContainerLowest,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.radiusLg),
        side: BorderSide(
          color: colorScheme.primary.withValues(alpha: 0.1),
          width: 1.w,
        ),
      ),
    );
  }
}
