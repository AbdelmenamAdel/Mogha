import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moga/features/post/data/firebase/post_repo.dart';
import 'package:moga/features/post/data/model/post_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class PostRepoImplementation implements PostRepository {
  CollectionReference<Map<String, dynamic>> postsStore =
      FirebaseFirestore.instance.collection('posts');
  var storage = firebase_storage.FirebaseStorage.instance;
  File? postPhoto;
  String? postImageUrl;

  @override
  Future<void> uploadPhoto({
    required String name,
    required String uId,
    String? postImage,
    required String image,
    required String text,
    required DateTime date,
  }) async {
    await storage
        .ref()
        .child("posts/${Uri.file(postPhoto!.path).pathSegments.last}")
        .putFile(postPhoto!)
        .then((value) {
      value.ref.getDownloadURL().then((value) async {
        postImageUrl = value;
        log(postImageUrl ?? '');
        await createPost(
          name: name,
          uId: uId,
          image: image,
          text: text,
          date: date,
          postImage: postImageUrl,
        );
      });
    });
  }

  @override
  Future<void> createPost({
    String? postImage,
    required String name,
    required String uId,
    required String image,
    required String text,
    required DateTime date,
  }) async {
    PostModel postModel = PostModel(
      image: image,
      date: date,
      name: name,
      text: text,
      uId: uId,
      postImage: postImage,
    );
    await postsStore.add(postModel.toMap());
    await getPosts();
  }

  List<PostModel> posts = [];

  @override
  Future<List<PostModel>> getPosts() async {
    await postsStore.get().then((value) {
      value.docs.forEach((element) {
        posts.add(PostModel.fromJson(element.data()));
      });
    });
    return posts;
  }
}
