import 'package:flutter/material.dart';
//import 'package:get/get.dart';
import 'package:edupauee/my_app.dart';
import 'package:edupauee/views/juegos.dart';
import 'package:edupauee/views/comic.dart';
import 'package:edupauee/views/challenges.dart';
import 'package:edupauee/views/acerca_de.dart';
import 'package:edupauee/views/intro_page.dart';
import 'package:edupauee/views/video.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'EDUPAUEE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF1F2430),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onGenerateRoute: Router.generateRoute,
    ),
  );
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => IntroPage());
      case 'app':
        return MaterialPageRoute(builder: (_) => MyApp());
      case 'juegos':
        return MaterialPageRoute(builder: (_) => Juegos());
      case 'comic':
        return MaterialPageRoute(builder: (_) => Comic());
      case 'challenges':
        return MaterialPageRoute(builder: (_) => Challenges());
      case 'about':
        return MaterialPageRoute(builder: (_) => About());
      case 'video':
        return MaterialPageRoute(builder: (_) => Video());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}

/*void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context){
    return GetMaterialApp(
      title: 'EDUPAUEE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData( 
        backgroundColor: Color(0xFF1F2430),
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF0058A3),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Explorar(),
    );
  }
}*/
