import 'package:daelim_univ/common/helpers/locale_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static late SharedPreferences prefs;
  static const String isDarkModeKey = 'isDarkMode';
  static String isLocaleKey = 'locale';

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setDarkMode(bool isDarkMode) async {
    await prefs.setBool(isDarkModeKey, isDarkMode);
    Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }

  static bool get isDarkMode {
    // 방법1. 평범
    // bool? isDarkMode = prefs.getBool(isDarkModeKey);
    // isDarkMode ??= (ThemeMode.system == ThemeMode.dark);
    // return isDarkMode;

    // 방법2. 효과적인 한줄
    return (prefs.getBool(isDarkModeKey)) ?? (ThemeMode.system == ThemeMode.dark);
  }

  // 삼항연산자로 테마 모드를 설정
  static ThemeMode themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;

  /// 국제화 언어코드 저장
  static Future<void> setLocale(Locale locale) async {
    await prefs.setString(isLocaleKey, locale.languageCode);
    Get.updateLocale(locale);
  }

  /// 국제화 언어코드 삭제
  static Future<bool> removeLocale() {
    return prefs.remove(isLocaleKey);
  }

  static Locale get locale {
    final languageTag = prefs.getString(isLocaleKey);

    if (languageTag == null) {
      return Get.deviceLocale ?? LocaleHelper.english;
    }

    // 1-1 평범 방법
    // if (languageTag == LocaleHelper.korean.languageCode) {
    //   return LocaleHelper.korean;
    // } else {
    //   return LocaleHelper.english;
    // }

    // 1-2 방법 삼항
    // return languageTag == LocaleHelper.korean.languageCode ? LocaleHelper.korean : LocaleHelper.english;

    // switch Reject
    return switch (languageTag) {
      'ko' => LocaleHelper.korean,
      _ => LocaleHelper.english,
    };
  }
}
