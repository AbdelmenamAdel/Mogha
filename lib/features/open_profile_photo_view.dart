import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:moga/core/utils/app_colors.dart';
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
      if (state is SocialGetUserSuccessState) {
        GoRouter.of(context).pop();
        cubit.profileImage = null;
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
            icon: Icon(IconBroken.Close_Square,color: AppColors.grey,),
          ),
          actions: [
            cubit.profileImage == null
                ? IconButton(
                    onPressed: () async {
                      await cubit.getProfileImage(context);
                    },
                    icon: Icon(IconBroken.Edit,color: AppColors.blue,),
                  )
                : Row(children: [
                    Text('Update',style: TextStyle(color: AppColors.bGL)),
                    IconButton(
                      onPressed: () {
                        cubit.uploadProfileImage();
                      },
                      icon: Icon(IconBroken.Upload,color: AppColors.blue),
                    ),
                    IconButton(
                      onPressed: () async {
                        await cubit.getProfileImage(context);
                      },
                      icon: Icon(IconBroken.Edit,color: AppColors.blue,),
                    ),
                  ])
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            cubit.profileImage == null
                ? Container(
                    child: Image.network(
                      fit: BoxFit.cover,
                      cubit.model!.profilePhoto,
                    ),
                  )
                : Container(
                    child: Image.file(
                      cubit.profileImage!,
                      fit: BoxFit.cover,
                    ),
                  )
          ],
        ),
      );
    });
  }
}
