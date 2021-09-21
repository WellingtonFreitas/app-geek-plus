
import 'package:flutter/material.dart';

class GeekPlusAppUiConfig {
  GeekPlusAppUiConfig._();

  static String get title => 'Geek Plus';
  static ThemeData get lightTheme => ThemeData(
    fontFamily: 'Metropolis',
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backwardsCompatibility: false,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color:Colors.black),
      titleTextStyle: TextStyle(
        color: Color(0xFF222222), 
        fontSize: 18,
        fontWeight: FontWeight.w500,
        ),
    )
  );
  
  static ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Metropolis',
    appBarTheme: AppBarTheme(
      backwardsCompatibility: false,
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(color:Colors.white),
      titleTextStyle: TextStyle(
        color: Color(0xFF222222), 
        fontSize: 18,
        fontWeight: FontWeight.w500,
        ),
    )
  );
}