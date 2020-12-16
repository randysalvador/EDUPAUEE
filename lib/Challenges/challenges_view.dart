import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'challenges_controller.dart';
import 'challenges_model.dart';

class Challenges extends StatelessWidget {
  final ChallengeController challengeController =
      Get.put<ChallengeController>(ChallengeController());
  final int id_challenge;

  Challenges({Key key, this.id_challenge});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChallengeController>(
      init: challengeController,
      builder: (_) => Scaffold(
        backgroundColor: Color(0xFF1F2430),
        appBar: AppBar(
          title: title(context),
          backgroundColor: Color(0xFF1F2430),
          elevation: 0,
        ),
        body: GestureDetector(
          onTap: () {
            print("Press");
          },
          child: FutureBuilder(
            future: _.getChallengeById(id_challenge),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Challenge> challenges = snapshot.data ?? [];
                return ListView.builder(
                  itemCount: challenges.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.0),
                          color: Color(0xFF1F2430),
                          width: 360,
                          height: 210,
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 25.5,
                                child: ImagenChallege(
                                  urlImage: snapshot.data[index].cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(22, 65, 10, 10),
                          child: Text(
                            snapshot.data[index].title,
                            style: GoogleFonts.poppins(
                                fontSize: 25,
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.bold),
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

Widget title(BuildContext context) {
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
  final urlImage;

  const ImagenChallege({Key key, this.urlImage}) : super(key: key);
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
