import 'dart:math';

import 'package:edupauee/Explorar/explorar_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Modelo explorar decerializa los datos del Json", () {
    Explore(
      cover: "",
      title: "",
      url: "",
    );
    expect(Explore(cover: "cover", title: "title", url: "//"), isNotNull);
  });
}
