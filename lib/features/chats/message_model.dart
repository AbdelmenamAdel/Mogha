class MessageModel {
  final String message;
  final String id;
  var date;

  MessageModel(this.message, this.id, this.date);

  factory MessageModel.fromjson(jsonData) {
    return MessageModel(
      jsonData['message'],
      jsonData['id'],
      jsonData['CreatedAt'],
    );
  }
}
