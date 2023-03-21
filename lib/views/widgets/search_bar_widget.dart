import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_world/controllers/theme_controller.dart';

class SearchBarWidget extends StatelessWidget {
  SearchBarWidget({super.key});

  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: themeController.isDark ? Colors.white70 : Colors.black38,
        ),
      ),
      child: TextFormField(
        style: const TextStyle(
          fontSize: 16,
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        decoration: const InputDecoration(
          hintText: "Search Wallpaper",
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
          suffixIcon: Icon(
            Icons.search_rounded,
          ),
        ),
      ),
    ).marginOnly(left: 10, right: 10);
  }
}
