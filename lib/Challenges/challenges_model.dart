import 'dart:convert';
import 'package:edupauee/Challenges/challenges_controller.dart';

class Challenge {
  final int id;
  final String cover;
  final String title;
  final String materiales;

  final String description;

  Challenge(
      {this.id, this.cover, this.title, this.description, this.materiales});

  factory Challenge.fromJson(Map<String, dynamic> parsedJson) {
    return Challenge(
        id: parsedJson["id"],
        cover: parsedJson["cover"],
        title: parsedJson["title"],
        description: parsedJson["description"],
        materiales: parsedJson["materiales"]);
  }
}

List<Challenge> allChallengeFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Challenge>.from(data.map((item) => Challenge.fromJson(item)));
}
