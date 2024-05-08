import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moga/features/chats/data/firebase/chat_repo.dart';
import 'package:moga/features/chats/data/models/message_model.dart';

class ChatRepoImplementation implements ChatRepository {
  FirebaseFirestore instance = FirebaseFirestore.instance;

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getAllUsers() async {
    return instance.collection('users').get();
  }

  @override
  Future<void> addMessage({
    required MessageModel model,
  }) async {
    //! to put the message in current user data
    await instance
        .collection('users')
        .doc(model.senderId)
        .collection('chats')
        .doc(model.reciverId)
        .collection('messages')
        .add(model.toMap());
    //! to put the same message in reciver user data
    await instance
        .collection('users')
        .doc(model.reciverId)
        .collection('chats')
        .doc(model.senderId)
        .collection('messages')
        .add(model.toMap());
    ;
  }
}
