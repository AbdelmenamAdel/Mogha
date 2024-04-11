abstract class SocialStates {}

class SocialInitState extends SocialStates {}

class SocialGetUsersLoadingState extends SocialStates {}

class SocialGetUserSuccessState extends SocialStates {}

class SocialGetUserFailureState extends SocialStates {
  final String errMessage;

  SocialGetUserFailureState(this.errMessage);
}
