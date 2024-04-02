import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moga/core/bloc/global_cubit/app_language_cubit.dart';
import 'package:moga/core/bloc/global_cubit/app_language_states.dart';
import 'package:moga/core/local/app_local.dart';
import 'package:moga/core/routes/app_routes.dart';
import 'package:moga/core/services/service_locator.dart';
import 'package:moga/core/theme/app_theme.dart';

class Mogha extends StatelessWidget {
  const Mogha({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return BlocProvider(
          create: (context) => sl<GlobalCubit>()..updateLangage(),
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
              debugShowCheckedModeBanner: false,
              routerConfig: AppRouter.route,
              theme: getAppDarkTheme(),
            ),
          ),
        );
      },
    );
  }
}
