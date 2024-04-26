import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moga/features/auth/data/models/create_user_model.dart';

abstract class GetUserAuth{
  Future<UserModel?> getUserData();

  Future<QuerySnapshot<Map<String, dynamic>>> getPosts();
}