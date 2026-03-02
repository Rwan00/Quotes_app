import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qoutes/core/utils/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme: GoogleFonts.dmSerifTextTextTheme(),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      surfaceTintColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
    ),
  );
}