import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_world/controllers/set_wallpaper_controller.dart';

class SetWallpaper extends StatelessWidget {
  final String imageUrl;
  SetWallpaper({super.key, required this.imageUrl});

  final setWallpaperController = Get.put(SetWallpaperController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Todo: Set Wallpaper as Lock Screen //
        TextButton.icon(
          onPressed: () {
            setWallpaperController.setLockScreenWallpaper(imageUrl);
          },
          icon: const Icon(
            Icons.screen_lock_portrait_rounded,
            size: 30,
            color: Colors.black,
          ),
          label: const Text(
            "Set as Lock screen",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        //Todo: Set Wallpaper as Home Screen //
        TextButton.icon(
          onPressed: () {
            setWallpaperController.setHomeScreenWallpaper(imageUrl);
          },
          icon: const Icon(
            Icons.add_to_home_screen_outlined,
            size: 30,
            color: Colors.black,
          ),
          label: const Text(
            "Set as Home screen",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        //Todo: Both SCreen //
        TextButton.icon(
          onPressed: () {
            setWallpaperController.setBothScreenWallpaper(imageUrl);
          },
          icon: const Icon(
            Icons.splitscreen_outlined,
            size: 30,
            color: Colors.black,
          ),
          label: const Text(
            "Both screen",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
