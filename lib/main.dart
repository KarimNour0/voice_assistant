import 'package:flutter/material.dart';
import 'package:voice_assistant/constant.dart';
import 'package:voice_assistant/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' Allen',
        theme :ThemeData(
          scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
        backgroundColor: Colors.white, // Set the background color to white
        iconTheme: IconThemeData(
        color: Colors.black, // Set the icon color to black
    ),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20,
        fontWeight: FontWeight.bold),
        ),
    ),

      home: HomePage(),
    );
  }
}



