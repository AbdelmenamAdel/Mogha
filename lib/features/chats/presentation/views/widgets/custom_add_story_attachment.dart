import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_states.dart';

class CustomAddStoryAttachment extends StatelessWidget {
  const CustomAddStoryAttachment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SubmenuButton(
              menuChildren: [
                Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            cubit.getStoryImage();
                          },
                          icon: Icon(IconBroken.Image),
                        ),
                        Text('Image'),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            cubit.getStoryCameraImage();
                          },
                          icon: Icon(IconBroken.Camera),
                        ),
                        Text('Camera'),
                        SizedBox(
                          width: 12,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            cubit.getStoryVideo();
                          },
                          icon: Icon(IconBroken.Video),
                        ),
                        Text('Video'),
                      ],
                    ),
                  ],
                )
              ],
              child: Row(
                children: [
                  Icon(
                    Icons.attach_file,
                  ),
                  Text(
                    'click to add',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
