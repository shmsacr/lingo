import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lingo/view/theme/app_colors.dart';

class CustomAppTheme {
  ThemeData get theme => ThemeData.light().copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: AppColors.lightTheme,
        appBarTheme: const AppBarTheme(
          elevation: 5,
          color: AppColors.darkTheme,
        ),
        cardTheme: CardTheme(
          elevation: 5,
          color: AppColors.darkTheme,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      );
}
