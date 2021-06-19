import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:get/get.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: title(context),
      ),
      backgroundColor: Color(0xFF1F2430),
    );
  }

  Widget title(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(25, 53, 10, 15),
          title: Text(
            'La conductividad del agua salada',
            style: GoogleFonts.poppins(
                fontSize: 20,
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
