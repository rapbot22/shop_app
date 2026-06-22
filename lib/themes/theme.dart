import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  fontFamily: 'Lato',
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color.fromRGBO(254, 206, 1, 1),
    primary: Color.fromRGBO(254, 206, 1, 1),
  ),
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    hintStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Color.fromRGBO(119, 119, 119, 1),
    ),
    prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
  ),
  textTheme: const TextTheme(
    titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    bodySmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    titleLarge: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
  ),
);

ThemeData darkMode = ThemeData(
  fontFamily: 'Lato',
  scaffoldBackgroundColor: ThemeData.dark().scaffoldBackgroundColor,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color.fromRGBO(254, 206, 1, 1),
    primary: Color.fromRGBO(254, 206, 1, 1),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    hintStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Color.fromRGBO(119, 119, 119, 1),
    ),
    prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
  ),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.amberAccent,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.amberAccent,
    ),
    titleLarge: TextStyle(
      fontSize: 35,
      fontWeight: FontWeight.bold,
      color: Color.fromRGBO(254, 206, 1, 1),
    ),
  ),
  bottomAppBarTheme: const BottomAppBarThemeData(
    color: Color.fromARGB(66, 38, 5, 124),
  ),
  listTileTheme: const ListTileThemeData(textColor: Colors.white),
);
