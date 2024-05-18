import 'package:icon_broken/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:moga/core/routes/app_routes.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/core/common/custom_navigate.dart';

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
        onPressed: () {
          context.navigate(AppRoutes.newPost, context);
        },
        icon: Icon(
          IconBroken.Paper_Upload,
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
          onPressed: () {
            context.navigate(AppRoutes.notification, context);
          },
          icon: Icon(
            IconBroken.Notification,
            size: 28,
            weight: 24,
          ),
        ),
        IconButton(
          onPressed: () {
            context.navigate(AppRoutes.search, context);
          },
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
