import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_world/consts/custom_theme.dart';
import 'package:wallpaper_world/views/screens/homepage_screen.dart';

class WallpaperWorld extends StatelessWidget {
  const WallpaperWorld({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper World',
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const HomepageScreen(),
    );
  }
}
