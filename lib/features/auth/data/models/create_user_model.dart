import 'package:image_picker/image_picker.dart';

class UserModel {
  String email;
  String userName;
  String password;
  String uId;
  bool isEmailVerified;
  XFile? profilePhoto;

  UserModel({
    this.profilePhoto,
    required this.email,
    required this.userName,
    required this.password,
    required this.uId,
    required this.isEmailVerified,
  });

  Map<String, dynamic> toMap() {
    return {
      'profilePhoto':profilePhoto,
      'email': email,
      'userName': userName,
      'password': password,
      'uId': uId,
      'isEmailVerified': isEmailVerified,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      userName: json['userName'],
      password: json['password'],
      profilePhoto:json['profilePhoto'],
      uId: json['uId'],
      isEmailVerified: json['isEmailVerified'],
    );
  }
}
