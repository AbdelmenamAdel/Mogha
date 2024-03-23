import 'package:moga/core/local/app_local.dart';
import 'package:flutter/material.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/core/utils/app_strings.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      shadowColor: AppColors.grey,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.camera_alt_outlined,
          size: 28,
          weight: 24,
        ),
      ),
      centerTitle: true,
      title: Text(
        Strings.mogha.tr(context),
        style:
            Theme.of(context).textTheme.titleMedium!.copyWith(letterSpacing: 4),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.chat_rounded,
            size: 28,
            weight: 24,
          ),
        ),
      ],
    );
  }
}
