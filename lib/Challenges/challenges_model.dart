import 'dart:convert';
import 'package:edupauee/Challenges/challenges_controller.dart';

class Challenge {
  final int id;
  final String title;
  final String markdownContent;

  final String cover;

  Challenge({this.id, this.title, this.cover, this.markdownContent});

  factory Challenge.fromJson(Map<String, dynamic> parsedJson) {
    return Challenge(
        id: parsedJson["id"],
        title: parsedJson["title"],
        cover: parsedJson["cover"],
        markdownContent: parsedJson["markdown"]);
  }
}

List<Challenge> allChallengeFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Challenge>.from(data.map((item) => Challenge.fromJson(item)));
}
