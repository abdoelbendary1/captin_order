import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_strings.dart';

@singleton
class LocaleCubit extends Cubit<Locale> {
  static const String _prefLangKey = 'key_captin_order_language_v1';

  LocaleCubit() : super(const Locale('ar')) {
    _loadSavedLocale();
  }

  Future<void> _loadSavedLocale() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final langCode = prefs.getString(_prefLangKey) ?? 'ar';
      final savedLocale = Locale(langCode);
      AppStrings.setLocale(savedLocale);
      emit(savedLocale);
    } catch (_) {
      AppStrings.setLocale(const Locale('ar'));
      emit(const Locale('ar'));
    }
  }

  Future<void> setLocale(Locale locale) async {
    AppStrings.setLocale(locale);
    emit(locale);
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefLangKey, locale.languageCode);
    } catch (_) {}
  }

  Future<void> toggleLanguage() async {
    final nextLocale = state.languageCode == 'ar'
        ? const Locale('en')
        : const Locale('ar');
    await setLocale(nextLocale);
  }

  bool get isArabic => state.languageCode == 'ar';
}
