// lib/core/constants/app_size.dart
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppSize {
  // Radius (Soft rounding strategy)
  static double radiusSm = 4.r;
  static double radiusMd = 8.r;
  static double radiusLg = 12.r;

  // Spacing (Base-8 rhythm)
  static double spaceBase = 4.h;
  static double spaceXs = 8.h;
  static double spaceSm = 16.h;
  static double spaceMd = 24.h;
  static double spaceLg = 32.h;
  static double spaceXl = 48.h;

  // Touch Targets
  static double minTouchTarget = 44.h;
}