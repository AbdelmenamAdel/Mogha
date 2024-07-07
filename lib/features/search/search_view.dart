import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:moga/core/local/app_local.dart';
import 'package:moga/core/services/service_locator.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/core/utils/app_images.dart';
import 'package:moga/core/utils/app_strings.dart';
import 'package:moga/core/widgets/custom_text_form_field.dart';
import 'package:moga/features/auth/data/models/create_user_model.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';

class SearchViw extends StatefulWidget {
  const SearchViw({super.key});

  @override
  State<SearchViw> createState() => _SearchViwState();
}

class _SearchViwState extends State<SearchViw> {
  String? username;

  @override
  Widget build(BuildContext context) {
    var users = FirebaseFirestore.instance
        .collection('users')
        .where('userName', isEqualTo: username)
        .get();
    return Scaffold(
      appBar: AppBar(
        title: CustomTextFormField(
          color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(.1),
          hintText: Strings.search.tr(context),
          onChanged: (data) {
            username = data;

            setState(() {});
            log(username ?? '');
          },
        ),
        titleSpacing: 0.0,
      ),
      body: Column(
        mainAxisAlignment:
            username == '' ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          if (username != null)
            if (username!.length > 3)
              FutureBuilder(
                future: users,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Something went wrong'));
                  }
                  if (snapshot.hasData) {
                    if (snapshot.data?.docs.isEmpty ?? false) {
                      Center(child: Text('no user found'));
                    }
                    return Expanded(
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data?.docs.length ?? 0,
                          itemBuilder: (context, index) {
                            var user =
                                UserModel.fromJson(snapshot.data?.docs[index]);
                            var doc = snapshot.data!.docs[index];
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(user.profilePhoto),
                                radius: 25,
                              ),
                              title: Text(user.userName),
                              trailing: FutureBuilder(
                                  future: doc.reference
                                      .collection('followers')
                                      .doc(sl<SocialCubit>().model!.uId)
                                      .get(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data?.exists ?? false) {
                                        return OutlinedButton(
                                          onPressed: () async {
                                            await sl<SocialCubit>()
                                                .unFollow(doc);
                                            setState(() {});
                                          },
                                          child: Text(
                                            Strings.unfollow.tr(context),
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall,
                                          ),
                                        );
                                      } else {
                                        return OutlinedButton(
                                          onPressed: () async {
                                            await sl<SocialCubit>().follow(doc);
                                            setState(() {});
                                          },
                                          child: Text(
                                            Strings.follow.tr(context),
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall,
                                          ),
                                        );
                                      }
                                    } else {
                                      return CircularProgressIndicator(
                                        color: AppColors.blue,
                                      );
                                    }
                                  }),
                            );
                          }),
                    );
                  } else {
                    return Center(
                        child: CircularProgressIndicator(
                      color: AppColors.blue,
                    ));
                  }
                },
              ),
          if (username == '') Image.asset(AppImages.search),
          // if (username == '') Text(Strings.search.tr(context))
        ],
      ),
    );
  }
}

// class SearchResultBody extends StatefulWidget {
//   const SearchResultBody({
//     super.key,
//     required this.snapshot,
//   });
//   final AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot;

//   @override
//   State<SearchResultBody> createState() => _SearchResultBodyState();
// }

// class _SearchResultBodyState extends State<SearchResultBody> {
//   @override
//   Widget build(BuildContext context) {
//     return  }
// }
