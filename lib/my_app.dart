import 'package:flutter/material.dart';
import 'package:edupauee/views/explorar.dart';
import 'package:edupauee/views/juegos.dart';
import 'package:edupauee/views/comic.dart';
import 'package:edupauee/views/challenges.dart';
import 'package:edupauee/views/acerca_de.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  List<Widget> routesDataNavigationBar = [
    Explorar(),
    Juegos(),
    Comic(),
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
        backgroundColor: Color(0xFFE7503B),
        fixedColor: Color(0xFFFFFFFF),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Explorar'),
              backgroundColor: Color(0xFFE7503B)),
          BottomNavigationBarItem(
              icon: Icon(Icons.games_outlined),
              title: Text('Juegos'),
              backgroundColor: Color(0xFFE7503B)),
          BottomNavigationBarItem(
              icon: Icon(Icons.book),
              title: Text('Comic'),
              backgroundColor: Color(0xFFE7503B)),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_activity),
              title: Text('Challenge'),
              backgroundColor: Color(0xFFE7503B)),
          BottomNavigationBarItem(
              icon: Icon(Icons.info),
              title: Text('About'),
              backgroundColor: Color(0xFFE7503B)),
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