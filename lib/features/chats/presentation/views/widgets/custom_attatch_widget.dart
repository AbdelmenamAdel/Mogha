import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:moga/features/chats/presentation/manager/chats/chats_cubit.dart';
import 'package:moga/features/chats/presentation/manager/chats/chats_states.dart';

class CustomAttatchWidget extends StatelessWidget {
  const CustomAttatchWidget({super.key, required this.uId});
  final String uId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatsCubit, ChatsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ChatsCubit.get(context);
        return SizedBox(
          width: 12,
          child: SubmenuButton(
            menuChildren: [
              Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          cubit.getChatImage(context: context, reciverId: uId);
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
                          cubit.getCameraImage(
                              context: context, reciverId: uId);
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
                          await cubit.getVideo(
                              context: context, reciverId: uId);
                        },
                        icon: Icon(IconBroken.Video),
                      ),
                      Text('Video'),
                    ],
                  ),
                ],
              )
            ],
            child: Icon(Icons.attach_file),
          ),
        );
      },
    );
  }
}
