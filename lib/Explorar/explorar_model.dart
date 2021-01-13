import 'dart:convert';
import 'package:edupauee/Explorar/explorar_controller.dart';
import 'package:edupauee/Explorar/explorar_view.dart';

class Explore {
  final int id;
  final String title;
  final String url;
  final String cover;

  Explore({this.id, this.title, this.url, this.cover});

  factory Explore.fromJson(Map<String, dynamic> parsedJson) {
    return Explore(
        id: parsedJson["id"],
        title: parsedJson["title"],
        cover: parsedJson["cover"],
        url: parsedJson["url"]);
  }
}

List<Explore> allExplorarFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Explore>.from(data.map((item) => Explore.fromJson(item)));
}
