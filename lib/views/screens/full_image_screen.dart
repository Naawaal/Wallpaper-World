import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_world/controllers/download_controller.dart';
import 'package:wallpaper_world/views/screens/set_wallpaper.dart';

class FullImageScreen extends StatefulWidget {
  String? imageUrl;
  FullImageScreen({super.key, this.imageUrl});

  @override
  State<FullImageScreen> createState() => _FullImageScreenState();
}

final DonwloadController donwloadController = Get.put(DonwloadController());

class _FullImageScreenState extends State<FullImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.imageUrl!),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                shape: BoxShape.rectangle,
                color: Colors.black.withOpacity(0.4),
              ),
              child: IconButton(
                onPressed: () {
                  donwloadController.downloadImage(widget.imageUrl!);
                },
                icon: const Icon(Icons.download_outlined),
                color: Colors.white,
                iconSize: 30,
              ),
            ).marginOnly(bottom: 10),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                shape: BoxShape.rectangle,
                color: Colors.black.withOpacity(0.4),
              ),
              child: TextButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Container(
                        alignment: Alignment.center,
                        width: Get.width,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const SetWallpaper(),
                      ).marginOnly(left: 5, right: 5);
                    },
                  );
                },
                icon: const Icon(
                  Icons.wallpaper_outlined,
                  color: Colors.white,
                  size: 30,
                ),
                label: const Text(
                  "Set Wallpaper",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ).marginOnly(bottom: 10),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                shape: BoxShape.rectangle,
                color: Colors.black.withOpacity(0.4),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share_outlined),
                color: Colors.white,
                iconSize: 30,
              ),
            ).marginOnly(bottom: 10),
          ],
        ),
      ),
    );
  }
}
