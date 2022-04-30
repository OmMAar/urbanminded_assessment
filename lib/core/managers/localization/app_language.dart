import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/material.dart';
import 'package:urbanminded_assessment/core/constants/constants.dart';
import 'package:urbanminded_assessment/core/di/di.dart';
import 'package:urbanminded_assessment/core/helpers/helper.dart';
import 'package:urbanminded_assessment/core/utils/utils.dart';


class AppLanguage extends ChangeNotifier {
  Locale _appLocale = const Locale(AppStrings.LANG_EN);
  String _langCode = AppStrings.LANG_EN;

  Locale get appLocal => _appLocale;

  String get langCode => _langCode;

  fetchLocale() async {
    SharedPreferenceHelper prefs = findDep<SharedPreferenceHelper>();

    /// todo: uncomment these line when you want to change language working
    // if (prefs.getString(AppStrings.pref_language_code) == null) {
    //   String deviceLang = await getDeviceLang();
    //   if (deviceLang == AppStrings.LANG_AR) {
    //     _appLocale = const Locale(AppStrings.LANG_AR);
    //     _langCode = AppStrings.LANG_AR;
    //   } else {
    //     _appLocale = const Locale(AppStrings.LANG_EN);
    //     _langCode = AppStrings.LANG_EN;
    //   }
    //
    //   return Null;
    // }
    _appLocale = Locale(
        prefs.getString(AppStrings.pref_language_code) ?? AppStrings.LANG_EN);
    _langCode =
        prefs.getString(AppStrings.pref_language_code) ?? AppStrings.LANG_EN;
    return Null;
  }

  void changeLanguage(Locale type) async {
    SharedPreferenceHelper prefs = findDep<SharedPreferenceHelper>();

    if (_appLocale == type) {
      return;
    }
    if (type == const Locale(AppStrings.LANG_AR)) {
      _appLocale = const Locale(AppStrings.LANG_AR);
      _langCode = AppStrings.LANG_AR;
      await prefs.saveString(AppStrings.pref_language_code, AppStrings.LANG_AR);
      appUtils.setLang(AppStrings.LANG_AR);
    } else {
      _appLocale = const Locale(AppStrings.LANG_EN);
      _langCode = AppStrings.LANG_EN;
      await prefs.saveString(AppStrings.pref_language_code, AppStrings.LANG_EN);
      appUtils.setLang(AppStrings.LANG_EN);
    }
    notifyListeners();
  }

  Future<String> getDeviceLang() async {
    String? locale = await Devicelocale.currentLocale;
    String str;
    if (locale.toString().contains("_")) {
      str = locale.toString().substring(0, locale.toString().indexOf('_'));
    } else if (locale.toString().contains("-")) {
      str = locale.toString().substring(0, locale.toString().indexOf('-'));
    } else {
      str = locale.toString();
    }
    appPrint("GetDeviceLang $str");
    return str;
  }
}
