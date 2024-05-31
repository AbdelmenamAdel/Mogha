import 'package:achievement_view/achievement_view.dart';
import 'package:flutter/material.dart';
import 'package:moga/core/utils/app_colors.dart';

void showAchievementView({
  required BuildContext context,
  String? title,
  String? subTitle,
  Color? color,
  Function()? onTap,
  Alignment? alignment,
}) {
  AchievementView(
    title: title,
    onTap: onTap,
    alignment: alignment??Alignment.topCenter,
    subTitle: subTitle,
    isCircle: false,
    color: color ?? AppColors.blueGrey,
  ).show(context);
}
