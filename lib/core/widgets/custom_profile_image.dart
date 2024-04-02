import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/core/utils/app_images.dart';

import 'custom_image_picker.dart';
import 'custom_pick_image.dart';

class CustomImageProfile extends StatefulWidget {
  const CustomImageProfile({super.key});

  @override
  State<CustomImageProfile> createState() => _CustomImageProfileState();
}

class _CustomImageProfileState extends State<CustomImageProfile> {
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return selectedImage == null
        ? Stack(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(AppImages.appIcon),
              ),
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: .6, sigmaY: .3),
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return ImagePickerComponent(
                              cameraOnTap: () async {
                                pickImage(ImageSource.camera).then(
                                  (value) {
                                    setState(() {
                                      selectedImage = File(value!.path);
                                    });
                                  },
                                );
                                GoRouter.of(context).pop();
                              },
                              galleryOnTap: () {
                                pickImage(ImageSource.gallery).then(
                                  (value) {
                                    setState(() {
                                      selectedImage = File(value!.path);
                                    });
                                  },
                                );
                                GoRouter.of(context).pop();
                              },
                            );
                          });
                    },
                    icon: const Icon(
                      Icons.add,
                      color: AppColors.kPrimary,
                      size: 32,
                    ),
                  ),
                ),
              )
            ],
          )
        : Stack(
            children: [
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return ImagePickerComponent(
                          cameraOnTap: () async {
                            pickImage(ImageSource.camera).then(
                              (value) {
                                setState(() {
                                  selectedImage = File(value!.path);
                                });
                              },
                            );
                            GoRouter.of(context).pop();
                          },
                          galleryOnTap: () {
                            pickImage(ImageSource.gallery).then(
                              (value) {
                                setState(() {
                                  selectedImage = File(value!.path);
                                });
                              },
                            );
                            GoRouter.of(context).pop();
                          },
                        );
                      });
                },
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: FileImage(selectedImage!),
                ),
              ),
            ],
          );
  }
}
