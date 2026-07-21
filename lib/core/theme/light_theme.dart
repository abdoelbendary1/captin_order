import 'package:flutter/material.dart';
import 'color_scheme.dart';
import 'app_text_theme.dart';
import 'app_button_theme.dart';
import 'app_card_theme.dart';
import 'app_input_theme.dart';
import 'app_appbar_theme.dart';
import 'app_icon_button_theme.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: AppColorScheme.lightColorScheme,
  scaffoldBackgroundColor: AppColorScheme.lightColorScheme.surface,
  textTheme: AppTextTheme.textTheme(AppColorScheme.lightColorScheme.onSurface),
  elevatedButtonTheme: AppButtonTheme.elevatedButtonTheme(AppColorScheme.lightColorScheme),
  cardTheme: AppCardTheme.cardTheme(AppColorScheme.lightColorScheme),
  inputDecorationTheme: AppInputTheme.inputDecorationTheme(AppColorScheme.lightColorScheme),
  appBarTheme: AppAppBarTheme.appBarTheme(AppColorScheme.lightColorScheme),
  iconButtonTheme: AppIconButtonTheme.iconButtonTheme(AppColorScheme.lightColorScheme),
);