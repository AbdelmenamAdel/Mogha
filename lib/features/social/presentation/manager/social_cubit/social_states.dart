abstract class SocialStates {}

class SocialInitState extends SocialStates {}

class SocialGetUserLoadingState extends SocialStates {}

class SocialGetUserSuccessState extends SocialStates {}

class SocialGetUserFailureState extends SocialStates {
  final String errMessage;

  SocialGetUserFailureState(this.errMessage);
}

class SocialGetAllUsersLoadingState extends SocialStates {}

class SocialGetAllUsersSuccessState extends SocialStates {}

class SocialGetAllUsersFailureState extends SocialStates {
  final String errMessage;

  SocialGetAllUsersFailureState(this.errMessage);
}

class SocialChangeBottomNavState extends SocialStates {}

class SocialProfileImagePickedSuccessState extends SocialStates {}

class SocialProfileImagePickedFailureState extends SocialStates {}

class SocialCoverImagePickedSuccessState extends SocialStates {}

class SocialCoverImagePickedFailureState extends SocialStates {}

class SocialUploadCoverImageSuccessState extends SocialStates {}

class SocialUploadCoverImageLoadingState extends SocialStates {}

class SocialUploadCoverImageFailureState extends SocialStates {}

class SocialUploadProfileImageSuccessState extends SocialStates {}

class SocialUploadProfileImageFailureState extends SocialStates {}

class SocialUploadProfileImageLoadingState extends SocialStates {}

class SocialUploadPostImageSuccessState extends SocialStates {}

class SocialUploadPostImageFailureState extends SocialStates {}

class SocialUploadPostImageLoadingState extends SocialStates {}

class SocialCreatePostSuccessState extends SocialStates {}

class SocialCreatePostFailureState extends SocialStates {}

class SocialCreatePostLoadingState extends SocialStates {}

class SocialPostImagePickedSuccessState extends SocialStates {}

class SocialPostImagePickedFailureState extends SocialStates {}

class SocialLikePostFailureState extends SocialStates {}

class SocialLikePostSuccessState extends SocialStates {}

class SocialGetLikedPostsSuccessState extends SocialStates {}

class SocialGetCommentsSuccessState extends SocialStates {}

class SocialCommentPostFailureState extends SocialStates {}

class SocialCommentPostSuccessState extends SocialStates {}

class SocialGetPostsSuccessState extends SocialStates {}

class SocialGetPostsFailureState extends SocialStates {}

class SocialUserUpdateFailureState extends SocialStates {}

class SocialFollowState extends SocialStates {}

class SocialUnFollowState extends SocialStates {}

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//!!!!!!! add story

class SocialAddStoryLoadingState extends SocialStates {}

class SocialAddStorySuccessState extends SocialStates {}

class SocialAddStoryFailureState extends SocialStates {}

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//!!!!!!! add image to story

class SocialAddStoryPickImageSuccessState extends SocialStates {}

class SocialAddStoryPickImageFailureState extends SocialStates {}

class SocialUploadStoryPickImageLoadingState extends SocialStates {}

class SocialUploadStoryPickImageSuccessState extends SocialStates {}

class SocialUploadStoryPickImageFailureState extends SocialStates {}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//!!!!!!! add image to story

class SocialAddStoryPickCameraSuccessState extends SocialStates {}

class SocialAddStoryPickCameraFailureState extends SocialStates {}

class SocialUploadStoryPickCameraLoadingState extends SocialStates {}

class SocialUploadStoryPickCameraSuccessState extends SocialStates {}

class SocialUploadStoryPickCameraFailureState extends SocialStates {}

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//!!!!!!! add video to story

class SocialAddStoryPickVodeoSuccessState extends SocialStates {}

class SocialAddStoryPickVodeoFailureState extends SocialStates {}

class SocialUploadStoryPickVodeoLoadingState extends SocialStates {}

class SocialUploadStoryPickVodeoSuccessState extends SocialStates {}

class SocialUploadStoryPickVodeoFailureState extends SocialStates {}
