import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:moga/core/services/service_locator.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/core/widgets/show_image.dart';
import 'package:moga/features/auth/data/models/create_user_model.dart';
import 'package:moga/features/post/data/model/post_model.dart';
import 'package:moga/features/post/presentation/views/comments.dart';
import 'package:moga/features/settings/presentation/views/profile.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';

class CustomPostWidget extends StatelessWidget {
  const CustomPostWidget({
    super.key,
    required this.postModel,
    required this.index,
  });

  final PostModel postModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    var cubit = SocialCubit.get(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                minVerticalPadding: 0,
                leading: InkWell(
                  onTap: () {
                    showImage(context: context, image: postModel.image);
                  },
                  child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                        postModel.image,
                      )),
                ),
                contentPadding: EdgeInsets.zero,
                title: Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        UserModel? userModel =
                            await sl<SocialCubit>().goToProfile(postModel);
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ProfileView(userModel: userModel!);
                          },
                        ));
                      },
                      child: Text(postModel.name,
                          style: Theme.of(context).textTheme.displaySmall),
                    ),
                    SizedBox(width: 2),
                    Icon(Icons.verified, color: Colors.blue, size: 18)
                  ],
                ),
                subtitle: Text(
                  postModel.date,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                trailing: IconButton(
                  icon: Icon(IconBroken.More_Circle),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Divider(
                  height: 0,
                  color: Theme.of(context).dividerColor,
                ),
              ),
              SizedBox(height: 5),
              SelectionArea(
                child: Text(
                  postModel.text,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontSize: 14, height: 1.2),
                ),
              ),
              SizedBox(height: 10),
              Wrap(
                alignment: WrapAlignment.start,
                children: [
                  InkWell(
                    overlayColor: MaterialStatePropertyAll(Color(0xf2B8EECF2)),
                    child: Text(
                      '#Software',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.blue),
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    overlayColor: MaterialStatePropertyAll(Color(0xf2B8EECF2)),
                    child: Text(
                      '#Software',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.blue),
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    overlayColor: MaterialStatePropertyAll(Color(0xf2B8EECF2)),
                    child: Text(
                      '#Software',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.blue),
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    overlayColor: MaterialStatePropertyAll(Color(0xf2B8EECF2)),
                    child: Text(
                      '#Software',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.blue),
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    overlayColor: MaterialStatePropertyAll(Color(0xf2B8EECF2)),
                    child: Text(
                      '#Software',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.blue),
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    overlayColor: MaterialStatePropertyAll(Color(0xf2B8EECF2)),
                    child: Text(
                      '#Software_Development',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.blue),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              if (postModel.postImage != null) SizedBox(height: 8),
              if (postModel.postImage != null)
                Container(
                  height: 175,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: Image.network(
                    postModel.postImage!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              Row(
                children: [
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            IconBroken.Heart,
                            size: 18,
                            color: AppColors.red,
                          ),
                          SizedBox(width: 5),
                          Text('${cubit.likes[index]}')
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                  Spacer(),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            IconBroken.Chat,
                            size: 16,
                            color: Colors.amber,
                          ),
                          SizedBox(width: 5),
                          Text('0 Comments')
                        ],
                      ),
                    ),
                    onTap: () {},
                  )
                ],
              ),
              Divider(
                height: 5,
                color: Theme.of(context).dividerColor,
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(
                    cubit.model!.profilePhoto,
                  ),
                ),
                title: InkWell(
                  onTap: () {
                    showBottomSheet(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => CommentsView(),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'write a comment ....',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
                contentPadding: EdgeInsets.zero,
                trailing: InkWell(
                  onTap: () {
                    cubit.toggleLike();
                    cubit.likePost(cubit.postsId[index], cubit.clicked);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          IconBroken.Heart,
                          color: AppColors.red,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Like')
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
