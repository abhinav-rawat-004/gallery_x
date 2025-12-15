import 'package:flutter/material.dart';

class MyTheme {
  static light() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color.fromARGB(255, 11, 145, 255),
      primarySwatch: Colors.deepOrange,
      // colorScheme: ,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.orange,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28,
          color: Colors.black,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.green,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
      ),
    );
  } 
  static dark() {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28,
          color: Colors.white,
        ),
      ),
      scaffoldBackgroundColor: const Color.fromARGB(255, 49, 49, 49),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 152, 152, 152),
      ),
    );
  }
}
