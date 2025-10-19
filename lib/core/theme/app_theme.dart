import 'package:flutter/material.dart';

class AppTheme {
  //======================== Light Theme ======================================
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xffFFFFFF),
    primaryColor: Color(0xffFFA451),

    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: Color(0xffC2BDBD)),
      filled: true,
      fillColor: Color(0xffF3F1F1),
      //contentPadding: EdgeInsets.symmetric(horizontal: 5,vertical: 7),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    ),
  );

  //======================== Dark Theme ======================================
  static ThemeData darkTheme = ThemeData();
}
