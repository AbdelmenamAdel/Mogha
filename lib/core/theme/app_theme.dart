import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';

ThemeData getAppDarkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.kPrimary,
    //scaffoldBackgroundColor
    scaffoldBackgroundColor: AppColors.background,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.blueGrey.withOpacity(.3),
      selectedItemColor: AppColors.kPrimary,
      unselectedItemColor: AppColors.grey,
    ),
    cardColor: AppColors.black,
    //appBar theme
    appBarTheme: AppBarTheme(backgroundColor: AppColors.background),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.lato(
        color: AppColors.kPrimary.withOpacity(.87),
        fontSize: 32.sp,
      ),
      titleMedium: GoogleFonts.lato(
          color: AppColors.kPrimary.withOpacity(.87),
          fontSize: 24.sp,
          fontWeight: FontWeight.w600),
      titleSmall: GoogleFonts.lato(
          color: AppColors.kPrimary.withOpacity(.87), fontSize: 16.sp),
      displayLarge: GoogleFonts.lato(
        color: AppColors.white.withOpacity(.87),
        fontSize: 32.sp,
      ),
      displayMedium: GoogleFonts.lato(
          color: AppColors.white.withOpacity(.87), fontSize: 24.sp),
      displaySmall: GoogleFonts.lato(
          color: AppColors.white.withOpacity(.87), fontSize: 16.sp),
      labelLarge: GoogleFonts.lato(
          color: AppColors.kPrimary.withOpacity(.87), fontSize: 24.sp),
      labelMedium: GoogleFonts.lato(
          color: AppColors.kPrimary.withOpacity(.87), fontSize: 16.sp),
      labelSmall: GoogleFonts.lato(
          color: AppColors.kPrimary.withOpacity(.87), fontSize: 13.sp),
      bodySmall: GoogleFonts.lato(
          color: AppColors.white.withOpacity(.35),height: 1.1,fontSize: 13),

    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
      foregroundColor: Colors.lightBlueAccent,
      // Text color
      side: BorderSide(color: Colors.black12),
      // Border color and width
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(5), // No border radius for sharp corners
      ),
    )),
  );
}

ThemeData getAppLightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.black,
    //scaffoldBackgroundColor
    scaffoldBackgroundColor: AppColors.white,
    cardColor: AppColors.white.withOpacity(.9),

    //appBar theme
    appBarTheme: AppBarTheme(backgroundColor: AppColors.white.withOpacity(.9)),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.lato(
        color: AppColors.black.withOpacity(.87),
        fontSize: 32.sp,
      ),
      titleMedium: GoogleFonts.lato(
          color: AppColors.black.withOpacity(.87),
          fontSize: 24.sp,
          fontWeight: FontWeight.w600),
      titleSmall: GoogleFonts.lato(
          color: AppColors.black.withOpacity(.87), fontSize: 16.sp),
      displayLarge: GoogleFonts.lato(
        color: AppColors.black.withOpacity(.87),
        fontSize: 32.sp,
      ),bodySmall: GoogleFonts.lato(
        color: AppColors.blueGrey,height: 1.1,fontSize: 13),
      displayMedium: GoogleFonts.lato(
          color: AppColors.black.withOpacity(.87), fontSize: 24.sp),
      displaySmall: GoogleFonts.lato(
          color: AppColors.black.withOpacity(.87), fontSize: 16.sp),
      labelLarge: GoogleFonts.lato(
          color: AppColors.black.withOpacity(.87), fontSize: 24.sp),
      labelMedium: GoogleFonts.lato(
          color: AppColors.black.withOpacity(.87), fontSize: 16.sp),
      labelSmall: GoogleFonts.lato(
          color: AppColors.black.withOpacity(.87), fontSize: 13.sp),

     ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
      foregroundColor: Colors.lightBlueAccent,
      // Text color
      side: BorderSide(color: Colors.black12),
      // Border color and width
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(5), // No border radius for sharp corners
      ),
    )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.blueGrey.withOpacity(.2),
      selectedItemColor: Colors.blue,
      unselectedItemColor: AppColors.grey,
    ),
  );
}
