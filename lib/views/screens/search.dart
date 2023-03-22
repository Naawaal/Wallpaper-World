import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_world/consts/text.dart';
import 'package:wallpaper_world/controllers/theme_controller.dart';
import 'package:wallpaper_world/services/api_service/search_image_api.dart';
import 'package:wallpaper_world/views/screens/full_image_screen.dart';
import 'package:wallpaper_world/views/widgets/search_bar_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

final TextEditingController controller = TextEditingController();

class _SearchScreenState extends State<SearchScreen> {
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
          SearchBarWidget(
            controller: controller,
            onSumbitted: (p0) {
              setState(() {
                SearchImageApi().getSearchImage(controller.text);
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: SearchImageApi().getSearchImage(controller.text),
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
