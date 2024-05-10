import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:go_router/go_router.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:moga/core/services/service_locator.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/core/utils/app_images.dart';
import 'package:moga/core/widgets/chat_buble.dart';
import 'package:moga/core/widgets/custom_text_f_field.dart';
import 'package:moga/features/auth/data/models/create_user_model.dart';
import 'package:moga/features/chats/data/models/message_model.dart';
import 'package:moga/features/chats/presentation/manager/chats/chats_cubit.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';
import 'presentation/views/widgets/connection_chat_waiting.dart';
import 'presentation/views/widgets/custom_attatch_widget.dart';

class ChatDetailsView extends StatelessWidget {
  const ChatDetailsView({
    super.key,
    required this.user,
  });
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    var messages = FirebaseFirestore.instance
        .collection('users')
        .doc(sl<SocialCubit>().model!.uId)
        .collection('chats')
        .doc(user.uId)
        .collection('messages');
    double? textFormFieldHeight;
    var cubit = ChatsCubit.get(context);
    return Scaffold(
      appBar: appBar(context),
      body: StreamBuilder(
        stream: messages.orderBy('date', descending: true).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }
          if (snapshot.hasData) {
            List<MessageModel> messagesList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
            }
            return Container(
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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          reverse: true,
                          controller: cubit.controller,
                          itemCount: messagesList.length,
                          itemBuilder: (context, index) => CustomChatBubble(
                            type: messagesList[index].senderId ==
                                    sl<SocialCubit>().model!.uId
                                ? BubbleType.sendBubble
                                : BubbleType.receiverBubble,
                            model: messagesList[index],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            suffix: CustomAttatchWidget(
                              uId: user.uId,
                            ),
                            onFieldSubmitted: (value) {
                              cubit.addMessage(
                                reciverId: user.uId,
                                message: cubit.messageController.text,
                                date: DateTime.now().toString(),
                              );
                              cubit.controller.animateTo(
                                0,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn,
                              );
                            },
                            controller: cubit.messageController,
                            height: textFormFieldHeight,
                            hintText: 'Write a message....',
                            bsc: Theme.of(context).textTheme.bodyLarge!.color,
                            radius: 18,
                            bgc: Theme.of(context).scaffoldBackgroundColor,
                          ),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          child: IconButton(
                            onPressed: () {
                              if (cubit.messageController.text
                                  .trim()
                                  .isNotEmpty)
                                cubit.addMessage(
                                  reciverId: user.uId,
                                  message: cubit.messageController.text.trim(),
                                  date: DateTime.now().toString(),
                                );
                            },
                            icon: Icon(
                              IconBroken.Send,
                              color:
                                  Theme.of(context).textTheme.bodyLarge!.color,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return ConnectionChatWaiting();
          }
        },
      ),
    );
  }

  appBar(context) {
    return AppBar(
      leading: Center(
        child: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: Icon(IconBroken.Arrow___Left_2)),
      ),
      titleSpacing: -5.0,
      title: Row(
        children: [
          Hero(
            tag: 'chat${user.uId}',
            child: CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage('${user.profilePhoto}'),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              '${user.userName}',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).textTheme.displayLarge!.color),
            ),
          ),
        ],
      ),
      // leadingWidth: 35,
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
        )
      ],
      elevation: 10,
      shadowColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(.8),
    );
  }
}
