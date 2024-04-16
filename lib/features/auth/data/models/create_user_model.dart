import 'package:image_picker/image_picker.dart';

class UserModel {
  String email;
  String userName;
  String password;
  String uId;
  bool isEmailVerified;
  String profilePhoto;
  String bio;
  String coverPhoto;

  UserModel({
    required this.email,
    required this.userName,
    required this.password,
    required this.uId,
    required this.bio,
    required this.coverPhoto,
    required this.profilePhoto,
    required this.isEmailVerified,
  });

  Map<String, dynamic> toMap() {
    return {
      'coverPhoto':coverPhoto,
      'bio':bio,
      'profilePhoto': profilePhoto,
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
      profilePhoto: json['profilePhoto'],
      uId: json['uId'],
      bio: json['bio'],
      coverPhoto: json['coverPhoto'],
      isEmailVerified: json['isEmailVerified'],
    );
  }
}
