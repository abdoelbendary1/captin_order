import 'package:flutter/material.dart';

/// Extension for clean, senior-level access to Theme, TextTheme, and ColorScheme
extension ThemeContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
