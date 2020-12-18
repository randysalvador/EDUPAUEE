import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:get/get.dart';

import 'package:edupauee/Comic/comic_controller.dart';
import 'package:edupauee/Comic/comic_model.dart';

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
        body: GestureDetector(
          onTap: () {
            print("press");
          },
          child: FutureBuilder(
            future: _.getComicById(id_comic),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Comic> comic = snapshot.data ?? [];
                return ListView.builder(
                  itemCount: comic.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          width: 367,
                          height: 684,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: ImagenComic(
                                  urlImage: snapshot.data[index].cover,
                                ),
                                color: Color(0xFF000000),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
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
      child: Image.network(
        urlImage,
        width: 345,
        height: 157,
      ),
    );
  }
}
