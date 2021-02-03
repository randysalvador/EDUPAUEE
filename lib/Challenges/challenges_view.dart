import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'challenges_controller.dart';
import 'challenges_model.dart';

import 'markDown.dart';

class Challenges extends StatelessWidget {
  final ChallengeController challengeController =
      Get.put<ChallengeController>(ChallengeController());
  final int id_challenge;

  Challenges({Key key, this.id_challenge});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChallengeController>(
      init: challengeController,
      builder: (_) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/FondoEdu.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            flexibleSpace: Container(
              alignment: Alignment.bottomCenter,
              child: Imagen(),
            ),
          ),
          body: FutureBuilder(
            future: _.getChallengeById(id_challenge),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Challenge> challenges = snapshot.data ?? [];
                return ListView.builder(
                  itemCount: challenges.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsMarkDown(
                            cover: snapshot.data[index].cover,
                            title: snapshot.data[index].title,
                            description: snapshot.data[index].description,
                            materiales: snapshot.data[index].materiales,
                          ),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 157,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          snapshot.data[index].cover),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              SizedBox(
                                height: 14,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(44, 66, 27, 10),
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

class Imagen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('assets/images/appbarlogo.png');
    Image image = Image(
      image: assetImage,
      width: 335,
      height: 55,
    );
    return Container(
      child: image,
    );
  }
}
