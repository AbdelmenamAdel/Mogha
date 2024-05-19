abstract class ChatsStates {}

final class ChatInitial extends ChatsStates {}

final class ChatGetAllUsersLoadingState extends ChatsStates {}

final class ChatGetAllUsersSuccessState extends ChatsStates {}

final class ChatGetAllUsersFailureState extends ChatsStates {}

final class AddMessageLoadingState extends ChatsStates {}

final class AddMessageSuccessState extends ChatsStates {}

final class AddMessageFailureState extends ChatsStates {}

final class SocialChatImagePickedSuccessState extends ChatsStates {}

final class SocialChatImagePickedFailureState extends ChatsStates {}

final class UploadChatImageFailureState extends ChatsStates {}

final class UploadChatImageSuccessState extends ChatsStates {}

final class UploadChatImageLoadingState extends ChatsStates {}

final class UploadChatVideoFailureState extends ChatsStates {}

final class UploadChatVideoSuccessState extends ChatsStates {}

final class UploadChatVideoLoadingState extends ChatsStates {}
