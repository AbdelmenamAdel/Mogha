import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moga/core/bloc/global_cubit/app_language_cubit.dart';
import 'package:moga/core/bloc/global_cubit/app_language_states.dart';
import 'package:moga/core/routes/app_routes.dart';
import 'package:moga/core/utils/app_images.dart';
import 'package:moga/core/widgets/custom_button.dart';
import 'package:moga/core/common/custom_navigate.dart';
import 'package:rive/rive.dart';

class ChangeLangView extends StatelessWidget {
  const ChangeLangView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const RiveAnimation.asset(
            AppImages.rivBackground,
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 2),
              child: const SizedBox(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(AppImages.appIcon),
                ),
                const SizedBox(),
                Text(
                  'Welcome to Mogha App',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 54.h),
                Text(
                  'Please choose your language ',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(
                  height: 120.h,
                ),
                BlocBuilder<GlobalCubit, GlobalState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        CustomButton(
                          onPressed: () {
                            BlocProvider.of<GlobalCubit>(context)
                                .changeLang('ar');
                            context.navigate(AppRoutes.login, context);
                          },
                          text: 'العربية',
                        ),
                        const Spacer(),
                        CustomButton(
                          onPressed: () {
                            BlocProvider.of<GlobalCubit>(context)
                                .changeLang('en');
                            context.navigate(AppRoutes.login, context);
                          },
                          text: 'English',
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
