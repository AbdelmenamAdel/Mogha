import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moga/features/auth/presentation/views/change_language_view.dart';
import 'package:moga/features/auth/presentation/views/create_new_password.dart';
import 'package:moga/features/auth/presentation/views/login_view.dart';
import 'package:moga/features/auth/presentation/manager/auth/auth_cubit.dart';
import 'package:moga/features/auth/presentation/views/send_code_view.dart';
import 'package:moga/features/auth/presentation/views/sign_up_view.dart';
import 'package:moga/features/home/presentation/views/home_view.dart';
import 'package:moga/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:moga/features/onboarding/presentation/views/splach_view.dart';
import 'package:moga/features/post/add_post.dart';
import 'package:moga/features/social/presentation/views/social_layout_view.dart';

import '../services/service_locator.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String chageLang = '/chageLang';
  static const String login = '/login';
  static const String onBoarding = '/onBoarding';
  static const String sendCode = '/sendCode';
  static const String settings = '/settings';
  static const String newPassword = '/newPassword';
  static const String signUp = '/signUp';
  static const String home = '/home';
  static const String newPost = '/newPost';
  static const String socialLayout = '/socialLayout';
}

abstract class AppRouter {
  static final route = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.initialRoute,
        builder: (context, state) => const SplashView(),
      ), GoRoute(
        path: AppRoutes.socialLayout,
        builder: (context, state) => const SocialLayoutView(),
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
        path: AppRoutes.chageLang,
        builder: (context, state) => const ChangeLangView(),
      ), GoRoute(
        path: AppRoutes.newPost,
        builder: (context, state) => const AddPostView(),
      ),
      GoRoute(
        path: AppRoutes.newPassword,
        builder: (context, state) => const NewPasswordView(),
      ),
      GoRoute(
        path: AppRoutes.sendCode,
        builder: (context, state) => const SendCodeView(),
      ),
    ],
  );
}
