import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moga/core/utils/app_colors.dart';

class DividerBetweenChatsAndStories extends StatelessWidget {
  const DividerBetweenChatsAndStories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12).r,
      child: Container(
        height: 5,
        decoration: BoxDecoration(
            color: AppColors.kPrimary, borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
