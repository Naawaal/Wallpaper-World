import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_world/consts/api.dart';
import 'package:wallpaper_world/model/tranding_image_model.dart';

class TrandingImageApi {
  Future<TrendingImageModel> getTrendingImages() async {
    final url = Uri.parse(baseUrl);
    final response = await http.get(url, headers: header);
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return TrendingImageModel.fromJson(data);
    }
    debugPrint("error: ${response.statusCode}");
    return Future.error("Error");
  }
}
