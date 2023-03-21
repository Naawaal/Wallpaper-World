import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_world/consts/text.dart';
import 'package:wallpaper_world/controllers/theme_controller.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBarWidget(),
            const ListviewCategoryWidget(),
            SizedBox(
              width: Get.width,
              height: Get.height,
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    width: 50,
                    color: Colors.amber,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
