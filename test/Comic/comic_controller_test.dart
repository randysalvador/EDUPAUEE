import 'package:flutter_test/flutter_test.dart';
import 'package:edupauee/Comic/comic_controller.dart';

void main() {
  test("Controlador de Challenge recibe datos decerializados de Json",
      () async {
    expect(ComicController, isNotNull);
  });
}
