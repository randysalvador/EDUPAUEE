import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'package:get/get.dart';
class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
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
          Column(
            children: <Widget>[
              miCard(),
              miCardDesign(),
              miCardDesign2(),
            ],
          ),
        ],
      ),
      backgroundColor: Color(0xFF1F2430),
    );
  }
}

Card miCard() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    margin: EdgeInsets.all(25),
    elevation: 10,
    color: Color(0xFF243164),
    child: Column(
      children: <Widget>[
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 15),
          title: Text(
            'Acerca de',
            style: GoogleFonts.poppins(
                fontSize: 30,
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}

Card miCardDesign() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    margin: EdgeInsets.all(25),
    elevation: 10,
    color: Color(0xFF575A66),
    child: Column(
      children: <Widget>[
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(15, 10, 10, 0),
          title: Text(
            'Futuro',
            style: GoogleFonts.poppins(
                fontSize: 16,
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            'La aplicación seguirá creciendo para poder brindar más conocimiento a la parte educativa.',
            style: GoogleFonts.poppins(fontSize: 14, color: Color(0xFFFFFFFF)),
          ),
          leading: Icon(
            Icons.info,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

Card miCardDesign2() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    margin: EdgeInsets.all(25),
    elevation: 10,
    color: Color(0xFF575A66),
    child: Column(
      children: <Widget>[
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(15, 10, 10, 0),
          title: Text(
            'Aplicación hecha por:',
            style: GoogleFonts.poppins(
                fontSize: 16,
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            'Randy Angel Salvador Bautista. https://www.linkedin.com/in/randy-salvador-9272811ab/',
            style: GoogleFonts.poppins(fontSize: 14, color: Color(0xFFFFFFFF)),
          ),
          leading: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
      ],
    ),
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
