import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ChatRepository {
  Future<QuerySnapshot<Map<String, dynamic>>> getAllUsers();
}
