import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'package:get/get.dart';
class Juegos extends StatefulWidget {
  @override
  _JuegosState createState() => _JuegosState();
}

class _JuegosState extends State<Juegos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: titulo(context),
        backgroundColor: Color(0xFF1F2430),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: catalogo(context),
      ),
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
    width: 3008,
    height: 500,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ImagenJuego1(),
          color: Color(0xFF1F2430),
        ),
      ],
    ),
  );
}

class ImagenJuego1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('assets/images/juego1.png');
    Image image = Image(
      image: assetImage,
      width: 298,
      height: 490,
    );
    return Container(
      child: image,
    );
  }
}

class ImagenJuego2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('assets/images/juego2.png');
    Image image = Image(
      image: assetImage,
      width: 298,
      height: 470,
    );
    return Container(
      child: image,
    );
  }
}
