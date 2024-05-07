import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moga/features/chats/data/models/message_model.dart';

abstract class ChatRepository {
  Future<QuerySnapshot<Map<String, dynamic>>> getAllUsers();
  Future<void> addMessage({required MessageModel model});
}
