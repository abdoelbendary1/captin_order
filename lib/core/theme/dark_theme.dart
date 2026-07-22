import 'package:flutter/material.dart';
import 'color_scheme.dart';
import 'app_text_theme.dart';
import 'app_button_theme.dart';
import 'app_card_theme.dart';
import 'app_input_theme.dart';
import 'app_appbar_theme.dart';
import 'app_icon_button_theme.dart';

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: AppColorScheme.darkColorScheme,
  scaffoldBackgroundColor: AppColorScheme.darkColorScheme.surface,
  textTheme: AppTextTheme.textTheme(AppColorScheme.darkColorScheme.onSurface),
  elevatedButtonTheme: AppButtonTheme.elevatedButtonTheme(
    AppColorScheme.darkColorScheme,
  ),
  cardTheme: AppCardTheme.cardTheme(AppColorScheme.darkColorScheme),
  inputDecorationTheme: AppInputTheme.inputDecorationTheme(
    AppColorScheme.darkColorScheme,
  ),
  appBarTheme: AppAppBarTheme.appBarTheme(AppColorScheme.darkColorScheme),
  iconButtonTheme: AppIconButtonTheme.iconButtonTheme(
    AppColorScheme.darkColorScheme,
  ),
  extensions: [AppColorScheme.darkStatusColors],
);
