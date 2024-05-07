abstract class ChatsStates {}

final class ChatInitial extends ChatsStates {}

final class ChatGetAllUsersLoadingState extends ChatsStates {}

final class ChatGetAllUsersSuccessState extends ChatsStates {}

final class ChatGetAllUsersFailureState extends ChatsStates {}

final class AddMessageLoadingState extends ChatsStates {}

final class AddMessageSuccessState extends ChatsStates {}

final class AddMessageFailureState extends ChatsStates {}
