import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moga/features/chats/data/firebase/chat_repo.dart';

class ChatRepoImplementation implements ChatRepository {
  FirebaseFirestore instance = FirebaseFirestore.instance;

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getAllUsers() async {
    return instance.collection('users').get();
  }
}
