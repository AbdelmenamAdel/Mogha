abstract class ChatsStates {}

final class ChatInitial extends ChatsStates {}

final class ChatGetAllUsersLoadingState extends ChatsStates {}

final class ChatGetAllUsersSuccessState extends ChatsStates {}

final class ChatGetAllUsersFailureState extends ChatsStates {}
