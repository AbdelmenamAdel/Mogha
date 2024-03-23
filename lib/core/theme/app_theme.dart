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
    //appBar theme
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.black),
    //! Text
    textTheme: TextTheme(
      titleLarge: GoogleFonts.lato(
          color: AppColors.kPrimary.withOpacity(.87), fontSize: 32.sp,),
      titleMedium: GoogleFonts.lato(
          color: AppColors.kPrimary.withOpacity(.87), fontSize: 24.sp,fontWeight:FontWeight.w600),
      titleSmall: GoogleFonts.lato(
          color: AppColors.kPrimary.withOpacity(.87), fontSize: 16.sp),
         displayLarge: GoogleFonts.lato(
          color: AppColors.white.withOpacity(.87), fontSize: 32.sp,),
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


    )
  );
}

ThemeData getAppTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.kPrimary,
    //scaffoldBackgroundColor
    scaffoldBackgroundColor: AppColors.white,
    //appBar theme
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.kPrimary),
    //! Text
  );
}
