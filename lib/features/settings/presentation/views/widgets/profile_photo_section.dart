import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:moga/core/common/custom_navigate.dart';
import 'package:moga/core/routes/app_routes.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/features/auth/data/models/create_user_model.dart';

class ProfilePhotosSection extends StatelessWidget {
  const ProfilePhotosSection({
    super.key,
    required this.userModel,
  });
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                  height: 210,
                  width: double.infinity,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Hero(
                    tag: 'coverPhoto',
                    child: Image.network(
                      fit: BoxFit.cover,
                      userModel.coverPhoto,
                    ),
                  )),
              IconButton(
                onPressed: () {
                  context.navigate(AppRoutes.coverPhoto, context);
                },
                icon: CircleAvatar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: Icon(
                    IconBroken.Camera,
                    color: AppColors.blue,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    radius: 70,
                    child: Hero(
                      tag: 'profilePhoto',
                      child: CircleAvatar(
                        radius: 65,
                        backgroundImage: NetworkImage(
                          userModel.profilePhoto,
                        ),
                      ),
                    )),
                IconButton(
                  onPressed: () {
                    context.navigate(AppRoutes.profilePhoto, context);
                  },
                  icon: CircleAvatar(
                    radius: 18,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: Icon(
                      IconBroken.Camera,
                      size: 20,
                      color: AppColors.blue,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
