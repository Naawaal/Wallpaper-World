import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_world/services/api_service/tranding_image_api.dart';
import 'package:wallpaper_world/views/widgets/category_widget.dart';

class ListviewCategoryWidget extends StatefulWidget {
  const ListviewCategoryWidget({super.key});

  @override
  State<ListviewCategoryWidget> createState() => _ListviewCategoryWidgetState();
}

class _ListviewCategoryWidgetState extends State<ListviewCategoryWidget> {
  final List<String> categoryName = [
    "Cityscapes",
    "Landscapes",
    "Nature",
    "Animals",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: Get.width,
        height: 50,
        child: FutureBuilder(
            future: TrandingImageApi().getTrendingImages(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryName.length,
                  itemBuilder: (context, index) {
                    return CategoryWidget(
                      categoryName: categoryName[index],
                      imgScr: snapshot.data!.photos![index].src!.portrait
                          .toString(),
                    );
                  },
                );
              }
              return const Center(child: CircularProgressIndicator());
            }),
      ).marginOnly(left: 5, top: 5, right: 5),
    );
  }
}
