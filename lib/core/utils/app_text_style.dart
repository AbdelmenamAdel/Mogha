import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

TextStyle textStyle({
  required Color color,
  required double fontSize,
  required fontWeight,
}) {
  return GoogleFonts.lato(
    color: color,
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
  );
}

//! bold Style
TextStyle boldStyle({
  Color color = AppColors.white,
  double fontSize = 24,
}) =>
    textStyle(
      color: color,
      fontSize: fontSize.sp,
      fontWeight: FontWeight.bold,
    );

//! regular Style
TextStyle regularStyle({
  Color color = AppColors.white,
  double fontSize = 24,
}) =>
    textStyle(
      color: color,
      fontSize: fontSize.sp,
      fontWeight: FontWeight.normal,
    );