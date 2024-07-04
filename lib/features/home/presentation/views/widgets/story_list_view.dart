import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:moga/features/auth/data/models/create_user_model.dart';
import 'package:moga/features/chats/presentation/manager/chats/chats_cubit.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';

import 'custom_story_item.dart';

class StoryListView extends StatelessWidget {
  const StoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * .26;
    List<UserModel> users;
    return SizedBox(
      height: height,
      child: StreamBuilder<Object>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(SocialCubit.get(context).model!.uId)
              .collection('story')
              .orderBy('date', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            users = [
              SocialCubit.get(context).model!,
              ...ChatsCubit.get(context).users
            ];
            return ListView.builder(
                itemCount: users.length,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CustomStoryItem(
                      user: users[index],
                      stories: SocialCubit.get(context).stories,
                    ),
                  );
                });
          }),
    );
  }
}
