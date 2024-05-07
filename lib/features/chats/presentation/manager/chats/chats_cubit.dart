import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moga/features/chats/presentation/manager/chats/chats_states.dart';

class ChatsCubit extends Cubit<ChatsStates> {
  ChatsCubit() : super(ChatInitial());
}
