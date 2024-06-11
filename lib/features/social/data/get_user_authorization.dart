import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moga/features/auth/data/models/create_user_model.dart';
import 'package:moga/features/chats/data/models/story_model.dart';

abstract class GetUserAuth {
  Future<UserModel?> getUserData();
  Future<void> addStory({required StoryModel story});
  Future<QuerySnapshot<Map<String, dynamic>>> getPosts();
  Future<QuerySnapshot<Map<String, dynamic>>> getMyPosts(String uId);
}
