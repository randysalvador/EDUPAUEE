import 'dart:convert';
import 'package:edupauee/Comic/comic_controller.dart';
import 'package:edupauee/Comic/comic_model.dart';

class Comic {
  final int id;
  final String title;
  final String images;

  Comic({this.id, this.title, this.images});
  factory Comic.fromJson(Map<String, dynamic> parsedJson) {
    return Comic(
        id: parsedJson["id"],
        title: parsedJson["title"],
        images: parsedJson["images"]);
  }
}

List<Comic> allComicFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Comic>.from(data.map((item) => Comic.fromJson(item)));
}
