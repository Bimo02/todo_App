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
            fontSize: 15),
        headline5: GoogleFonts.roboto(
            color: MyThemeData.lightprimlow,
            fontWeight: FontWeight.bold,
            fontSize: 15),
        headline6: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 17),
      ));
  static ThemeData darktheme = ThemeData(
      primaryColor: darkprim,
      primaryColorLight: darksec,
      hoverColor: darksec,
      backgroundColor: darksec,
      dividerColor: darksec,
      highlightColor: blacklight,
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
        elevation: 0,
          backgroundColor: blacklight,
          selectedItemColor: darksec,
          unselectedItemColor: colorwihte),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 0,
          backgroundColor: darksec,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: BorderSide(color: blacklight, width: 4))),
      textTheme: TextTheme(
        headline1: GoogleFonts.poppins(
            color: MyThemeData.blacklight,
            fontWeight: FontWeight.bold,
            fontSize: 22),
        headline2: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14),
        subtitle1: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18),
        subtitle2: GoogleFonts.roboto(
            color:  Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20),
        labelMedium: GoogleFonts.roboto(
            color: lightprimlow, fontWeight: FontWeight.bold, fontSize: 14),
        headline3: GoogleFonts.poppins(
            color: MyThemeData.lightprimlow,
            fontWeight: FontWeight.bold,
            fontSize: 18),
        headline4: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15),
        headline5: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15),
        headline6: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 17),
      ));
}
