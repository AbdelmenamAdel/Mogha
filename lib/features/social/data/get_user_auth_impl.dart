import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moga/core/services/service_locator.dart';
import 'package:moga/features/auth/data/models/create_user_model.dart';
import 'package:moga/features/chats/data/models/story_model.dart';
import 'package:moga/features/social/data/get_user_authorization.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';

class GetUserImplementation implements GetUserAuth {
  FirebaseFirestore _auth = FirebaseFirestore.instance;
  late UserModel model;

  @override
  Future<UserModel?> getUserData() async {
    try {
      String uId = FirebaseAuth.instance.currentUser!.uid;
      var document = await _auth.collection('users').doc(uId).get();
      model = UserModel.fromJson(document.data()!);
      log('user data is ${model.toString()}');
      return model;
    } catch (e) {
      log('error while get user data');
      log(e.toString());
      return null;
    }
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getPosts() async {
    return await FirebaseFirestore.instance
        .collection('posts')
        .orderBy('date', descending: true)
        .get();
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getMyPosts(String uId) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('posts')
        .orderBy('date', descending: true)
        .get();
  }

  final instance = FirebaseFirestore.instance;
  @override
  Future<void> addStory({required StoryModel story}) async {
    //! to put the message in current user data
    await instance
        .collection('users')
        .doc(sl<SocialCubit>().model!.uId)
        .collection('story')
        .add(story.toMap());
  }
}
