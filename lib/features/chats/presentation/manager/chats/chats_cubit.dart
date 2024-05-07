import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moga/core/services/service_locator.dart';
import 'package:moga/features/auth/data/models/create_user_model.dart';
import 'package:moga/features/chats/data/firebase/chat_repo_impl.dart';
import 'package:moga/features/chats/presentation/manager/chats/chats_states.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';

class ChatsCubit extends Cubit<ChatsStates> {
  ChatsCubit(this.chatRepo) : super(ChatInitial());
  static ChatsCubit get(context) => BlocProvider.of(context);
  ChatRepoImplementation chatRepo;
  List<UserModel> users = [];
  UserModel currentUser = sl<SocialCubit>().model!;

  void getAllUsers() {
    try {
      chatRepo.getAllUsers().then((value) {
        emit(ChatGetAllUsersLoadingState());
        if (value.docs.length != users.length) {
          users = [];
          value.docs.forEach((element) {
            if (element.data()['uId'] != currentUser.uId)
              users.add(UserModel.fromJson(element.data()));
          });
        }
      });
      emit(ChatGetAllUsersSuccessState());
    } catch (e) {
      emit(ChatGetAllUsersFailureState());
    }
  }

  void addMessage({required String message, required String receiverId}) {}

  //void getMessages({required String receiverId}) {}

  //void deleteMessage({required String messageId}) {}

  //void updateMessage({required String messageId}) {}

  //void deleteChat({required String chatId}) {}

  //void updateChat({required String chatId}) {}
}
