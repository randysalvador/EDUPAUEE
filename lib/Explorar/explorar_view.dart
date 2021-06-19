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
      builder: (_) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/FondoEdu.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
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
                          padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 13,
                              ),
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
                                    height: 40,
                                    width: MediaQuery.of(context).size.width,
                                    child: Material(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                      color: Color(0xFFBB9959).withOpacity(0.8),
                                      child: Align(
                                        //alignment: Alignment.centerLeft,
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          padding:
                                              EdgeInsets.fromLTRB(15, 0, 15, 0),
                                          child: Text(
                                            snapshot.data[index].title
                                                .toUpperCase(),
                                            style: GoogleFonts.poppins(
                                                fontSize: 9,
                                                color: Color(0XFFFFFFFF),
                                                fontWeight: FontWeight.bold),
                                          ),
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
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
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
