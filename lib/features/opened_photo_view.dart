import 'dart:io';
import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/features/post/views/widgets/default_app_bar.dart';

class OpenedPhotoView extends StatelessWidget {
  const OpenedPhotoView({
    super.key,
    required this.photo,
  });

  final File photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          DefaultAppBar(
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(IconBroken.Edit),
              ),
            ],
          ),
          Container(
            child: Image.file(photo),
          )
        ],
      ),
    );
  }
}
