import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/core/widgets/custom_image_picker.dart';
import 'package:moga/core/widgets/custom_pick_image.dart';
import 'package:moga/core/widgets/custom_video_picker.dart';
import 'package:moga/features/auth/data/models/create_user_model.dart';
import 'package:moga/features/chats/data/models/story_model.dart';
import 'package:moga/features/post/data/model/post_model.dart';
import 'package:moga/features/social/data/get_user_auth_impl.dart';
import 'package:moga/features/social/data/get_user_authorization.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_states.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:video_player/video_player.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit(this.userRepo) : super(SocialInitState());
  GetUserAuth userRepo;

  static SocialCubit get(context) => BlocProvider.of(context);
  UserModel? model;
  GetUserImplementation user = GetUserImplementation();
  bool inAsyncCall = false;

  int currentIndex = 0;

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(SocialChangeBottomNavState());
  }

  Future<void> getUserData() async {
    emit(SocialGetUserLoadingState());
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
    emit(SocialUploadProfileImageLoadingState());
    storage
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
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
    emit(SocialUploadCoverImageLoadingState());
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
      story: model!.story,
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

  File? postPhoto;

  Future<void> getPostImage(BuildContext context) async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return ImagePickerComponent(
              cameraOnTap: () async {
                pickImage(ImageSource.camera).then(
                  (value) {
                    postPhoto = File(value!.path);
                    emit(SocialPostImagePickedSuccessState());
                  },
                );
                GoRouter.of(context).pop();
              },
              galleryOnTap: () {
                pickImage(ImageSource.gallery).then(
                  (value) {
                    postPhoto = File(value!.path);
                    emit(SocialPostImagePickedSuccessState());
                  },
                );
                GoRouter.of(context).pop();
              },
            );
          });
    } catch (e) {
      emit(SocialPostImagePickedFailureState());
    }
  }

  String? postImageUrl;

  Future<void> uploadPostPhoto() async {
    emit(SocialUploadPostImageLoadingState());
    await storage
        .ref()
        .child("posts/${Uri.file(postPhoto!.path).pathSegments.last}")
        .putFile(postPhoto!)
        .then((value) {
      value.ref.getDownloadURL().then((value) async {
        postImageUrl = value;
        log(postImageUrl ?? '');
        emit(SocialUploadPostImageSuccessState());
      }).catchError((error) {
        emit(SocialUploadPostImageFailureState());
      }).catchError((error) {
        emit(SocialUploadPostImageFailureState());
      });
    });
  }

  FirebaseFirestore instance = FirebaseFirestore.instance;
  Future<void> createPost({
    String? postImage,
    required String text,
  }) async {
    PostModel postModel = PostModel(
      image: model!.profilePhoto,
      date: DateTime.now().toString(),
      name: model!.userName,
      text: text,
      uId: model!.uId,
      postImage: postImage,
    );
    try {
      emit(SocialCreatePostLoadingState());
      await instance.collection('posts').add(postModel.toMap());
      await instance
          .collection('users')
          .doc(model!.uId)
          .collection('posts')
          .add(postModel.toMap());
      emit(SocialCreatePostSuccessState());
    } catch (e) {
      emit(SocialCreatePostFailureState());
    }
  }

  List<PostModel> posts = [];
  List<String> postsId = [];
  List<int> likes = [];
  List<int> comments = [];

  Future<List<PostModel>> getPosts() async {
    try {
      await userRepo.getPosts().then((value) {
        value.docs.forEach((element) async {
          element.reference.collection('likes').get().then((value) {
            likes.add(value.docs.length);
            emit(SocialGetLikedPostsSuccessState());
          });
          await element.reference.collection('comments').get().then((value) {
            comments.add(value.docs.length);
            emit(SocialGetCommentsSuccessState());
            postsId.add(element.id);
            posts.add(PostModel.fromJson(element.data()));
          });
        });
      });
      emit(SocialGetPostsSuccessState());
    } catch (e) {
      log(e.toString());
      emit(SocialGetPostsFailureState());
    }
    return posts;
  }

  Future<void> likePost(String postId, isLiked) async {
    try {
      clicked
          ? instance
              .collection('posts')
              .doc(postId)
              .collection('likes')
              .doc(model!.uId)
              .set({
              'like': true,
            })
          : instance
              .collection('posts')
              .doc(postId)
              .collection('likes')
              .doc(model!.uId)
              .delete();
      emit(SocialLikePostSuccessState());
    } catch (e) {
      emit(SocialLikePostFailureState());
    }
  }

  Color? color = null;
  bool clicked = false;

  void toggleLike() {
    clicked = !clicked;
    color = clicked ? AppColors.red : null;
  }

  Future<UserModel?> goToProfile(PostModel postModel) async {
    try {
      var data = await FirebaseFirestore.instance
          .collection('users')
          .doc(postModel.uId)
          .get();
      log(postModel.uId);
      log(data.toString());
      return UserModel.fromJson(data);
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<void> commentPost(String postId, String comment) async {
    try {
      instance
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .doc(model!.uId)
          .set({'comment': comment});
      emit(SocialCommentPostSuccessState());
    } catch (e) {
      emit(SocialCommentPostFailureState());
    }
  }

  void createComment(String postId) {
    // instance.collection('posts').doc(postId).collection('comments').add(data)
  }
  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//!!!!!!!!!! follow and unfollow
  Future<void> follow(QueryDocumentSnapshot doc) async {
    UserModel user = await UserModel.fromJson(doc.data());
    doc.reference.collection('followers').doc(model!.uId).set(
      {"user": model!.uId},
    );
    instance
        .collection('users')
        .doc(model!.uId)
        .collection('following')
        .doc(user.uId)
        .set(
      {"user": user.uId},
    );
    emit(SocialFollowState());
  }

  Future<void> unFollow(QueryDocumentSnapshot doc) async {
    doc.reference.collection('followers').doc(model!.uId).delete();
    instance
        .collection('users')
        .doc(model!.uId)
        .collection('following')
        .doc()
        .delete();
    emit(SocialUnFollowState());
  }

  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!! add story methods
  void addStory({
    String? image,
    String? message,
    String? video,
  }) {
    try {
      emit(SocialAddStoryLoadingState());
      user.addStory(
          story: StoryModel(
        date: DateTime.now().toString(),
        message: message,
        image: image,
        video: video,
      ));
      emit(SocialAddStorySuccessState());
    } catch (e) {
      emit(SocialAddStoryFailureState());
    }
  }

  File? addStoryImage;
  String? addStoryImageUrl;
  File? addStoryCamera;
  String? addStoryCameraUrl;
  File? addStoryVideo;
  String? addStoryVideoUrl;
  late VideoPlayerController videoController;

  Future<void> getStoryImage() async {
    pickImage(ImageSource.gallery).then((value) {
      addStoryImage = File(value!.path);
      addStoryCamera = null;
      addStoryVideo = null;
      videoController.play();
      emit(SocialAddStoryPickImageSuccessState());
    }).catchError((onError) {
      emit(SocialAddStoryPickImageFailureState());
    });
  }

  Future<void> uploadStoryImage({
    String? message,
  }) async {
    emit(SocialUploadStoryPickImageLoadingState());
    storage
        .ref()
        .child('story/${Uri.file(addStoryImage!.path).pathSegments.last}')
        .putFile(addStoryImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) async {
        addStoryImageUrl = value;
        emit(SocialUploadStoryPickImageSuccessState());
        log(addStoryImageUrl ?? '');
        addStory(
          message: message,
          image: addStoryImageUrl,
        );
      }).catchError((error) {
        log(error.toString());
        emit(SocialUploadStoryPickImageFailureState());
      });
    }).catchError((error) {
      log(error.toString());
      emit(SocialUploadStoryPickImageFailureState());
    });
  }

  Future<void> getStoryCameraImage() async {
    pickImage(ImageSource.camera).then((value) {
      addStoryCamera = File(value!.path);
      addStoryImage = null;
      addStoryVideo = null;
      videoController.pause();
      emit(SocialAddStoryPickCameraSuccessState());
    }).catchError((onError) {
      emit(SocialAddStoryPickCameraFailureState());
    });
  }

  Future<void> uploadStoryCameraImage({
    String? message,
  }) async {
    emit(SocialUploadStoryPickCameraLoadingState());
    storage
        .ref()
        .child('story/${Uri.file(addStoryCamera!.path).pathSegments.last}')
        .putFile(addStoryCamera!)
        .then((value) {
      value.ref.getDownloadURL().then((value) async {
        addStoryCameraUrl = value;
        emit(SocialUploadStoryPickCameraSuccessState());
        log(addStoryCameraUrl ?? '');
        addStory(
          message: message,
          image: addStoryCameraUrl,
        );
      }).catchError((error) {
        log(error.toString());
        emit(SocialUploadStoryPickCameraFailureState());
      });
    }).catchError((error) {
      log(error.toString());
      emit(SocialUploadStoryPickCameraFailureState());
    });
  }

  Future<void> getStoryVideo() async {
    await pickVideo(ImageSource.gallery).then((value) {
      addStoryVideo = File(value!.path);
      addStoryCamera = null;
      addStoryImage = null;
      videoController = VideoPlayerController.file(addStoryVideo!);
      videoController.initialize().then((value) {
        videoController.play();
      });
      emit(SocialAddStoryPickVodeoSuccessState());
    }).catchError((onError) {
      log('fuck while get video');
      emit(SocialAddStoryPickVodeoFailureState());
    });
  }

  Future<void> uploadStoryVideo({
    String? message,
  }) async {
    emit(SocialUploadStoryPickVodeoLoadingState());
    await storage
        .ref()
        .child('story/${Uri.file(addStoryVideo!.path).pathSegments.last}')
        .putFile(addStoryVideo!)
        .then((value) {
      value.ref.getDownloadURL().then((value) async {
        addStoryVideoUrl = value;
        log(addStoryVideoUrl ?? '');
        emit(SocialUploadStoryPickVodeoSuccessState());
        addStory(
          message: message,
          video: addStoryVideoUrl,
        );
      }).catchError((error) {
        log(error.toString());
        emit(SocialUploadStoryPickVodeoFailureState());
      });
    }).catchError((error) {
      log(error.toString());
      emit(SocialUploadStoryPickVodeoFailureState());
    });
  }
}
