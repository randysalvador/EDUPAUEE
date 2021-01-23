import 'package:edupauee/Juegos/QuizStar/home.dart';
import 'package:edupauee/Juegos/QuizStar/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'package:get/get.dart';
class JuegosC extends StatefulWidget {
  @override
  _JuegosState createState() => _JuegosState();
}

class _JuegosState extends State<JuegosC> {
  List<String> images = [
    "assets/images/juego1.png",
    "assets/images/juego2.png",
    "assets/images/quizt.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: titulo(context),
        backgroundColor: Color(0xFF1F2430),
        elevation: 0,
      ),
      body: ListView(
        children: [
          customcard(images[2]),
        ],
      ),
      backgroundColor: Color(0xFF1F2430),
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

  Widget customcard(String image) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 20.0,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            // in changelog 1 we will pass the langname name to ther other widget class
            // this name will be used to open a particular JSON file
            // for a particular language
            builder: (context) => Splashscreen(),
          ));
        },
        child: Material(
          color: Colors.transparent,
          elevation: 0.0,
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 0.0,
                  ),
                  child: Container(
                    // changing from 200 to 150 as to look better
                    width: 298,
                    height: 300,
                    child: Image(
                      image: AssetImage(
                        image,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
