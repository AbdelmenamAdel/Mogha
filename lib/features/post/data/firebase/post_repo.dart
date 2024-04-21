import 'package:moga/features/post/data/model/post_model.dart';
abstract class PostRepository{
  Future<void> addPost();
  Future<void> addPhoto();
  Future<void> removePhoto();
  Future<void> uploadPhoto();
  Future<List<PostModel>> getPosts();
}