import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';

@LazySingleton()
class SharedPreferenceHelper {
  // shared pref instance
  final SharedPreferences _sharedPreference;

  // constructor
  SharedPreferenceHelper(this._sharedPreference);

  // General Method ------------------------------------------------------------

  Future<bool> saveString(String key, String value) {
     return _sharedPreference.setString(key, value);
  }

  Future<bool> removeString(String key) async {
     return _sharedPreference.remove(key);
  }

  String? getString(String key) => _sharedPreference.getString(key);


  Future<bool>  saveBoolValue(String key, bool value) {
     return _sharedPreference.setBool(key, value);
  }

  bool? getBool(String key)  => _sharedPreference.getBool(key);


  Future<bool> saveIntValue(String key, int value) {
     return _sharedPreference.setInt(key, value);
  }

  int? getInt(String key) => _sharedPreference.getInt(key);



  // Theme:------------------------------------------------------
  bool get isDarkMode {
    return _sharedPreference.getBool(AppStrings.pref_is_dark_mode) ?? false;
  }

  Future<void> changeBrightnessToDark(bool value) {
    return _sharedPreference.setBool(AppStrings.pref_is_dark_mode, value);
  }

  // Language:---------------------------------------------------
  String? get currentLanguage {
    return _sharedPreference.getString(AppStrings.pref_language_code);
  }

  Future<void> changeLanguage(String language) {
    return _sharedPreference.setString(AppStrings.pref_language_code, language);
  }

}