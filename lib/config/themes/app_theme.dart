import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qoutes/core/utils/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme: GoogleFonts.dmSerifTextTextTheme(
      TextTheme(
        bodyMedium: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            titleMedium: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
            bodySmall: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
      )
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      surfaceTintColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    
  );
}