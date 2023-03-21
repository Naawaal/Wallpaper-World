import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_world/controllers/theme_controller.dart';

class CategoryWidget extends StatelessWidget {
  final index;
  CategoryWidget({super.key, this.index});

  final List<String> categoryName = [
    "Cityscapes",
    "Landscapes",
    "Nature",
    "Animals",
  ];

  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      alignment: Alignment.center,
      width: 80,
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: themeController.isDark
            ? Colors.grey.shade500
            : Colors.grey.shade300,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Text(
        categoryName[0],
        style: TextStyle(
          color: theme.primaryColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
