import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:moga/core/routes/app_routes.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/core/common/custom_navigate.dart';
import 'package:moga/features/settings/presentation/views/widgets/my_all_posts.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_states.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var userModel = SocialCubit.get(context).model;
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    child: Stack(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(
                                height: 210,
                                width: double.infinity,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                ),
                                child: Hero(
                                  tag: 'coverPhoto',
                                  child: Image.network(
                                    fit: BoxFit.cover,
                                    userModel!.coverPhoto,
                                  ),
                                )),
                            IconButton(
                              onPressed: () {
                                context.navigate(AppRoutes.coverPhoto, context);
                              },
                              icon: CircleAvatar(
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                child: Icon(
                                  IconBroken.Camera,
                                  color: AppColors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  radius: 70,
                                  child: Hero(
                                    tag: 'profilePhoto',
                                    child: CircleAvatar(
                                      radius: 65,
                                      backgroundImage: NetworkImage(
                                        userModel.profilePhoto,
                                      ),
                                    ),
                                  )),
                              IconButton(
                                onPressed: () {
                                  context.navigate(
                                      AppRoutes.profilePhoto, context);
                                },
                                icon: CircleAvatar(
                                  radius: 18,
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  child: Icon(
                                    IconBroken.Camera,
                                    size: 20,
                                    color: AppColors.blue,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    userModel.userName,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(height: 3),
                  Text(
                    userModel.phone,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(height: 10),
                  Text(
                    userModel.bio,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                          child: InkWell(
                        child: Column(children: [
                          Text(
                            '100',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text('Posts'),
                        ]),
                        onTap: () {},
                      )),
                      Expanded(
                          child: InkWell(
                        child: Column(children: [
                          Text(
                            '265',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text('Photos'),
                        ]),
                        onTap: () {},
                      )),
                      Expanded(
                          child: InkWell(
                        child: Column(children: [
                          Text(
                            '1K',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text('Following'),
                        ]),
                        onTap: () {},
                      )),
                      Expanded(
                          child: InkWell(
                        child: Column(children: [
                          Text(
                            '10K',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text('Followers'),
                        ]),
                        onTap: () {},
                      )),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          child: Text(
                            'Add Photo',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: Colors.blue,
                                ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(width: 10.0),
                      OutlinedButton(
                        style: ButtonStyle(),
                        child: Icon(
                          IconBroken.Edit,
                          size: 20,
                        ),
                        onPressed: () {
                          context.navigate(AppRoutes.editProfile, context);
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  MyPostsWidget(),
                ],
              ),
            ),
          );
        });
  }
}
