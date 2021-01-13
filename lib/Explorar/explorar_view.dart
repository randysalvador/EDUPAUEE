import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/widgets.dart';
import 'package:edupauee/Explorar/explorarVideo_view.dart';
import 'explorar_controller.dart';
import 'explorar_model.dart';

//import 'package:get/get.dart';
class Explores extends StatelessWidget {
  final ExplorarController explorarController =
      Get.put<ExplorarController>(ExplorarController());
  final int id_explore;

  Explores({Key key, this.id_explore});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExplorarController>(
      init: explorarController,
      builder: (_) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: titulo(context),
          backgroundColor: Color(0xFF1F2430),
          elevation: 0,
        ),
        body: FutureBuilder(
          future: _.getExplorargeById(id_explore),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Explore> explores = snapshot.data ?? [];
              return ListView.builder(
                itemCount: explores.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Video(
                          url: snapshot.data[index].url,
                          //url: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        snapshot.data[index].cover),
                                    fit: BoxFit.cover),
                              ),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  child: Material(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                    color: Color(0xFF1F2430).withOpacity(0.8),
                                    child: Align(
                                      //alignment: Alignment.centerLeft,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        snapshot.data[index].title,
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: Color(0XFFFFFFFF),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 13.0,
                            )
                          ],
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
        backgroundColor: Color(0xFF1F2430),
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
