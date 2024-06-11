import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:moga/core/common/custom_notifier.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/features/post_image_view.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_states.dart';
import 'widgets/default_app_bar.dart';

class AddPostView extends StatefulWidget {
  const AddPostView({super.key});

  @override
  State<AddPostView> createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView> {
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
        if (state is SocialCreatePostLoadingState) {
          cubit.inAsyncCall = true;
        }
        if (state is SocialCreatePostSuccessState) {
          cubit.inAsyncCall = false;
          GoRouter.of(context).pop();
          cubit.postPhoto = null;
        }
        if (state is SocialCreatePostFailureState) {
          cubit.inAsyncCall = false;
          showAchievementView(
              context: context,
              title: 'Try again later',
              subTitle: 'failed to upload the post');
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: cubit.inAsyncCall,
          child: Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DefaultAppBar(
                  title: 'New Post',
                  actions: [
                    OutlinedButton(
                      style: ButtonStyle(),
                      onPressed: () {
                        cubit.createPost(
                          text: postController.text,
                          postImage: cubit.postImageUrl,
                        );
                      },
                      child: Text(
                        'post',
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
                    cubit.postPhoto = null;
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
                      ),
                      TextField(
                        maxLines: 5,
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
                      // SizedBox(height: 50.h),
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
                Spacer(),
                Divider(
                  height: 0,
                  color: Theme.of(context).dividerColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: ButtonStyle(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                IconBroken.Image,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Gallery',
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OpenPostPhotoView(),
                              ),
                            );
                            // cubit.getPostImage(context);
                          },
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: OutlinedButton(
                          style: ButtonStyle(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '#',
                                style: TextStyle(fontSize: 24),
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Tags',
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
