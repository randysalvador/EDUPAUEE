import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Challenges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F2430),
      appBar: AppBar(
        title: titulo(context),
        backgroundColor: Color(0xFF1F2430),
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: <Widget>[
              miCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget miCard() {
    return Container(
      padding: EdgeInsets.all(10.0),
      color: Color(0xFF1F2430),
      width: 360,
      height: 210,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 25.5,
            child: ImagenChallege(),
          ),
          letra(),
        ],
      ),
    );
  }

  Card letra() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(0, 45, 2, 10),
            title: Text(
              'La conductividad del agua salada',
              style: GoogleFonts.poppins(
                  fontSize: 25,
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.bold),
            ),
          ),
//          ImagenChallege(),
        ],
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

class ImagenChallege extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage =
        AssetImage('assets/images/challegeConductividad.png');
    Image image = Image(
      image: assetImage,
      width: 345,
      height: 157,
    );
    return Container(
      child: image,
    );
  }
}
