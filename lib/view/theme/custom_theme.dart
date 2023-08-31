import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lingo/view/theme/app_colors.dart';

class CustomAppTheme {
  ThemeData get themeLight => ThemeData.light().copyWith(
        scaffoldBackgroundColor: AppColors.backgroundLight,
        textTheme: GoogleFonts.poppinsTextTheme(),

        ///bottomNavigationBarTheme
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF0081A8),
          selectedIconTheme: const IconThemeData(
            color: Colors.white,
          ),
          unselectedItemColor: const Color.fromARGB(255, 24, 94, 85),
          selectedItemColor: Colors.white,
        ),

        ///appBarTheme
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.appBlue,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          elevation: 0,
        ),

        ///cardTheme
        cardTheme: CardTheme(
          elevation: 5,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),

        ///iconTheme
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),

        ///inputDecorationTheme
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: AppColors.appGeneralDarkGrey, width: 2.0),
          ),
        ),
      );

  ThemeData get themeDark => ThemeData.dark().copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: AppColors.backgroundDark,

        ///bottomNavigationBarTheme
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xff072027),
          selectedIconTheme: const IconThemeData(
            color: Colors.white,
          ),
          unselectedItemColor: const Color.fromARGB(255, 24, 94, 85),
          selectedItemColor: Colors.white,
        ),

        ///appBarTheme
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff072027),
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          elevation: 0,
        ),

        ///cardTheme
        cardTheme: CardTheme(
          elevation: 3,
          color: AppColors.cardDark,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), side: BorderSide.none),
        ),

        ///iconTheme
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),

        ///inputDecorationTheme
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: AppColors.appGeneralDarkGrey, width: 2.0),
          ),
        ),
      );
}
