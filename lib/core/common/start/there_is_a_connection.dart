import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moga/core/bloc/global_cubit/app_language_cubit.dart';
import 'package:moga/core/bloc/global_cubit/app_language_states.dart';
import 'package:moga/core/common/connectivity.dart';
import 'package:moga/core/local/app_local.dart';
import 'package:moga/core/routes/app_routes.dart';
import 'package:moga/core/services/service_locator.dart';
import 'package:moga/core/theme/app_theme.dart';
import 'package:moga/features/chats/presentation/manager/chats/chats_cubit.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class ThereIsAConnectionStart extends StatelessWidget {
  const ThereIsAConnectionStart({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<GlobalCubit>()
            ..updateLangage()
            ..getTheme(),
        ),
        BlocProvider(
          create: (context) => sl<ChatsCubit>()..getAllUsers(),
        ),
        BlocProvider(
          create: (context) => sl<SocialCubit>()
            ..getUserData()
            ..getPosts(),
        ),
      ],
      child: BlocBuilder<GlobalCubit, GlobalState>(
        builder: (context, state) => MaterialApp.router(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', "US"),
            Locale('ar', "EG"),
          ],
          locale: Locale(
            BlocProvider.of<GlobalCubit>(context).langCode,
          ),
          builder: (context, widget) {
            return Builder(
              builder: (context) {
                ConnectivityController.instance.initialize();
                return widget!;
              },
            );
          },
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.route,
          theme: BlocProvider.of<GlobalCubit>(context).isDark
              ? getAppDarkTheme()
              : getAppLightTheme(),
        ),
      ),
    );
  }
}
