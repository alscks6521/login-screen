import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static late SharedPreferences prefs;
  static const String isDarkModeKey = 'isDarkMode';

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
}
