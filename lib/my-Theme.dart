import 'dart:ui';

import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryLightColor = Color(0x39A552);
  static Color whiteColor = Color(0xFFFFFF);
  static Color redColor = Color(0xC91C22);
  static Color darkBlueColor = Color(0x003E90);
  static Color pinkColor = Color(0xED1E79);
  static Color brownColor = Color(0xCF7E48);
  static Color blueColor = Color(0x4882CF);
  static Color yellowColor = Color(0xF2D352);
  static Color blackColor = Color(0x303030);
  static Color greyColor = Color(0x4F5A69);


  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryLightColor,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryLightColor,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
    ),
  );
}