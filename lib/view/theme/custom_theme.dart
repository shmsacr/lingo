import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lingo/view/theme/app_colors.dart';

class CustomAppTheme {
  ThemeData get theme => ThemeData.light().copyWith(
        scaffoldBackgroundColor: AppColors.appGeneralDarkGrey,
        textTheme: GoogleFonts.poppinsTextTheme(
          
        ),
        

        ///bottomNavigationBarTheme
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.appGeneralDarkGrey,
          selectedIconTheme: const IconThemeData(
            color: Colors.white,
          ),
          unselectedItemColor: const Color.fromARGB(255, 24, 94, 85),
          selectedItemColor: Colors.white,
        ),

        ///appBarTheme
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.appGeneralDarkGrey,
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
          shadowColor: AppColors.appGeneralDarkGrey,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: AppColors.appGeneralLigthGrey),
          ),
        ),

        ///iconTheme
        iconTheme: const IconThemeData(
          color: AppColors.appGeneralDarkGrey,
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
