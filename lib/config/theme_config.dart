import 'package:flutter/material.dart';
import 'package:examen_david_solis_gs/config/colors.dart';

class ThemeConfig {
  static ThemeData light() => ThemeData(
        primarySwatch: primaryColor,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 8.0,
          backgroundColor: primaryColor,
          selectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(fontSize: 12, color: Colors.white),
          selectedIconTheme: IconThemeData(color: Colors.white, size: 18),
          unselectedItemColor: Color.fromARGB(255, 192, 192, 192),
          unselectedLabelStyle: TextStyle(
              fontSize: 10, color: Color.fromARGB(255, 192, 192, 192)),
          unselectedIconTheme: IconThemeData(
              color: Color.fromARGB(255, 192, 192, 192), size: 18),
        ),
      );
}
