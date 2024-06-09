import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moga/core/services/service_locator.dart';
import 'package:moga/features/chats/presentation/manager/chats/chats_cubit.dart';
import 'package:moga/features/chats/presentation/manager/chats/chats_states.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';
import 'package:moga/features/social/presentation/views/widgets/custom_app_bar.dart';
import 'chats_view_body.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatsCubit, ChatsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List<String> usersId = [];

        void fetchChatsForUser(String userId) async {
          // Reference to the specific user's 'chats' sub-collection
          var chatsRef = await FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .collection('chats')
              .get();
          chatsRef.docs.forEach((element) {
            log(element.toString());
          });
        }

        fetchChatsForUser(sl<SocialCubit>().model!.uId);
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                CustomAppBar(title: 'Chats'),
                ChatsViewBody(
                  chatList: usersId,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
