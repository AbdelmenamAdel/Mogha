import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moga/core/widgets/custom_image_picker.dart';
import 'package:moga/core/widgets/custom_pick_image.dart';
import 'package:moga/features/auth/data/models/create_user_model.dart';
import 'package:moga/features/open_cover_photo_view.dart';
import 'package:moga/features/social/data/get_user_auth_impl.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_states.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

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

  Future<void> getCoverImage(BuildContext context) async {
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

  File? profileImage;

  Future<void> getProfileImage(BuildContext context) async {
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

  String? profileImageUrl;
  var storage = firebase_storage.FirebaseStorage.instance;

  Future<void> uploadProfileImage() async {
    storage
        .ref()
        .child('photos/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) async {
        profileImageUrl = value;
        log(profileImageUrl ?? '');
        await updateUser(
          userName: model!.userName,
          bio: model!.bio,
          phone: model!.phone,
          profile: profileImageUrl,
        );
        emit(SocialUploadProfileImageSuccessState());
      }).catchError((error) {
        log(error.toString());
        emit(SocialUploadProfileImageFailureState());
      });
    }).catchError((error) {
      log(error.toString());
      emit(SocialUploadProfileImageFailureState());
    });
  }

  String? coverImageUrl;

  Future<void> uploadCoverImage() async {
    storage
        .ref()
        .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) async {
        coverImageUrl = value;
        log(coverImageUrl ?? '');
        await updateUser(
          userName: model!.userName,
          bio: model!.bio,
          phone: model!.phone,
          cover: coverImageUrl,
        );
        emit(SocialUploadCoverImageSuccessState());
      }).catchError((error) {
        log(error.toString());
        emit(SocialUploadCoverImageFailureState());
      });
    }).catchError((error) {
      log(error.toString());
      emit(SocialUploadCoverImageFailureState());
    });
  }

  Future<void> updateUser({
    String? cover,
    String? profile,
    required String userName,
    required String bio,
    required String phone,
  }) async {
    UserModel updatedModel = UserModel(
      email: model!.email,
      userName: userName,
      password: model!.password,
      uId: model!.uId,
      bio: bio,
      coverPhoto: cover ?? model!.coverPhoto,
      profilePhoto: profile ?? model!.profilePhoto,
      isEmailVerified: model!.isEmailVerified,
      phone: phone,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(model!.uId)
        .update(updatedModel.toMap())
        .then((value) async {
      await getUserData();
    }).catchError((error) {
      log(error.toString());
      emit(SocialUserUpdateFailureState());
    });
  }
}
