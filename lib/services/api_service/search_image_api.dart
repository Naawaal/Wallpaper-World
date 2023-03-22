import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_world/consts/api.dart';
import 'package:wallpaper_world/model/tranding_image_model.dart';

class SearchImageApi {
  Future<TrendingImageModel> getSearchImage(String query) async {
    final searchBaseUrl =
        "https://api.pexels.com/v1/search?query=$query&per_page=30";
    final url = Uri.parse(searchBaseUrl);
    final response = await http.get(url, headers: header);
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return TrendingImageModel.fromJson(data);
    }
    debugPrint("error: ${response.statusCode}");
    return Future.error("Error");
  }
}
