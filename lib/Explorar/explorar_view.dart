import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/widgets.dart';
import 'package:edupauee/Explorar/explorarVideo_view.dart';

//import 'package:get/get.dart';
class Explorar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: titulo(context),
        backgroundColor: Color(0xFF1F2430),
        elevation: 0,
      ),
      body: cardWidget(context),
      backgroundColor: Color(0xFF1F2430),
    );
  }
}

Widget cardWidget(BuildContext context) {
  return Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              child: ClipPath(
                clipper: ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: Container(
                  height: 317,
                  width: 360,
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.centerLeft,
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ImagenCafe2(),
                                Container(
                                  child: Text(
                                    'Eficiencia Energética, Reducir el Consumo',
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: Color(0XFFFFFFFF),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Video(
                            url: 'https://www.youtube.com/watch?v=fWDsSUzfy8o',
                            //url: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
                          )),
                );
              }),
        ],
      ),
    ],
  );
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

class ImagenCafe2 extends StatelessWidget {
  final urlImage;

  const ImagenCafe2({Key key, this.urlImage}) : super(key: key);
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
