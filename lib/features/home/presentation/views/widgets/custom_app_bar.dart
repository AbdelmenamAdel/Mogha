import 'package:icon_broken/icon_broken.dart';
import 'package:moga/core/local/app_local.dart';
import 'package:flutter/material.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/core/utils/app_strings.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      shadowColor: AppColors.grey,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          IconBroken.Camera,
          size: 28,
          weight: 24,
        ),
      ),
      centerTitle: true,
      title: Text(
        title,
        style:
            Theme.of(context).textTheme.titleMedium!.copyWith(letterSpacing: 4),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            IconBroken.Notification,
            size: 28,
            weight: 24,
          ),
        ), IconButton(
          onPressed: () {},
          icon: Icon(
            IconBroken.Search,
            size: 28,
            weight: 24,
          ),
        ),
      ],
    );
  }
}
