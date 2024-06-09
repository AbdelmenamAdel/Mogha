import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moga/core/services/service_locator.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/core/widgets/show_image.dart';
import 'package:moga/features/chats/chat_details_view.dart';
import 'package:moga/features/settings/presentation/views/widgets/log_out_dialog.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';
import '../chats/presentation/manager/chats/chats_cubit.dart';
import '../chats/presentation/manager/chats/chats_states.dart';
import '../social/presentation/views/widgets/custom_app_bar.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: 'Users'),
          UsersViewBody(),
        ],
      ),
    );
  }
}

class UsersViewBody extends StatelessWidget {
  const UsersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = ChatsCubit.get(context);
    return BlocConsumer<ChatsCubit, ChatsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return FutureBuilder(
              future: FirebaseFirestore.instance.collection('users').get(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Something went wrong'));
                }
                if (snapshot.hasData) {
                  if (snapshot.data?.docs.isEmpty ?? false) {
                    Center(child: Text('no user found'));
                  }
                  return Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        var doc = snapshot.data!.docs[index];

                        return InkWell(
                          onTap: () {
                            showAdaptiveDialog(
                              context: context,
                              builder: (context) {
                                return CustomDialog(
                                  title: 'Chat ${cubit.users[index].userName}',
                                  onYesTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ChatDetailsView(
                                            user: cubit.users[index],
                                          ),
                                        ));
                                  },
                                );
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    InkWell(
                                      borderRadius: BorderRadius.circular(30),
                                      onTap: () {
                                        showImage(
                                          context: context,
                                          image:
                                              cubit.users[index].profilePhoto,
                                        );
                                      },
                                      child: Hero(
                                        tag: 'chat${cubit.users[index].uId}',
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            cubit.users[index].profilePhoto,
                                          ),
                                          radius: 25,
                                          backgroundColor: AppColors.blue,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Text(cubit.users[index].userName),
                                    Spacer(),
                                    FutureBuilder(
                                        future: doc.reference
                                            .collection('followers')
                                            .doc(sl<SocialCubit>().model!.uId)
                                            .get(),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            bool exists =
                                                snapshot.data?.exists ?? false;
                                            return SnapshotHasData(
                                                doc: doc, exists: exists);
                                          } else {
                                            return Center(
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    Colors.transparent,
                                                radius: 8,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: AppColors.blue,
                                                ),
                                              ),
                                            );
                                          }
                                        }),
                                  ],
                                )),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(
                        height: 0,
                        color: Theme.of(context).dividerColor,
                      ),
                      itemCount: cubit.users.length,
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.blue,
                    ),
                  );
                }
              });
        });
  }
}

class SnapshotHasData extends StatefulWidget {
  const SnapshotHasData({
    super.key,
    required this.doc,
    required this.exists,
  });
  final QueryDocumentSnapshot<Map<String, dynamic>> doc;
  final bool exists;
  @override
  State<SnapshotHasData> createState() => _SnapshotHasDataState();
}

class _SnapshotHasDataState extends State<SnapshotHasData> {
  @override
  Widget build(BuildContext context) {
    if (widget.exists) {
      return OutlinedButton(
        onPressed: () async {
          await sl<SocialCubit>().unFollow(widget.doc);
          setState(() {});
        },
        child: Text(
          'Un Follow',
          style: Theme.of(context).textTheme.labelSmall,
        ),
      );
    } else {
      return OutlinedButton(
        onPressed: () async {
          await sl<SocialCubit>().follow(widget.doc);
          setState(() {});
        },
        child: Text(
          'Follow',
          style: Theme.of(context).textTheme.labelSmall,
        ),
      );
    }
  }
}
