import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:edupauee/About/about_view.dart';
import 'package:edupauee/Challenges/challenges_view.dart';
import 'package:edupauee/Comic/comic_view.dart';
import 'package:edupauee/Explorar/explorarVideo_view.dart';
import 'package:edupauee/Juegos/juego_view.dart';
import 'package:edupauee/OnBoarding/onBoarding_view.dart';
import 'package:edupauee/Explorar/explorar_view.dart';

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
