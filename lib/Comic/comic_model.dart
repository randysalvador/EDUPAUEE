import 'dart:convert';
import 'package:edupauee/Comic/comic_controller.dart';
import 'package:edupauee/Comic/comic_model.dart';

class Comic {
  final int id;
  final String cover;
  Comic({this.id, this.cover});
  factory Comic.fromJson(Map<String, dynamic> parsedJson) {
    return Comic(id: parsedJson["id"], cover: parsedJson["cover"]);
  }
}

List<Comic> allComicFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Comic>.from(data.map((item) => Comic.fromJson(item)));
}
