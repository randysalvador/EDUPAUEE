import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'challenges_controller.dart';
import 'challenges_model.dart';

class DetailsMarkDown extends StatelessWidget {
  final ChallengeController detailsController =
      Get.put<ChallengeController>(ChallengeController());
  final int id_details;
  final String cover;
  final String title;
  final String description;
  final String materiales;

  DetailsMarkDown(
      {Key key,
      this.id_details,
      this.cover,
      this.title,
      this.description,
      this.materiales});

  String text = "";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChallengeController>(
      init: detailsController,
      builder: (_) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/fondoBEDU.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Color(0xFF9B2242),
            title: const Text(
              "Experimentos",
              style: TextStyle(color: Colors.white),
            ),
            elevation: 0,
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      height: 100,
                      width: double.infinity,
                      child: Text(
                        title,
                        style: GoogleFonts.poppins(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: 343,
                      height: 157,
                      child: ImagenChallenge(
                        urlImage: cover,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "Materiales",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.all(20),
                      child: MarkdownBody(
                        data: materiales,
                        styleSheet: MarkdownStyleSheet(
                          p: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "Instrucciones",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: MarkdownBody(
                        data: description,
                        styleSheet: MarkdownStyleSheet(
                          p: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /*Widget title2(BuildContext context) {
    return GetBuilder<ChallengeController>(
      init: detailsController,
      builder: (_) => Column(
        children: <Widget>[
          FutureBuilder(
            future: _.getChallengeById(id_details),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Challenge> challenges = snapshot.data ?? [];
                return ListView.builder(
                  itemCount: challenges.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.fromLTRB(25, 53, 10, 15),
                      title: Text(
                        snapshot.data[index].title,
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }*/
}

class ImagenChallenge extends StatelessWidget {
  final urlImage;

  const ImagenChallenge({Key key, this.urlImage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        urlImage,
        width: 345,
        height: 157,
        fit: BoxFit.cover,
      ),
    );
  }
}
