import 'package:flutter/material.dart';

class Apptheme {
  static const Color primary = Color(0xffa4c533);
  static const Color primaryText = Colors.white;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      // Color primario
      primaryColor: primary,
      //Scaffold
      scaffoldBackgroundColor: Colors.grey[100],
      // scaffoldBackgroundColor: const Color(0xffE2E2C2),
      // scaffoldBackgroundColor: Colors.lightGreen[50],
      //appBar
      appBarTheme: const AppBarTheme(color: primary, elevation: 0),
      //TextButton
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: primary)),
      //FloatingActionButton
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primary, elevation: 5),
      //ElevationButton
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: primary,
              shape: const StadiumBorder(),
              elevation: 0)),
      //TextInput
      inputDecorationTheme: const InputDecorationTheme(
        floatingLabelStyle:
            TextStyle(color: Colors.black, backgroundColor: Colors.white54),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primary),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10), topRight: Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primary),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10), topRight: Radius.circular(10)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10), topRight: Radius.circular(10)),
        ),
      ));
}
