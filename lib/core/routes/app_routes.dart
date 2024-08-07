import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moga/core/image/open_cover_photo_view.dart';
import 'package:moga/core/image/open_profile_photo_view.dart';
import 'package:moga/features/auth/presentation/views/change_language_view.dart';
import 'package:moga/features/auth/presentation/views/create_new_password.dart';
import 'package:moga/features/auth/presentation/views/login_view.dart';
import 'package:moga/features/auth/presentation/manager/auth/auth_cubit.dart';
import 'package:moga/features/auth/presentation/views/send_code_view.dart';
import 'package:moga/features/auth/presentation/views/sign_up_view.dart';
import 'package:moga/features/chats/presentation/views/add_story_view.dart';
import 'package:moga/features/home/presentation/views/home_view.dart';
import 'package:moga/features/notifications/notifications_view.dart';
import 'package:moga/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:moga/features/onboarding/presentation/views/splach_view.dart';
import 'package:moga/features/post/presentation/views/add_post.dart';
import 'package:moga/features/search/search_view.dart';
import 'package:moga/features/settings/presentation/minor_views/change_password_view.dart';
import 'package:moga/features/settings/presentation/minor_views/friends_view.dart';
import 'package:moga/features/settings/presentation/views/edit_profile_view.dart';
import 'package:moga/features/settings/presentation/views/profile_view.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';
import 'package:moga/features/social/presentation/views/social_layout_view.dart';
import '../../features/settings/presentation/minor_views/about_view.dart';
import '../services/service_locator.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String changeLang = '/changeLang';
  static const String login = '/login';
  static const String addStory = '/addStory';
  static const String onBoarding = '/onBoarding';
  static const String sendCode = '/sendCode';
  static const String settings = '/settings';
  static const String newPassword = '/newPassword';
  static const String signUp = '/signUp';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String profilePhoto = '/profilePhoto';
  static const String coverPhoto = '/coverPhoto';
  static const String notification = '/notification';
  static const String search = '/search';
  static const String editProfile = '/editProfile';
  static const String newPost = '/newPost';
  static const String socialLayout = '/socialLayout';
  static const String friends = '/friends';
  static const String about = '/about';
  static const String changePass = '/changePass';
}

abstract class AppRouter {
  static final route = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.initialRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: AppRoutes.profile,
        builder: (context, state) =>
            ProfileView(userModel: SocialCubit.get(context).model!),
      ),
      GoRoute(
        path: AppRoutes.socialLayout,
        builder: (context, state) => const SocialLayoutView(),
      ),
      GoRoute(
        path: AppRoutes.addStory,
        builder: (context, state) => const AddStoryView(),
      ),
      GoRoute(
        path: AppRoutes.about,
        builder: (context, state) => const AboutView(),
      ),
      GoRoute(
        path: AppRoutes.changePass,
        builder: (context, state) => const ChangePasswordView(),
      ),
      GoRoute(
        path: AppRoutes.friends,
        builder: (context, state) => const FriendsView(),
      ),
      GoRoute(
        path: AppRoutes.editProfile,
        builder: (context, state) => const EditProfileView(),
      ),
      GoRoute(
        path: AppRoutes.onBoarding,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => BlocProvider(
          create: (context) => sl.get<AuthCubit>(),
          child: LoginView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.signUp,
        builder: (context, state) => BlocProvider(
          create: (context) => sl.get<AuthCubit>(),
          child: const SignUpView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.changeLang,
        builder: (context, state) => const ChangeLangView(),
      ),
      GoRoute(
        path: AppRoutes.newPost,
        builder: (context, state) => const AddPostView(),
      ),
      GoRoute(
        path: AppRoutes.profilePhoto,
        builder: (context, state) => const OpenProfilePhotoView(),
      ),
      GoRoute(
        path: AppRoutes.coverPhoto,
        builder: (context, state) => const OpenCoverPhotoView(),
      ),
      GoRoute(
        path: AppRoutes.newPassword,
        builder: (context, state) => const NewPasswordView(),
      ),
      GoRoute(
        path: AppRoutes.sendCode,
        builder: (context, state) => const SendCodeView(),
      ),
      GoRoute(
        path: AppRoutes.notification,
        builder: (context, state) => const NotificationsView(),
      ),
      GoRoute(
        path: AppRoutes.search,
        builder: (context, state) => const SearchViw(),
      ),
    ],
  );
}
