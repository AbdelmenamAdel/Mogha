import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';

class ImagePickerComponent extends StatelessWidget {
  const ImagePickerComponent({
    super.key,
    required this.cameraOnTap,
    required this.galleryOnTap,
  });
  final VoidCallback cameraOnTap;
  final VoidCallback galleryOnTap;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(
              Icons.camera_alt,
              color: AppColors.kPrimary,
              size: 32,
            ),
            title:const Text('camera',
                style:  TextStyle(color: AppColors.kPrimary)),
            onTap: cameraOnTap,
          ),
          ListTile(
            leading: const Icon(
              Icons.photo,
              color: AppColors.kPrimary,
              size: 32,
            ),
            title:const Text('gallery',
                style:  TextStyle(color: AppColors.kPrimary)),
            onTap: galleryOnTap,
          ),
        ],
      ),
    );
  }
}