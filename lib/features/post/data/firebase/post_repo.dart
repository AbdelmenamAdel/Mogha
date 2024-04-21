import 'package:moga/features/post/data/model/post_model.dart';

abstract class PostRepository {
  Future<void> createPost({
    required String name,
    required String uId,
    String? postImage,
    required String image,
    required String text,
    required DateTime date,
  });

  Future<void> uploadPhoto({
    required String name,
    required String uId,
    String? postImage,
    required String image,
    required String text,
    required DateTime date,
  });

  Future<List<PostModel>> getPosts();
}
