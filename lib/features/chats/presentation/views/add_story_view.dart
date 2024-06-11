import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:moga/core/common/custom_notifier.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/features/post/presentation/views/widgets/default_app_bar.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_states.dart';

class AddStoryView extends StatefulWidget {
  const AddStoryView({super.key});

  @override
  State<AddStoryView> createState() => _AddStoryViewState();
}

class _AddStoryViewState extends State<AddStoryView> {
  var postController = TextEditingController();

  @override
  void dispose() {
    postController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = SocialCubit.get(context);
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        if (state is SocialCreateStoryLoadingState) {
          cubit.inAsyncCall = true;
        }
        if (state is SocialCreateStorySuccessState) {
          cubit.inAsyncCall = false;
          GoRouter.of(context).pop();
          // cubit.add = null;
          // cubit.addStory = null;
          // cubit.
        }
        if (state is SocialCreateStoryFailureState) {
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
                          // cubit.createPost(
                          //   text: postController.text,
                          //   postImage: cubit.postImageUrl,
                          // );
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
                      // cubit.postPhoto = null;
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
                          controller: postController,
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
                        if (cubit.postPhoto != null)
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 24.0, top: 24.0),
                            child: Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                Container(
                                  child: Image.file(
                                    cubit.postPhoto!,
                                    fit: BoxFit.cover,
                                  ),
                                  height: 350.h,
                                  width: double.infinity,
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      cubit.postPhoto = null;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.close_outlined,
                                    color: AppColors.grey,
                                    size: 28,
                                  ),
                                ),
                              ],
                            ),
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

class CustomAddStoryAttachment extends StatelessWidget {
  const CustomAddStoryAttachment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SubmenuButton(
              menuChildren: [
                Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            // cubit.getChatImage(context: context, reciverId: uId);
                          },
                          icon: Icon(IconBroken.Image),
                        ),
                        Text('Image'),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            // cubit.getCameraImage(
                            //     context: context, reciverId: uId);
                          },
                          icon: Icon(IconBroken.Camera),
                        ),
                        Text('Camera'),
                        SizedBox(
                          width: 12,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            // await cubit.getVideo(
                            //     context: context, reciverId: uId);
                          },
                          icon: Icon(IconBroken.Video),
                        ),
                        Text('Video'),
                      ],
                    ),
                  ],
                )
              ],
              child: Row(
                children: [
                  Icon(
                    Icons.attach_file,
                  ),
                  Text(
                    'click to add',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
