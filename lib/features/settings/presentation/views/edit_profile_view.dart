import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:moga/core/routes/app_routes.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/core/common/custom_navigate.dart';
import 'package:moga/core/widgets/custom_text_f_field.dart';
import 'package:moga/features/post/presentation/views/widgets/default_app_bar.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_states.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = SocialCubit.get(context);
    var nameController = TextEditingController();
    var bioController = TextEditingController();
    var phoneController = TextEditingController();
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        if (state is SocialGetUserSuccessState) {
          GoRouter.of(context).pop();
          cubit.coverImage = null;
          cubit.profileImage = null;
          cubit.inAsyncCall = false;
        }
        if (state is SocialGetUserLoadingState) {
          cubit.inAsyncCall = true;
        }
        if (state is SocialLikePostFailureState) {
          cubit.inAsyncCall = false;
        }
      },
      builder: (context, state) {
        var userModel = SocialCubit.get(context).model;
        nameController.text = userModel!.userName;
        bioController.text = userModel.bio;
        phoneController.text = userModel.phone;
        return ModalProgressHUD(
          inAsyncCall: cubit.inAsyncCall,
          progressIndicator: CupertinoActivityIndicator(
            radius: 25,
            // color: AppColors.grey,
          ),
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  DefaultAppBar(
                    title: 'Edit Profile',
                    actions: [
                      InkWell(
                        highlightColor: AppColors.blue,
                        onTap: () async {
                          await cubit.updateUser(
                            userName: nameController.text,
                            bio: bioController.text,
                            phone: phoneController.text,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Update',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                  Padding(
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
                                          userModel.coverPhoto,
                                        ),
                                      )),
                                  IconButton(
                                    onPressed: () {
                                      context.navigate(
                                          AppRoutes.coverPhoto, context);
                                    },
                                    icon: CircleAvatar(
                                      backgroundColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
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
                                        backgroundColor: Theme.of(context)
                                            .scaffoldBackgroundColor,
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
                                        backgroundColor: Theme.of(context)
                                            .scaffoldBackgroundColor,
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
                        SizedBox(height: 20),
                        CustomTextField(
                          controller: nameController,
                          prefixIcon: IconBroken.User,
                          labelText: 'Name',
                          onFieldSubmitted: (value) {
                            nameController.text = value ?? '';
                          },
                          keyboardType: TextInputType.name,
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          controller: bioController,
                          prefixIcon: IconBroken.Info_Circle,
                          labelText: 'Bio',
                          keyboardType: TextInputType.text,
                          onFieldSubmitted: (value) {
                            bioController.text = value ?? '';
                          },
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          controller: phoneController,
                          prefixIcon: IconBroken.Call,
                          labelText: 'phone',
                          onFieldSubmitted: (value) {
                            phoneController.text = value!;
                          },
                          onSaved: (value) {
                            phoneController.text = value!;
                          },
                          keyboardType: TextInputType.number,
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
/*

 AnimatedSplashScreen(
        backgroundColor: Colors.transparent,
        splashIconSize: 300.sp,
        splashTransition: SplashTransition.fadeTransition,
        splash: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlitchEffect(
                repeat: false,
                duration: const Duration(milliseconds: 1850),
                child: Text(
                  "Craftify",
                  style: TextStyle(
                    fontFamily: 'Explora',
                    fontSize: 70.sp,
                    color: textColor,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2.5.sp,
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              Align(
                alignment: Alignment.bottomCenter,
                child: CupertinoActivityIndicator(
                  color: textColor,
                  animating: true,
                  radius: 10.r,
                ),
              ),
            ],
          ),
        ),
        nextScreen:
            docId != '' ? const CustomerHomeScreen() : const CustomerLogin(),
      ),








*/