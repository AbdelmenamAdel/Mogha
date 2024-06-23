import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:moga/core/services/service_locator.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';

import 'custom_story_item.dart';

class StoryListView extends StatelessWidget {
  const StoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * .26;

    return SizedBox(
      height: height,
      child: StreamBuilder<Object>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .where('story', isNotEqualTo: [])
              .where('followers', arrayContains: sl<SocialCubit>().model!.uId)
              .snapshots(),
          builder: (context, snapshot) {
            return ListView.builder(
                // itemCount: snapshot.data!.docs.length,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CustomStoryItem(
                      user: sl<SocialCubit>().model!,
                    ),
                  );
                });
          }),
    );
  }
}
