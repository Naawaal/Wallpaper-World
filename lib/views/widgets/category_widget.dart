import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_world/controllers/theme_controller.dart';
import 'package:wallpaper_world/views/screens/category.dart';

class CategoryWidget extends StatelessWidget {
  final String categoryName;
  final String imgScr;
  CategoryWidget({super.key, required this.categoryName, required this.imgScr});

  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Get.to(CategoryScreen(
          categoryName: categoryName,
          imgScr: imgScr,
        ));
      },
      child: Container(
        alignment: Alignment.center,
        width: 110,
        height: 120,
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
          categoryName,
          style: TextStyle(
            color: theme.primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
