import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        actions: [
          cubit.profileImage == null
              ? Icon(IconBroken.Edit)
              : Row(children: [
                  Text('Update'),
                  IconButton(
                    onPressed: () {
                      cubit.uploadProfileImage();
                    },
                    icon: Icon(IconBroken.Upload),
                  ),
                  IconButton(
                    onPressed: () async {
                      await cubit.getProfileImage(context);
                    },
                    icon: Icon(IconBroken.Edit),
                  ),
                ])
        ],
      ),
      body: BlocConsumer<SocialCubit, SocialStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
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
            );
          }),
    );
  }
}
