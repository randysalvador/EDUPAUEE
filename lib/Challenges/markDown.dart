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

  DetailsMarkDown({Key key, this.id_details});

  String text = "";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChallengeController>(
      init: detailsController,
      builder: (_) => Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF1F2430),
          title: const Text(
            "MarkDown Editor",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: FutureBuilder(
          future: _.getChallengeById(id_details),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Challenge> challenges = snapshot.data ?? [];
              return ListView.builder(
                itemCount: challenges.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      margin: EdgeInsets.all(20),
                      child: MarkdownBody(
                        data: snapshot.data[index].markdownContent,
                        styleSheet: MarkdownStyleSheet(
                          h2: TextStyle(color: Colors.blue, fontSize: 40),
                        ),
                      )),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        backgroundColor: Color(0xFF1F2430),
      ),
    );
  }

  Widget title(BuildContext context) {
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
                            color: Color(0xFFFFFFFF),
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
  }
}
