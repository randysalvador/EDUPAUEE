import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:edupauee/views/juegos.dart';
import 'package:edupauee/views/comic.dart';
import 'package:edupauee/views/challenges.dart';
import 'package:edupauee/views/acerca_de.dart';
import 'package:edupauee/views/explorar.dart';
import 'package:edupauee/views/intro_page.dart';
import 'package:edupauee/views/video.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => IntroPage());
      case 'explorar':
        return MaterialPageRoute(builder: (_) => Explorar());
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
