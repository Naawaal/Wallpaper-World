import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_world/model/tranding_image_model.dart';

import 'package:wallpaper_world/services/api_service/tranding_image_api.dart';
import 'package:wallpaper_world/views/screens/full_image_screen.dart';

class GridviewWidget extends StatelessWidget {
  const GridviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TrendingImageModel>(
      future: TrandingImageApi().getTrendingImages(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error'));
        } else if (snapshot.hasData) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.photos!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                        imageUrl: snapshot.data!.photos![index].src!.portrait
                            .toString(),
                      ),
                    );
                  },
                  child: Hero(
                    tag: snapshot.data!.photos![index].src!.portrait.toString(),
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
          ).marginSymmetric(horizontal: 5);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
