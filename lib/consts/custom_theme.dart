import 'package:flutter/material.dart';
import 'package:wallpaper_world/consts/color.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  //Todo: Custom Light Theme

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: whiteColor,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      toolbarTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      elevation: 0,
    ),
    fontFamily: GoogleFonts.poppins().fontFamily,
    primaryColor: Colors.black,
    iconTheme: IconThemeData(
      color: Colors.grey.shade600,
    ),
  );

  //Todo: Custom Dark Theme

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: blackColor,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    fontFamily: GoogleFonts.poppins().fontFamily,
    primaryColor: Colors.white,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  );
}
