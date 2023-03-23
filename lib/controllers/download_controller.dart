import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';

class DonwloadController extends GetxController {
  Future<void> downloadImage(String imgScr) async {
    final imageSave =
        await GallerySaver.saveImage(imgScr, albumName: 'Wallpaper World');
    if (imageSave != null) {
      Get.snackbar(
        colorText: Colors.white,
        "Downloaded",
        "Downloaded File Saved On Galley",
      );
    }
  }
}
