import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_world/consts/text.dart';
import 'package:wallpaper_world/controllers/theme_controller.dart';
import 'package:wallpaper_world/views/screens/search.dart';
import 'package:wallpaper_world/views/widgets/gridview_widget.dart';
import 'package:wallpaper_world/views/widgets/listview_category_widget.dart';
import 'package:wallpaper_world/views/widgets/search_bar_widget.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

final themeController = Get.put(ThemeController());

class _HomepageScreenState extends State<HomepageScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: theme.iconTheme,
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text(
          appName,
          style: TextStyle(
            color: theme.appBarTheme.toolbarTextStyle!.color,
            fontWeight: theme.appBarTheme.toolbarTextStyle!.fontWeight,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              themeController.changeTheme();
            },
            icon: Icon(
              themeController.isDark
                  ? Icons.light_mode_rounded
                  : Icons.dark_mode_rounded,
              color: theme.iconTheme.color,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBarWidget(
            controller: controller,
            onSumbitted: (value) {
              if (controller.text.isNotEmpty) {
                Get.to(() => const SearchScreen());
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Featured",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: theme.primaryColor,
            ),
          ).marginOnly(left: 10),
          const ListviewCategoryWidget(),
          Text(
            "Tranding Wallpapers",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: theme.primaryColor,
            ),
          ).marginOnly(left: 10),
          const SizedBox(
            height: 10,
          ),
          const Expanded(
            child: GridviewWidget(),
          ),
        ],
      ),
    );
  }
}
