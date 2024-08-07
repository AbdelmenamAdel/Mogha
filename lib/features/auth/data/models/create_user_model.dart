class UserModel {
  String email;
  String userName;
  String password;
  String uId;
  bool isEmailVerified;
  String profilePhoto;
  String bio;
  String phone;
  String coverPhoto;
  // List<StoryModel> story;
  UserModel({
    // required this.story,
    required this.phone,
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
      'phone': phone,
      'coverPhoto': coverPhoto,
      'bio': bio,
      'profilePhoto': profilePhoto,
      'email': email,
      'userName': userName,
      'password': password,
      'uId': uId,
      'isEmailVerified': isEmailVerified,
      // 'story': story
    };
  }

  factory UserModel.fromJson(json) {
    return UserModel(
      email: json['email'],
      userName: json['userName'],
      password: json['password'],
      profilePhoto: json['profilePhoto'],
      uId: json['uId'],
      bio: json['bio'],
      phone: json['phone'],
      // story: json['story'],
      coverPhoto: json['coverPhoto'],
      isEmailVerified: json['isEmailVerified'],
    );
  }
}
