import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/user_entity.dart';

abstract class AuthLocalDataSource {
  Future<void> saveUser(UserEntity user, bool rememberStation);
  Future<UserEntity?> getUser();
  Future<bool> isRemembered();
  Future<void> clearUser();
}

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  static const String _userKey = 'auth_saved_user_v1';
  static const String _rememberKey = 'auth_remember_station_v1';

  @override
  Future<void> saveUser(UserEntity user, bool rememberStation) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, jsonEncode(user.toJson()));
    await prefs.setBool(_rememberKey, rememberStation);
  }

  @override
  Future<UserEntity?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final rawJson = prefs.getString(_userKey);
    if (rawJson != null && rawJson.isNotEmpty) {
      try {
        return UserEntity.fromJson(jsonDecode(rawJson));
      } catch (_) {}
    }
    return null;
  }

  @override
  Future<bool> isRemembered() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_rememberKey) ?? false;
  }

  @override
  Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
    await prefs.remove(_rememberKey);
  }
}
