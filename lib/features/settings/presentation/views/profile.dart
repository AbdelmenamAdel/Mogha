import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:moga/core/common/custom_notifier.dart';
import 'package:moga/core/routes/app_routes.dart';
import 'package:moga/core/common/custom_navigate.dart';
import 'package:moga/core/services/service_locator.dart';
import 'package:moga/features/auth/data/models/create_user_model.dart';
import 'package:moga/features/settings/presentation/views/widgets/my_all_posts.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_states.dart';
import 'widgets/profile_photo_section.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({
    super.key,
    required this.userModel,
  });

  final UserModel userModel;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();

    Timer(
      const Duration(seconds: 1),
      () {
        completer.complete();
      },
    );
    setState(() {
      // documentId = context.read<IdProvider>().getDocumentId();
      // docId = context.read<IdProvider>().getData;
    });
    return completer.future.then<void>((_) {
      showAchievementView(
        context: context,
        title: 'click to refresh again',
        alignment: Alignment.bottomCenter,
        onTap: () {
          _refreshIndicatorKey.currentState!.show();
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: SafeArea(
              child: Scaffold(
                key: _scaffoldKey,
                body: LiquidPullToRefresh(
                  key: _refreshIndicatorKey,
                  onRefresh: _handleRefresh,
                  showChildOpacityTransition: false,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  color: Theme.of(context).textTheme.bodySmall!.color,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ProfilePhotosSection(userModel: widget.userModel),
                          Text(
                            widget.userModel.userName,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          SizedBox(height: 3),
                          Text(
                            widget.userModel.phone,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          SizedBox(height: 10),
                          Text(
                            widget.userModel.bio,
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
                          if (widget.userModel == sl<SocialCubit>().model)
                            SizedBox(height: 30),
                          if (widget.userModel == sl<SocialCubit>().model)
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
                                    context.navigate(
                                        AppRoutes.editProfile, context);
                                  },
                                )
                              ],
                            ),
                          if (widget.userModel != sl<SocialCubit>().model)
                            SizedBox(height: 20),
                          MyPostsWidget(
                            uId: widget.userModel.uId,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
