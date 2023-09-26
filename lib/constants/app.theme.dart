import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app.colors.dart';

class ThemesService {
  final darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.black2,
      iconTheme: IconThemeData(color: Colors.white),
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        titleTextStyle: GoogleFonts.roboto(
          color: AppColors.white,
        ),
      ),
      buttonTheme: ButtonThemeData(
    buttonColor: Colors.black,
    disabledColor: AppColors.black2,
  ));

  final lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        titleTextStyle: GoogleFonts.roboto(
          color: AppColors.black2,
        ),
      ),
      buttonTheme: ButtonThemeData(
          buttonColor: AppColors.black2,
          disabledColor: Colors.black,
          ));
}