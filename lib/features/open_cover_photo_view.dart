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
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class OpenCoverPhotoView extends StatelessWidget {
  const OpenCoverPhotoView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = SocialCubit.get(context);
    return BlocConsumer<SocialCubit, SocialStates>(listener: (context, state) {
      if (state is SocialUploadCoverImageSuccessState) {
        cubit.inAsyncCall = false;
        GoRouter.of(context).pop();
        cubit.coverImage = null;
      }
      if (state is SocialUploadCoverImageLoadingState) {
        cubit.inAsyncCall = true;
      }
      if (state is SocialCoverImagePickedFailureState) {
        cubit.inAsyncCall = false;
        showAchievementView(
          context: context,
          title: 'Try again later',
          subTitle: 'failed to upload picture',
        );
      }
    }, builder: (context, state) {
      return ModalProgressHUD(
        inAsyncCall: cubit.inAsyncCall,
        child: Scaffold(
          backgroundColor: AppColors.black,
          appBar: AppBar(
            backgroundColor: AppColors.black,
            leading: IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
                cubit.coverImage = null;
              },
              icon: Icon(
                IconBroken.Close_Square,
                color: AppColors.grey,
              ),
            ),
            actions: [
              cubit.coverImage == null
                  ? IconButton(
                      onPressed: () async {
                        await cubit.getCoverImage(context);
                      },
                      icon: Icon(
                        IconBroken.Edit,
                        color: AppColors.blue,
                      ),
                    )
                  : Row(children: [
                      Text(
                        Strings.update.tr(context),
                        style: TextStyle(color: AppColors.bGL),
                      ),
                      IconButton(
                        onPressed: () async {
                          await cubit.uploadCoverImage();
                        },
                        icon: Icon(
                          IconBroken.Upload,
                          color: AppColors.blue,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await cubit.getCoverImage(context);
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
                tag: 'coverPhoto',
                child: Container(
                  child: cubit.coverImage == null
                      ? Image.network(
                          fit: BoxFit.cover,
                          cubit.model!.coverPhoto,
                        )
                      : Image.file(
                          cubit.coverImage!,
                          fit: BoxFit.cover,
                        ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
