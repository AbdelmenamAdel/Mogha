import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_states.dart';

class OpenCoverPhotoView extends StatelessWidget {
  const OpenCoverPhotoView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = SocialCubit.get(context);
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        actions: [
          cubit.coverImage == null
              ? Icon(IconBroken.Edit)
              : Row(children: [
                  Text('Update'),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(IconBroken.Upload),
                  ),
                  IconButton(
                    onPressed: () async {
                      await cubit.getCoverImage(context);
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
                cubit.coverImage == null
                    ? Container(
                        child: Image.network(
                          fit: BoxFit.cover,
                          cubit.model!.coverPhoto,
                        ),
                      )
                    : Container(
                        child: Image.file(
                          cubit.coverImage!,
                          fit: BoxFit.cover,
                        ),
                      )
              ],
            );
          }),
    );
  }
}
