import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moga/core/widgets/custom_image_picker.dart';
import 'package:moga/core/widgets/custom_pick_image.dart';
import 'package:moga/features/auth/data/models/create_user_model.dart';
import 'package:moga/features/social/data/get_user_auth_impl.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_states.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitState());

  static SocialCubit get(context) => BlocProvider.of(context);
  late UserModel? model;
  GetUserImplementation user = GetUserImplementation();

  List<String> titles = [
    'Home',
    'Chats',
    'Users',
    'settings',
  ];
  int currentIndex = 0;

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(SocialChangeBottomNavState());
  }

  Future<void> getUserData() async {
    emit(SocialGetUsersLoadingState());
    try {
      model = await user.getUserData();
      emit(SocialGetUserSuccessState());
    } catch (e) {
      emit(SocialGetUserFailureState(e.toString()));
    }
  }

  File? coverImage;
  File? profileImage;

  Future<void> pickeCoverImage(BuildContext context) async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return ImagePickerComponent(
              cameraOnTap: () async {
                pickImage(ImageSource.camera).then(
                  (value) {
                    coverImage = File(value!.path);
                    emit(SocialCoverImagePickedSuccessState());
                  },
                );
                GoRouter.of(context).pop();
              },
              galleryOnTap: () {
                pickImage(ImageSource.gallery).then(
                  (value) {
                    coverImage = File(value!.path);
                    emit(SocialCoverImagePickedSuccessState());
                  },
                );
                GoRouter.of(context).pop();
              },
            );
          });
    } catch (e) {
      emit(SocialCoverImagePickedFailureState());
    }
  }
  Future<void> pickeProfileImage(BuildContext context) async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return ImagePickerComponent(
              cameraOnTap: () async {
                pickImage(ImageSource.camera).then(
                  (value) {
                    profileImage = File(value!.path);
                    emit(SocialProfileImagePickedSuccessState());
                  },
                );
                GoRouter.of(context).pop();
              },
              galleryOnTap: () {
                pickImage(ImageSource.gallery).then(
                  (value) {
                    profileImage = File(value!.path);
                    emit(SocialProfileImagePickedSuccessState());
                  },
                );
                GoRouter.of(context).pop();
              },
            );
          });
    } catch (e) {
      emit(SocialProfileImagePickedFailureState());
    }
  }
}
