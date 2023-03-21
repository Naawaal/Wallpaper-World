import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_world/consts/api.dart';
import 'package:wallpaper_world/model/tranding_image_model.dart';

class TrandingImageApi {
  static List<Photo> trendingWallpaper = [];

  Future<List<Photo>> getTrendingImages() async {
    final url = Uri.parse(baseUrl);
    final response = await http.get(url, headers: header);

    if (response.statusCode == 200) {
      final data = response.body;
      final decodedResponse = jsonDecode(data)['photos'];
      final List<Photo> photos = [];
      for (var i = 0; i < decodedResponse.length; i++) {
        final photo = Photo.fromJson(decodedResponse[i]);
        photos.add(photo);
      }
      trendingWallpaper = photos;
      return photos;
    } else {
      debugPrint(response.statusCode.toString());
      return [];
    }
  }
}
