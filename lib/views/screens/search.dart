import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_world/consts/text.dart';
import 'package:wallpaper_world/controllers/theme_controller.dart';
import 'package:wallpaper_world/views/widgets/gridview_widget.dart';
import 'package:wallpaper_world/views/widgets/search_bar_widget.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

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
        children: [
          SearchBarWidget(),
          GridviewWidget(),
        ],
      ),
    );
  }
}
