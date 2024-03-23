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
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.black,
        unselectedItemColor: AppColors.grey,
      ),
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
      ));
}

ThemeData getAppLightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.black,
    //scaffoldBackgroundColor
    scaffoldBackgroundColor: AppColors.white,
    //appBar theme
    appBarTheme: AppBarTheme(backgroundColor: AppColors.grey),
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
      ),
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
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.black,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.grey,
    ),
  );
}
