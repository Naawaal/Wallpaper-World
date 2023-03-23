import 'package:file/src/interface/file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';

class SetWallpaperController extends GetxController {
  //Todo: Lock Screen //
  Future<void> setLockScreenWallpaper(String imageUrl) async {
    String imagePath = imageUrl;
    File cachedimage = await DefaultCacheManager().getSingleFile(imagePath);
    int lockScreenWallpaper = WallpaperManagerFlutter.LOCK_SCREEN;

    try {
      await WallpaperManagerFlutter()
          .setwallpaperfromFile(cachedimage, lockScreenWallpaper);

      Get.back();
    } on PlatformException catch (e) {
      debugPrint('Error setting wallpaper: ${e.message}');
    }
  }

  //Todo: Home Screen //
  Future<void> setHomeScreenWallpaper(String imageUrl) async {
    String imagePath = imageUrl;
    File cachedimage = await DefaultCacheManager().getSingleFile(imagePath);
    int homeScreenWallpaper = WallpaperManagerFlutter.HOME_SCREEN;

    try {
      await WallpaperManagerFlutter()
          .setwallpaperfromFile(cachedimage, homeScreenWallpaper);

      Get.back();
    } on PlatformException catch (e) {
      debugPrint('Error setting wallpaper: ${e.message}');
    }
  }

  //Todo: Both Screen //

  Future<void> setBothScreenWallpaper(String imageUrl) async {
    String imagePath = imageUrl;
    File cachedimage = await DefaultCacheManager().getSingleFile(imagePath);
    int bothScreenWallpaper = WallpaperManagerFlutter.BOTH_SCREENS;

    try {
      await WallpaperManagerFlutter()
          .setwallpaperfromFile(cachedimage, bothScreenWallpaper);

      Get.back();
    } on PlatformException catch (e) {
      debugPrint('Error setting wallpaper: ${e.message}');
    }
  }

  Future<void> shareImage(String imageUrl) async {
    String imagePath = imageUrl;
    File cachedImage = await DefaultCacheManager().getSingleFile(imagePath);
    String cachedImagePath = cachedImage.path;

    await Share.shareFiles([cachedImagePath],
        text: 'Check out this image form Wallpaper World!');
  }
}
