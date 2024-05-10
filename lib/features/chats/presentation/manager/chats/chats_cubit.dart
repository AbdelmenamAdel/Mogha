import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moga/core/services/service_locator.dart';
import 'package:moga/core/widgets/custom_pick_image.dart';
import 'package:moga/core/widgets/custom_video_picker.dart';
import 'package:moga/features/auth/data/models/create_user_model.dart';
import 'package:moga/features/chats/data/firebase/chat_repo_impl.dart';
import 'package:moga/features/chats/data/models/message_model.dart';
import 'package:moga/features/chats/presentation/manager/chats/chats_states.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ChatsCubit extends Cubit<ChatsStates> {
  ChatsCubit(this.chatRepo) : super(ChatInitial());
  static ChatsCubit get(context) => BlocProvider.of(context);
  ChatRepoImplementation chatRepo;
  TextEditingController messageController = TextEditingController();
  List<UserModel> users = [];
  UserModel currentUser = sl<SocialCubit>().model!;
  final ScrollController controller = ScrollController();
  var storage = firebase_storage.FirebaseStorage.instance;

  void getAllUsers() {
    try {
      chatRepo.getAllUsers().then((value) {
        emit(ChatGetAllUsersLoadingState());
        if (value.docs.length != users.length) {
          users = [];
          value.docs.forEach((element) {
            if (element.data()['uId'] != currentUser.uId)
              users.add(UserModel.fromJson(element.data()));
          });
        }
      });
      emit(ChatGetAllUsersSuccessState());
    } catch (e) {
      emit(ChatGetAllUsersFailureState());
    }
  }

  void addMessage({
    required String reciverId,
    required String date,
    String? image,
    String? message,
  }) {
    try {
      emit(AddMessageLoadingState());
      chatRepo.addMessage(
          model: MessageModel(
        senderId: currentUser.uId,
        reciverId: reciverId,
        date: date,
        message: message,
        image: image,
      ));
      messageController.clear();
      emit(AddMessageSuccessState());
    } catch (e) {
      emit(AddMessageFailureState());
    }
  }

  File? chatImage;
  String? chatImageUrl;
  File? chatCamera;
  String? chatCameraUrl;
  File? chatVideo;
  String? chatVideoUrl;

  Future<void> getChatImage(
      {required BuildContext context, required String reciverId}) async {
    pickImage(ImageSource.gallery).then((value) {
      chatImage = File(value!.path);
      emit(SocialChatImagePickedSuccessState());
      uploadChatImage(message: messageController.text, reciverId: reciverId);
    }).catchError((onError) {
      emit(SocialChatImagePickedFailureState());
    });
  }

  Future<void> uploadChatImage({
    String? message,
    required String reciverId,
  }) async {
    emit(UploadChatImageLoadingState());
    storage
        .ref()
        .child('chat/${Uri.file(chatImage!.path).pathSegments.last}')
        .putFile(chatImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) async {
        chatImageUrl = value;
        emit(UploadChatImageSuccessState());
        log(chatImageUrl ?? '');
        addMessage(
          reciverId: reciverId,
          date: DateTime.now().toString(),
          image: chatImageUrl,
          message: message,
        );
      }).catchError((error) {
        log(error.toString());
        emit(UploadChatImageFailureState());
      });
    }).catchError((error) {
      log(error.toString());
      emit(UploadChatImageFailureState());
    });
  }

  Future<void> getCameraImage(
      {required BuildContext context, required String reciverId}) async {
    pickImage(ImageSource.camera).then((value) {
      chatCamera = File(value!.path);
      emit(SocialChatImagePickedSuccessState());
      uploadCameraImage(message: messageController.text, reciverId: reciverId);
    }).catchError((onError) {
      emit(SocialChatImagePickedFailureState());
    });
  }

  Future<void> uploadCameraImage({
    String? message,
    required String reciverId,
  }) async {
    emit(UploadChatImageLoadingState());
    storage
        .ref()
        .child('chat/${Uri.file(chatCamera!.path).pathSegments.last}')
        .putFile(chatCamera!)
        .then((value) {
      value.ref.getDownloadURL().then((value) async {
        chatCameraUrl = value;
        emit(UploadChatImageSuccessState());
        log(chatCameraUrl ?? '');
        addMessage(
          reciverId: reciverId,
          date: DateTime.now().toString(),
          image: chatCameraUrl,
          message: message,
        );
      }).catchError((error) {
        log(error.toString());
        emit(UploadChatImageFailureState());
      });
    }).catchError((error) {
      log(error.toString());
      emit(UploadChatImageFailureState());
    });
  }

  Future<void> getVideoImage({
    required BuildContext context,
    required String reciverId,
  }) async {
    pickVideo(ImageSource.camera).then((value) {
      chatVideo = File(value!.path);
      emit(SocialChatImagePickedSuccessState());
      uploadVideoImage(message: messageController.text, reciverId: reciverId);
    }).catchError((onError) {
      emit(SocialChatImagePickedFailureState());
    });
  }

  Future<void> uploadVideoImage({
    String? message,
    required String reciverId,
  }) async {
    emit(UploadChatImageLoadingState());
    storage
        .ref()
        .child('chat/${Uri.file(chatVideo!.path).pathSegments.last}')
        .putFile(chatVideo!)
        .then((value) {
      value.ref.getDownloadURL().then((value) async {
        chatVideoUrl = value;
        emit(UploadChatImageSuccessState());
        log(chatVideoUrl ?? '');
        addMessage(
          reciverId: reciverId,
          date: DateTime.now().toString(),
          image: chatVideoUrl,
          message: message,
        );
      }).catchError((error) {
        log(error.toString());
        emit(UploadChatImageFailureState());
      });
    }).catchError((error) {
      log(error.toString());
      emit(UploadChatImageFailureState());
    });
  }

  //void getMessages({required String receiverId}) {}

  //void deleteMessage({required String messageId}) {}

  //void updateMessage({required String messageId}) {}

  //void deleteChat({required String chatId}) {}

  //void updateChat({required String chatId}) {}
}
