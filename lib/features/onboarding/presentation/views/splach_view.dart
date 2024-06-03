import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moga/core/common/custom_navigate.dart';
import 'package:moga/core/local/app_local.dart';
import 'package:moga/core/routes/app_routes.dart';
import 'package:moga/core/utils/app_images.dart';
import 'package:moga/core/utils/app_strings.dart';
import '../../../../../../../core/database/cache/cache_helper.dart';
import '../../../../../../../core/services/service_locator.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() async {
    bool isVisted =
        await sl<CacheHelper>().getData(key: Strings.onBoardingKey) ?? false;
    bool emailVerified =
        await FirebaseAuth.instance.currentUser?.emailVerified ?? false;
    print(FirebaseAuth.instance.currentUser);
    Future.delayed(
      const Duration(seconds: 2),
      () => emailVerified
          ? context.navigateReplace(AppRoutes.socialLayout, context)
          : isVisted
              ? context.navigateReplace(AppRoutes.changeLang, context)
              : context.navigateReplace(AppRoutes.onBoarding, context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 3, child: SizedBox()),
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage(AppImages.appIcon),
          ),
          Expanded(flex: 2, child: SizedBox()),
          Text(
            Strings.mogha.tr(context),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 50.h),
        ],
      )),
    );
  }
}
