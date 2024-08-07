import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:moga/core/local/app_local.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/core/common/custom_notifier.dart';
import 'package:moga/core/utils/app_strings.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_states.dart';

class OpenPostPhotoView extends StatelessWidget {
  const OpenPostPhotoView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = SocialCubit.get(context);
    return BlocConsumer<SocialCubit, SocialStates>(listener: (context, state) {
      if (state is SocialUploadPostImageSuccessState) {
        cubit.inAsyncCall = false;
        GoRouter.of(context).pop();
      }
      if (state is SocialUploadPostImageLoadingState) {
        cubit.inAsyncCall = true;
      }
      if (state is SocialUploadPostImageFailureState) {
        cubit.inAsyncCall = false;
        showAchievementView(
            context: context,
            title: 'Try again later',
            subTitle: 'failed to upload picture');
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
                cubit.postPhoto = null;
              },
              icon: Icon(
                IconBroken.Close_Square,
                color: AppColors.grey,
              ),
            ),
            actions: [
              cubit.postPhoto == null
                  ? IconButton(
                      onPressed: () async {
                        await cubit.getPostImage(context);
                      },
                      icon: Icon(
                        Icons.add,
                        size: 32,
                        color: AppColors.blue,
                      ),
                    )
                  : Row(children: [
                      Text(Strings.upload.tr(context),
                          style: TextStyle(color: AppColors.bGL)),
                      IconButton(
                        onPressed: () {
                          cubit.uploadPostPhoto();
                        },
                        icon: Icon(Icons.check, color: AppColors.blue),
                      ),
                      IconButton(
                        onPressed: () async {
                          await cubit.getPostImage(context);
                        },
                        icon: Icon(
                          Icons.add,
                          color: AppColors.blue,
                        ),
                      ),
                    ])
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (cubit.postPhoto != null)
                Hero(
                  tag: 'postPhoto',
                  child: Container(
                    child: Image.file(
                      cubit.postPhoto!,
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
