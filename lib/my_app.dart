import 'package:flutter/material.dart';

import 'package:edupauee/About/about_view.dart';
import 'package:edupauee/Challenges/challenges_view.dart';
import 'package:edupauee/Comic/comic_view.dart';
import 'package:edupauee/Explorar/explorar_view.dart';
import 'package:edupauee/Juegos/juego_view.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  List<Widget> routesDataNavigationBar = [
    Explores(),
    JuegosC(),
    Comics(),
    Challenges(),
    About()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: routesDataNavigationBar[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF9B2242),
        fixedColor: Color(0xFFFFFFFF),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Explorar'),
              backgroundColor: Color(0xFF9B2242)),
          BottomNavigationBarItem(
              icon: Icon(Icons.games_outlined),
              title: Text('Juegos'),
              backgroundColor: Color(0xFF9B2242)),
          BottomNavigationBarItem(
              icon: Icon(Icons.book),
              title: Text('Comic'),
              backgroundColor: Color(0xFF9B2242)),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_activity),
              title: Text('Experimenta'),
              backgroundColor: Color(0xFF9B2242)),
          BottomNavigationBarItem(
              icon: Icon(Icons.info),
              title: Text('Tips'),
              backgroundColor: Color(0xFF9B2242)),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
