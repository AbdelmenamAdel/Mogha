import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:moga/core/services/service_locator.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/core/widgets/show_image.dart';
import 'package:moga/features/auth/data/models/create_user_model.dart';
import 'package:moga/features/chats/chat_details_view.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';

class ChatsViewBody extends StatelessWidget {
  const ChatsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('users')
            .doc(sl<SocialCubit>().model!.uId)
            .collection('chats')
            .get(),
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
                  var user = UserModel.fromJson(snapshot.data?.docs[index]);
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatDetailsView(
                              user: user,
                            ),
                          ));
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
                                    image: user.profilePhoto,
                                  );
                                },
                                child: Hero(
                                  tag: 'chat${user.uId}',
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      user.profilePhoto,
                                    ),
                                    radius: 25,
                                    backgroundColor: AppColors.blue,
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              Text(user.userName),
                              Spacer(),
                            ],
                          )),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  height: 0,
                  color: Theme.of(context).dividerColor,
                ),
                itemCount: snapshot.data?.docs.length ?? 0,
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
