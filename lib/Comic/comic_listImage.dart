import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:get/get.dart';

import 'package:edupauee/Comic/comic_controller.dart';
import 'package:edupauee/Comic/comic_model.dart';
import 'comic_view.dart';

class Comic_listImage extends StatelessWidget {
  final ComicController comicController =
      Get.put<ComicController>(ComicController());
  final int id_comic;
  final String nombre;
  final List<dynamic> comic_content_list;

  //final String image;

  Comic_listImage({
    Key key,
    this.id_comic,
    this.nombre,
    this.comic_content_list,

    //this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ComicController>(
      init: comicController,
      builder: (_) => Scaffold(
        backgroundColor: Color(0xFF1F2430),
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: titulo(context),
          backgroundColor: Color(0xFF1F2430),
          elevation: 0,
        ),
        body: FutureBuilder(
          future: _.getPr(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //List<dynamic> comic = snapshot.data ?? [];
              return ListView.builder(
                itemCount: comic_content_list.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 600,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              comic_content_list[index].url.toString()),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Color(0xFFFF6B3D),
                ),
              );
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
