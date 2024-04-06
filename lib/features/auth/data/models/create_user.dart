class UserModel {
  String email;
  String userName;
  String password;
  String uId;
  UserModel({
    required this.email,
    required this.userName,
    required this.password,
    required this.uId,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'userName': userName,
      'password': password,
      'uId': uId,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      userName: json['userName'],
      password: json['password'],
      uId: json['uId'],
    );
  }
}
