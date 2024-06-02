
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final double width;
  final double height;
  final double letterSpacing;
  final Color borderColor;
  final double borderRadius;
  final Color textColor;
  final Color fillColor;
  const CommonButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.borderColor,
    required this.textColor,
    required this.fillColor,
    required this.letterSpacing,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: 400 * width.w,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(borderRadius).r,
        border: Border.all(color: borderColor),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(borderRadius).r,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'Dosis',
              color: textColor,
              fontWeight: FontWeight.w600,
              letterSpacing: letterSpacing,
            ),
          ),
        ),
      ),
    );
  }
}

