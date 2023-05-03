import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

class MyThemeData {
  static Color lightprim = Color(0xFFDFECDB);
  static Color darkprim = Color(0xFF060E1E);
  static Color colorblack = Color(0xFF242424);
  static Color colorwihte = Color(0xFFFFFFFF);
  static Color lightprimlow = Color(0xFF5D9CEC);
  static Color textsec = Color(0xFF61E757);
  static Color textprim = Color(0xFF5D9CEC);
  static Color darksec = Color(0xFF5D9CEC);
  static Color color_red = Color(0xFFEC4B4B);
  static Color blacklight = Color(0xFF141922);
  static ThemeData lightTheme = ThemeData(
      primaryColor: lightprim,
      primaryColorLight: lightprimlow,
      backgroundColor: colorwihte,
      dividerColor: lightprimlow,
      hoverColor: lightprimlow,
      unselectedWidgetColor: Colors.white,
      highlightColor: colorwihte,
      iconTheme: IconThemeData(color: lightprim),
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(iconColor: MaterialStateProperty.all(lightprim))),
      scaffoldBackgroundColor: lightprim, //Scaffold
      appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: lightprimlow,
          iconTheme: IconThemeData(color: colorblack)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: lightprimlow,
          unselectedItemColor: Color(0xFFC8C9CB)),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: lightprimlow,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: BorderSide(color: Colors.white, width: 4))),
      textTheme: TextTheme(
        headline1: GoogleFonts.poppins(
            color: MyThemeData.colorwihte,
            fontWeight: FontWeight.bold,
            fontSize: 22),
        headline2: GoogleFonts.poppins(
            color: MyThemeData.colorblack,
            fontWeight: FontWeight.bold,
            fontSize: 14),
        subtitle1: GoogleFonts.roboto(
            color: Color(0XFF383838),
            fontWeight: FontWeight.bold,
            fontSize: 18),
        subtitle2: GoogleFonts.roboto(
            color: Color(0XFFA9A9A9),
            fontWeight: FontWeight.bold,
            fontSize: 20),
        labelMedium: GoogleFonts.roboto(
            color: lightprimlow, fontWeight: FontWeight.bold, fontSize: 14),
        headline3: GoogleFonts.poppins(
            color: MyThemeData.lightprimlow,
            fontWeight: FontWeight.bold,
            fontSize: 18),
        headline4: GoogleFonts.roboto(
            color: MyThemeData.blacklight,
            fontWeight: FontWeight.bold,
            fontSize: 14),
      ));
  static ThemeData darktheme = ThemeData(
      primaryColor: darksec,
      hoverColor: darksec,
      backgroundColor: darksec,
      dividerColor: darkprim,
      iconTheme: IconThemeData(color: darkprim),
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
              iconColor: MaterialStateProperty.all(darkprim),
              backgroundColor: MaterialStateProperty.all(darkprim))),
      scaffoldBackgroundColor: darkprim,
      appBarTheme: AppBarTheme(
        elevation: 0,
          backgroundColor: darksec,
          iconTheme: IconThemeData(color: colorblack)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: blacklight,
          selectedItemColor: darksec,
          unselectedItemColor: colorwihte),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: darkprim,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: BorderSide(color: Colors.white, width: 4))),
      textTheme: TextTheme(
        headline1: TextStyle(
            color: MyThemeData.colorwihte,
            fontWeight: FontWeight.bold,
            fontSize: 30),
        headline2: TextStyle(
            color: MyThemeData.colorwihte,
            fontWeight: FontWeight.w400,
            fontSize: 25),
        subtitle1: TextStyle(
            color: MyThemeData.colorwihte,
            fontWeight: FontWeight.w500,
            fontSize: 25),
        headline3: TextStyle(
            color: MyThemeData.colorwihte,
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ));
}
