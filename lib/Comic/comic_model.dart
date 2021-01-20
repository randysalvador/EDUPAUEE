import 'dart:convert';

List<Comic> allComicFromJson(String str) =>
    List<Comic>.from(json.decode(str).map((x) => Comic.fromJson(x)));

String comicToJson(List<Comic> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comic {
  Comic({
    this.comicId,
    this.nombre,
    this.cover,
    this.contenido,
  });

  final String comicId;
  final String nombre;
  final String cover;
  final List<Contenido> contenido;

  factory Comic.fromJson(Map<String, dynamic> json) => Comic(
        comicId: json["comicId"],
        nombre: json["nombre"],
        cover: json["cover"],
        contenido: List<Contenido>.from(
            json["contenido"].map((x) => Contenido.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "comicId": comicId,
        "nombre": nombre,
        "cover": cover,
        "contenido": List<dynamic>.from(contenido.map((x) => x.toJson())),
      };
}

class Contenido {
  Contenido({
    this.url,
  });

  final String url;

  factory Contenido.fromJson(Map<String, dynamic> json) => Contenido(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
