import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:edupauee/Juegos/QuizStar/quizpage.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<String> images = [
    "images/energiaR.png",
    "images/reciclaje.jpg",
  ];

  List<String> des = [
    "Energía que utiliza los recursos inagotables de la naturaleza, como la biomasa, las radiaciones solares o el viento.\n ",
    "El reciclaje es un proceso cuyo objetivo es convertir residuos en nuevos productos o en materia prima para su posterior utilización.\n",
    "El uso eficiente de la energía, a veces simplemente llamado, eficiencia energética o ahorro energético, es el\n objetivo de reducir la cantidad de energía requerida para proporcionar productos y servicios.\n",
  ];

  Widget customcard(String langname, String image, String des) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            // in changelog 1 we will pass the langname name to ther other widget class
            // this name will be used to open a particular JSON file
            // for a particular language
            builder: (context) => getjson(langname),
          ));
        },
        child: Material(
          color: Color(0xFFE7503B),
          elevation: 10.0,
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      // changing from 200 to 150 as to look better
                      height: 150.0,
                      width: 150.0,
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            image,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    langname,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: "Quando",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    des,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontFamily: "Alike"),
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1F2430),
        title: Text(
          "Quizstar",
          style: TextStyle(
            fontFamily: "Quando",
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          customcard("Energía renovable", images[0], des[0]),
          customcard("Reciclaje", images[1], des[1]),
        ],
      ),
      backgroundColor: Color(0xFF1F2430),
    );
  }
}
