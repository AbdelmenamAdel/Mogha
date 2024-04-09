import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moga/core/local/app_local.dart';
import 'package:moga/core/routes/app_routes.dart';
import 'package:moga/core/utils/app_images.dart';
import 'package:moga/core/utils/app_strings.dart';
import 'package:moga/core/widgets/custom_navigate.dart';
import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../../core/services/service_locator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() async {
    bool isVisted =
        await sl<CacheHelper>().getData(key: Strings.onBoardingKey) ?? false;
    bool emailVerified = await FirebaseAuth.instance.currentUser?.emailVerified??false;
    print( FirebaseAuth.instance.currentUser);
    Future.delayed(
      const Duration(seconds: 2),
      () => emailVerified
          ? context.navigate(AppRoutes.home, context)
          : isVisted
              ? context.navigate(AppRoutes.chageLang, context)
              : context.navigate(AppRoutes.onBoarding, context),
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
