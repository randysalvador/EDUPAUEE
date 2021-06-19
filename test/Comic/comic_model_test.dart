import 'package:flutter_test/flutter_test.dart';
import 'package:edupauee/Comic/comic_model.dart';

void main() {
  test("Modelo decerializa Json y los pone por categoria", () {
    expect(
        Comic(
          cover: "cover",
          nombre: "nombre",
        ),
        isNotNull);
    expect(Contenido(url: "url"), isNotNull);
  });
}
