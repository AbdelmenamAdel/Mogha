import 'package:moga/features/auth/data/models/create_user_model.dart';

abstract class GetUserAuth{
  Future<UserModel?> getUserData();
}