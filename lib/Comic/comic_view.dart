import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'package:get/get.dart';
class Comic extends StatefulWidget {
  @override
  _ComicState createState() => _ComicState();
}

class _ComicState extends State<Comic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: titulo(context),
        backgroundColor: Color(0xFF1F2430),
        elevation: 0,
      ),
      body: catalogo(context),
      backgroundColor: Color(0xFF1F2430),
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

Widget catalogo(BuildContext context) {
  return Container(
    width: 367,
    height: 684,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ImagenComic(),
          color: Color(0xFF000000),
        ),
      ],
    ),
  );
}

class ImagenComic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('assets/images/comic.png');
    Image image = Image(
      image: assetImage,
      width: 327,
      height: 564,
    );
    return Container(
      child: image,
    );
  }
}
