import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moga/features/auth/data/models/create_user_model.dart';
import 'package:moga/features/social/data/get_user_auth_impl.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_states.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitState());

  static SocialCubit get(context) => BlocProvider.of(context);
  late UserModel? model;
  GetUserImplementation user = GetUserImplementation();

  List<String> titles = [
    'Home',
    'Chats',
    'Users',
    'settings',
  ];
  int currentIndex = 0;

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(SocialChangeBottomNavState());
  }

  Future<void> getUserData() async {
    emit(SocialGetUsersLoadingState());
    try {
      model = await user.getUserData();
      emit(SocialGetUserSuccessState());
    } catch (e) {
      emit(SocialGetUserFailureState(e.toString()));
    }
  }
}
