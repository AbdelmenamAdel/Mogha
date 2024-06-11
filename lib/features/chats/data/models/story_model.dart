// ignore_for_file: public_member_api_docs, sort_constructors_first
class StoryModel {
  String? message;
  String? image;
  String? video;
  String date;
  StoryModel({
    this.message,
    this.image,
    this.video,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'image': image,
      'video': video,
      'date': date,
    };
  }

  factory StoryModel.fromJson(jsonData) {
    return StoryModel(
      message: jsonData['message'],
      image: jsonData['image'],
      date: jsonData['date'],
      video: jsonData['video'],
    );
  }
}
