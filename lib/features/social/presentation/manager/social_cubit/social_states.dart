abstract class SocialStates {}

class SocialInitState extends SocialStates {}

class SocialGetUsersLoadingState extends SocialStates {}

class SocialGetUserSuccessState extends SocialStates {}

class SocialGetUserFailureState extends SocialStates {
  final String errMessage;

  SocialGetUserFailureState(this.errMessage);
}

class SocialChangeBottomNavState extends SocialStates {}

class SocialProfileImagePickedSuccessState extends SocialStates {}

class SocialProfileImagePickedFailureState extends SocialStates {}

class SocialCoverImagePickedSuccessState extends SocialStates {}

class SocialCoverImagePickedFailureState extends SocialStates {}

class SocialUploadCoverImageSuccessState extends SocialStates {}

class SocialUploadCoverImageFailureState extends SocialStates {}

class SocialUploadProfileImageSuccessState extends SocialStates {}

class SocialUploadProfileImageFailureState extends SocialStates {}

class SocialUploadPostImageSuccessState extends SocialStates {}

class SocialUploadPostImageFailureState extends SocialStates {}

class SocialCreatePostSuccessState extends SocialStates {}

class SocialCreatePostFailureState extends SocialStates {}

class SocialGetPostsSuccessState extends SocialStates {}

class SocialGetPostsFailureState extends SocialStates {}

class SocialUserUpdateFailureState extends SocialStates {}
