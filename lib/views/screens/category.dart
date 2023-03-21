import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_world/consts/text.dart';
import 'package:wallpaper_world/controllers/theme_controller.dart';
import 'package:wallpaper_world/views/widgets/gridview_widget.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text(
          appName,
          style: TextStyle(
            color: theme.appBarTheme.toolbarTextStyle!.color,
            fontWeight: theme.appBarTheme.toolbarTextStyle!.fontWeight,
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: Get.width,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  shape: BoxShape.rectangle,
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://images.pexels.com/photos/460672/pexels-photo-460672.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                    fit: BoxFit.cover,
                  ),
                ),
              ).marginAll(5),
              Container(
                width: Get.width,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(12),
                  shape: BoxShape.rectangle,
                ),
              ).marginAll(5),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Cityscapes',
                    style: TextStyle(
                      fontSize: 18,
                      color: theme.primaryColor,
                    ),
                  ),
                ],
              )
            ],
          ),
          const GridviewWidget(),
        ],
      ),
    );
  }
}
