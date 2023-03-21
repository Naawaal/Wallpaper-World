import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_world/views/widgets/category_widget.dart';

class ListviewCategoryWidget extends StatelessWidget {
  const ListviewCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          index = index;
          return CategoryWidget();
        },
      ),
    ).marginOnly(left: 5, top: 5, right: 5);
  }
}
