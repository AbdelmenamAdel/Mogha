import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:moga/core/common/custom_notifier.dart';
import 'package:moga/core/local/app_local.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/core/utils/app_strings.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_states.dart';

class OpenProfilePhotoView extends StatelessWidget {
  const OpenProfilePhotoView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = SocialCubit.get(context);
    return BlocConsumer<SocialCubit, SocialStates>(listener: (context, state) {
      if (state is SocialUploadProfileImageSuccessState) {
        cubit.inAsyncCall = false;
        GoRouter.of(context).pop();
        cubit.profileImage = null;
      }
      if (state is SocialUploadProfileImageLoadingState) {
        cubit.inAsyncCall = true;
      }
      if (state is SocialProfileImagePickedFailureState) {
        cubit.inAsyncCall = false;
        showAchievementView(
          context: context,
          title: 'Try again later',
          subTitle: 'failed to upload picture',
        );
      }
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: AppColors.black,
        appBar: AppBar(
          backgroundColor: AppColors.black,
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
              cubit.profileImage = null;
            },
            icon: Icon(
              IconBroken.Close_Square,
              color: AppColors.grey,
            ),
          ),
          actions: [
            cubit.profileImage == null
                ? IconButton(
                    onPressed: () async {
                      await cubit.getProfileImage(context);
                    },
                    icon: Icon(
                      IconBroken.Edit,
                      color: AppColors.blue,
                    ),
                  )
                : Row(children: [
                    Text(Strings.update.tr(context),
                        style: TextStyle(color: AppColors.bGL)),
                    IconButton(
                      onPressed: () {
                        cubit.uploadProfileImage();
                      },
                      icon: Icon(IconBroken.Upload, color: AppColors.blue),
                    ),
                    IconButton(
                      onPressed: () async {
                        await cubit.getProfileImage(context);
                      },
                      icon: Icon(
                        IconBroken.Edit,
                        color: AppColors.blue,
                      ),
                    ),
                  ])
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'profilePhoto',
              child: Container(
                child: cubit.profileImage == null
                    ? Image.network(
                        fit: BoxFit.cover,
                        cubit.model!.profilePhoto,
                      )
                    : Image.file(
                        cubit.profileImage!,
                        fit: BoxFit.cover,
                      ),
              ),
            )
          ],
        ),
      );
    });
  }
}
