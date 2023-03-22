import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_world/consts/text.dart';
import 'package:wallpaper_world/controllers/theme_controller.dart';
import 'package:wallpaper_world/services/api_service/search_image_api.dart';
import 'package:wallpaper_world/views/screens/full_image_screen.dart';

class CategoryScreen extends StatefulWidget {
  String categoryName;
  String imgScr;
  CategoryScreen({super.key, required this.categoryName, required this.imgScr});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: Get.width,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: NetworkImage(widget.imgScr),
                    fit: BoxFit.cover,
                  ),
                ),
              ).marginAll(5),
              Container(
                width: Get.width,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(12),
                  shape: BoxShape.rectangle,
                ),
              ).marginAll(5),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.categoryName,
                    style: const TextStyle(
                      fontSize: 22,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
          FutureBuilder(
            future: SearchImageApi().getSearchImage(widget.categoryName),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                  color: theme.primaryColor,
                ));
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Error',
                    style: TextStyle(
                      color: theme.primaryColor,
                    ),
                  ),
                );
              } else if (snapshot.hasData) {
                return Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.photos!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        mainAxisExtent: 400,
                      ),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(
                              FullImageScreen(
                                imageUrl: snapshot
                                    .data!.photos![index].src!.portrait
                                    .toString(),
                              ),
                            );
                          },
                          child: Hero(
                            tag: snapshot.data!.photos![index].src!.portrait
                                .toString(),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: NetworkImage(snapshot
                                      .data!.photos![index].src!.portrait
                                      .toString()),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ).marginSymmetric(horizontal: 5),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          )
        ],
      ),
    );
  }
}
