import 'package:flutter/material.dart';
import 'package:moga/core/utils/app_colors.dart';

class CommentsView extends StatelessWidget {
  const CommentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      margin: EdgeInsets.all(30),
      height: double.infinity,
      color: AppColors.white,
    );
  }
}
