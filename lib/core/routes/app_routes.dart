import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moga/features/auth/presentation/views/change_language_view.dart';
import 'package:moga/features/auth/presentation/views/create_new_password.dart';
import 'package:moga/features/auth/presentation/views/login_view.dart';
import 'package:moga/features/auth/presentation/views/manager/auth/auth_cubit.dart';
import 'package:moga/features/auth/presentation/views/send_code_view.dart';
import 'package:moga/features/auth/presentation/views/sign_up_view.dart';
import 'package:moga/features/home/presentation/views/home_view.dart';

import '../services/service_locator.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String chageLang = '/chageLang';
  static const String login = '/login';
  static const String sendCode = '/sendCode';
  static const String profileHome = '/profileHome';
  static const String settings = '/settings';
  static const String newPassword = '/newPassword';
  static const String signUp = '/signUp';
  static const String home = '/home';
}

abstract class AppRouter {
  static final route = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.initialRoute,
        builder: (context, state) => const HomeView(),
      ), GoRoute(
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
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: AppRoutes.chageLang,
        builder: (context, state) => const ChangeLangView(),
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
