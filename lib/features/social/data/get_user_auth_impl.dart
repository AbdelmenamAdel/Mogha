import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moga/core/database/cache/cache_helper.dart';
import 'package:moga/core/services/service_locator.dart';
import 'package:moga/features/auth/data/models/create_user_model.dart';
import 'package:moga/features/social/data/get_user_authorization.dart';

class GetUserImplementation implements GetUserAuth {
  FirebaseFirestore _auth = FirebaseFirestore.instance;
  late UserModel model;

  @override
  Future<UserModel?> getUserData() async {
    try {
      String uId = sl<CacheHelper>().getData(key: 'uId');
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
        .orderBy('date', descending: false)
        .get();
  }
}
