import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:get/get.dart';

import 'package:edupauee/Comic/comic_controller.dart';
import 'package:edupauee/Comic/comic_model.dart';
import 'Comic_listImage.dart';

class Comics extends StatelessWidget {
  final ComicController comicController =
      Get.put<ComicController>(ComicController());
  final int id_comic;

  Comics({Key key, this.id_comic});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ComicController>(
      init: comicController,
      builder: (_) => Scaffold(
        backgroundColor: Color(0xFF1F2430),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: titulo(context),
          backgroundColor: Color(0xFF1F2430),
          elevation: 0,
        ),
        body: FutureBuilder(
          future: _.getPr(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Comic> comic = snapshot.data ?? [];
              return ListView.builder(
                itemCount: comic.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Comic_listImage(
                          nombre: snapshot.data[index].nombre,
                          comic_content_list: snapshot.data[index].contenido,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: 357,
                    height: 594,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: ImagenComic(
                            urlImage: snapshot.data[index].cover,
                          ),
                          color: Color(0xFF1F2434),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: Color(0XFFFF6B3D),
              ));
            }
          },
        ),
      ),
    );
  }
}

Widget titulo(BuildContext context) {
  return Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text('EDU',
                style: GoogleFonts.bangers(
                    fontSize: 40, color: Color(0XFFFF6B3D))),
          ),
          Container(
            child: Text(
              ' PAUEE',
              style: GoogleFonts.bangers(
                fontSize: 40,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

class ImagenComic extends StatelessWidget {
  final urlImage;

  const ImagenComic({Key key, this.urlImage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 560,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(urlImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
