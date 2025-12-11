import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  // LIGHT THEME
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.darkBlue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColors.darkBlue,
      secondary: AppColors.lightBlue,
      surface: Colors.white,
    ),
    textTheme: GoogleFonts.tajawalTextTheme(ThemeData.light().textTheme),
  );

  // DARK THEME
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.lightBlue,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.lightBlue,
      secondary: AppColors.lightBlue,
      surface: AppColors.surfaceDark,
    ),
    textTheme: GoogleFonts.tajawalTextTheme(ThemeData.dark().textTheme),
  );
}
