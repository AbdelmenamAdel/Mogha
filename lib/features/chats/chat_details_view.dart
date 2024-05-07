import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/core/utils/app_images.dart';
import 'package:moga/core/widgets/custom_text_f_field.dart';
import 'package:moga/features/auth/data/models/create_user_model.dart';
import 'package:moga/features/chats/presentation/manager/chats/chats_cubit.dart';

class ChatDetailsView extends StatelessWidget {
  const ChatDetailsView({
    super.key,
    required this.user,
  });
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    var cubit = ChatsCubit.get(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: Icon(IconBroken.Arrow___Left_2)),
          titleSpacing: -10.0,
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage('${user.profilePhoto}'),
              ),
              SizedBox(width: 10),
              Text(
                '${user.userName}',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).textTheme.displayLarge!.color),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                IconBroken.Call,
                color: AppColors.blue,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                IconBroken.Video,
                color: AppColors.blue,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert_rounded,
                color: AppColors.blue,
              ),
            ),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AppImages.bg,
              ), // Replace with your image path
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(child: SingleChildScrollView()),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: cubit.messageController,
                        height: 50,
                        hintText: 'Write a message....',
                        bsc: Theme.of(context).scaffoldBackgroundColor,
                        radius: 18,
                        bgc: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: IconButton(
                        onPressed: () {
                          cubit.addMessage(
                            reciverId: user.uId,
                            message: cubit.messageController.text,
                            date: DateTime.now().toString(),
                          );
                        },
                        icon: Icon(
                          IconBroken.Send,
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
