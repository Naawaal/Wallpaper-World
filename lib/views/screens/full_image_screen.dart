import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullImageScreen extends StatefulWidget {
  String? imageUrl;
  FullImageScreen({super.key, this.imageUrl});

  @override
  State<FullImageScreen> createState() => _FullImageScreenState();
}

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
                onPressed: () {},
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
                onPressed: () {},
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
          ],
        ),
      ),
    );
  }
}
