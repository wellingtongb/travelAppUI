import 'package:flutter/material.dart';
import 'package:travelApp/screns/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter travel App UI',
      debugShowCheckedModeBanner: false,  //para desabilitar a marquinha de debug
      theme: ThemeData(
        primaryColor: Color(0xFF3E8ACE),
        accentColor: Color(0xFFD8ECF1),
        scaffoldBackgroundColor: Color(0xFFF3F5F7)
      ),
      home: HomeScreen(),
    );
  }
}