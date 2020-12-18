import 'package:flutter/material.dart';
import 'package:edupauee/Juegos/QuizStar/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quizstar",
      theme: ThemeData(
        backgroundColor: Color(0xFF1F2430),
        primarySwatch: Colors.blue,
      ),
      home: splashscreen(),
    );
  }
}
