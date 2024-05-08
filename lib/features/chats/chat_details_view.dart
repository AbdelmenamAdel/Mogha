import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:go_router/go_router.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:moga/core/services/service_locator.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/core/utils/app_images.dart';
import 'package:moga/core/widgets/chat_buble.dart';
import 'package:moga/core/widgets/custom_text_f_field.dart';
import 'package:moga/core/widgets/show_hero_image.dart';
import 'package:moga/features/auth/data/models/create_user_model.dart';
import 'package:moga/features/chats/data/models/message_model.dart';
import 'package:moga/features/chats/presentation/manager/chats/chats_cubit.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';

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
      appBar: AppBar(
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
            InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () {
                showHeroImage(context, user.profilePhoto);
              },
              child: CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage('${user.profilePhoto}'),
              ),
            ),
            SizedBox(width: 10),
            Text(
              '${user.userName}',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).textTheme.displayLarge!.color),
            ),
          ],
        ),
        leadingWidth: 35,
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
      ),
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
                        Container(
                          margin: EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: InkWell(
                            onTap: () {
                              if (cubit.messageController.text
                                  .trim()
                                  .isNotEmpty)
                                cubit.addMessage(
                                  reciverId: user.uId,
                                  message: cubit.messageController.text.trim(),
                                  date: DateTime.now().toString(),
                                );
                            },
                            child: Icon(
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
}

class ConnectionChatWaiting extends StatelessWidget {
  const ConnectionChatWaiting({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: true,
      child: Container(
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
              Expanded(child: SizedBox()),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      onFieldSubmitted: (value) {},
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
                      onPressed: () {},
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
      ),
    );
  }
}
