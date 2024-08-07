// ignore_for_file: public_member_api_docs, sort_constructors_first
class MessageModel {
  String? message;
  String? image;
  String? video;
  String senderId;
  String reciverId;
  String date;
  MessageModel({
    this.message,
    this.image,
    this.video,
    required this.senderId,
    required this.reciverId,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'image': image,
      'video': video,
      'senderId': senderId,
      'reciverId': reciverId,
      'date': date,
    };
  }

  factory MessageModel.fromJson(jsonData) {
    return MessageModel(
      message: jsonData['message'],
      image: jsonData['image'],
      senderId: jsonData['senderId'],
      reciverId: jsonData['reciverId'],
      date: jsonData['date'],
      video: jsonData['video'],
    );
  }
}
