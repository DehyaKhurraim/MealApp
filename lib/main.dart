// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meals_app/Screens/catagories.dart';
import 'package:meals_app/Screens/tabs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Fix the constructor syntax

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delicious MEALs', // Fixed the typo in title
      theme: ThemeData(
        primaryColor: Colors.brown,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.brown)
            .copyWith(secondary: Colors.brown[900]),
        accentColor: Colors.brown[900],
        canvasColor: Colors.brown[50],
        fontFamily: 'Raleway',
        textTheme: TextTheme(
          // Define the text styles using the newer approach
          bodyText1: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 0),
          ),
          bodyText2: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 0),
          ),
          headline1: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const TabsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
