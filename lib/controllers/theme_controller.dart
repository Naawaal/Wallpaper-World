import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var isDark = false;

  void changeTheme() {
    isDark = !isDark;

    Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
  }
}
