import 'package:flutter_test/flutter_test.dart';
import 'package:edupauee/Challenges/challenges_controller.dart';

void main() {
  test("Controlador de Challenge recibe datos deserializados de Json",
      () async {
    expect(ChallengeController, isNotNull);
  });
}
