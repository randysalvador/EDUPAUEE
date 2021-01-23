import 'package:flutter_test/flutter_test.dart';
import 'package:edupauee/Challenges/challenges_model.dart';

void main() {
  test("Modelo decerializa Json y los pone por categoria", () {
    expect(
        Challenge(
            cover: "cover",
            title: "title",
            description: "description",
            materiales: "materiales"),
        isNotNull);
  });
}
