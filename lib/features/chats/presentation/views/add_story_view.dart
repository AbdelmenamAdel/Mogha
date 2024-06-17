import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:moga/core/common/custom_navigate.dart';
import 'package:moga/core/common/custom_notifier.dart';
import 'package:moga/core/routes/app_routes.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/features/post/presentation/views/widgets/default_app_bar.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_states.dart';
import 'package:video_player/video_player.dart';

import 'widgets/custom_add_story_attachment.dart';

class AddStoryView extends StatefulWidget {
  const AddStoryView({super.key});

  @override
  State<AddStoryView> createState() => _AddStoryViewState();
}

class _AddStoryViewState extends State<AddStoryView> {
  var storyController = TextEditingController();

  @override
  void dispose() {
    storyController.clear();
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = SocialCubit.get(context);
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        if (state is SocialAddStoryLoadingState ||
            state is SocialUploadStoryPickImageLoadingState ||
            state is SocialUploadStoryPickVodeoLoadingState ||
            state is SocialUploadStoryPickCameraLoadingState) {
          cubit.inAsyncCall = true;
        }
        if (state is SocialAddStorySuccessState) {
          cubit.inAsyncCall = false;
          context.navigateReplace(AppRoutes.socialLayout, context);
          cubit.addStoryCamera = null;
          cubit.addStoryImage = null;
          cubit.addStoryVideo = null;
        }
        if (state is SocialAddStoryFailureState) {
          cubit.inAsyncCall = false;
          showAchievementView(
              context: context,
              title: 'Try again later',
              subTitle: 'failed to upload the story');
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: cubit.inAsyncCall,
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DefaultAppBar(
                    title: 'Add Story',
                    actions: [
                      OutlinedButton(
                        style: ButtonStyle(),
                        onPressed: () {
                          if (cubit.addStoryImage != null) {
                            cubit.uploadStoryImage(
                              message: storyController.text,
                            );
                          } else if (cubit.addStoryCamera != null) {
                            cubit.uploadStoryCameraImage(
                                message: storyController.text);
                          } else if (cubit.addStoryVideo != null) {
                            cubit.uploadStoryVideo(
                              message: storyController.text,
                            );
                          } else {
                            if (storyController.text.length > 0)
                              cubit.addStory(
                                message: storyController.text,
                              );
                          }
                        },
                        child: Text(
                          'publish',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                    onPressed: () {
                      cubit.addStoryCamera = null;
                      cubit.addStoryImage = null;
                      cubit.addStoryVideo = null;
                      GoRouter.of(context).pop();
                    },
                  ),
                  Divider(
                    height: 0,
                    color: Theme.of(context).dividerColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        ListTile(
                          minVerticalPadding: 0,
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                              '${cubit.model!.profilePhoto}',
                            ),
                          ),
                          contentPadding: EdgeInsets.zero,
                          title: Text('${cubit.model!.userName}',
                              style: Theme.of(context).textTheme.displaySmall),
                          trailing: CustomAddStoryAttachment(),
                        ),
                        TextField(
                          maxLines: 3,
                          minLines: 1,
                          cursorColor: AppColors.blue,
                          controller: storyController,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(fontSize: 22),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "What's on your mind?",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  color: AppColors.grey,
                                  fontSize: 24,
                                ),
                          ),
                        ),
                        if (cubit.addStoryImage != null)
                          ShowImage(
                            image: cubit.addStoryImage!,
                            onPressed: () {
                              setState(() {
                                cubit.addStoryImage = null;
                              });
                            },
                          ),
                        if (cubit.addStoryCamera != null)
                          ShowImage(
                            image: cubit.addStoryCamera!,
                            onPressed: () {
                              setState(() {
                                cubit.addStoryCamera = null;
                              });
                            },
                          ),
                        if (cubit.addStoryVideo != null)
                          ShowVideo(
                            video: cubit.videoController,
                            onPressed: () {
                              setState(() {
                                cubit.addStoryVideo = null;
                              });
                            },
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ShowImage extends StatelessWidget {
  const ShowImage({
    super.key,
    this.onPressed,
    required this.image,
  });
  final File image;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0, top: 24.0),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            child: Image.file(
              image,
              fit: BoxFit.cover,
            ),
            height: 350.h,
            width: double.infinity,
          ),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.close_outlined,
              color: AppColors.grey,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}

class ShowVideo extends StatelessWidget {
  const ShowVideo({
    super.key,
    this.onPressed,
    required this.video,
  });
  final VideoPlayerController video;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0, top: 24.0),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          InkWell(
            onLongPress: () {
              video.pause();
            },
            onTap: () {
              video.play();
            },
            child: Container(
              child: VideoPlayer(video),
              height: 350.h,
              width: double.infinity,
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.close_outlined,
              color: AppColors.grey,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
