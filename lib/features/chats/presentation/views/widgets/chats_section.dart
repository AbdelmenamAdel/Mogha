import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/core/widgets/custom_divider.dart';
import 'package:moga/core/widgets/show_image.dart';
import 'package:moga/features/chats/presentation/manager/chats/chats_cubit.dart';
import 'package:moga/features/chats/presentation/views/chat_details_view.dart';

class ChatsSection extends StatelessWidget {
  const ChatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = ChatsCubit.get(context);

    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
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
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatDetailsView(
                              user: cubit.users[index],
                            ),
                          ));
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            InkWell(
                              borderRadius: BorderRadius.circular(30),
                              onTap: () {
                                showImage(
                                  context: context,
                                  image: cubit.users[index].profilePhoto,
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
                            // Spacer(),
                          ],
                        )),
                  );
                },
                separatorBuilder: (context, index) => CustomDivider(),
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
  }
}
