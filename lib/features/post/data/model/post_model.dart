class PostModel {
  String name;
  String uId;
  String? postImage;
  String image;
  String text;
  DateTime date;

  PostModel({
    this.postImage,
    required this.image,
    required this.date,
    required this.name,
    required this.text,
    required this.uId,
  });

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'date': date,
      'postImage': postImage,
      'text': text,
      'uId': uId,
    };
  }

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      date: json['date'],
      name: json['name'],
      postImage: json['postImage'],
      image: json['image'],
      uId: json['uId'],
      text: json['text'],
    );
  }
}
