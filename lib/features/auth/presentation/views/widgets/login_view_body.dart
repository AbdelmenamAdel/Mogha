import 'dart:ui';
import 'package:achievement_view/achievement_view.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:moga/core/local/app_local.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/core/utils/app_images.dart';
import 'package:moga/core/utils/app_strings.dart';
import 'package:moga/core/widgets/custom_text_form_field.dart';
import 'package:moga/features/auth/presentation/views/manager/auth/auth_cubit.dart';
import 'package:rive/rive.dart';
import 'custom_row.dart';
import 'custom_sign_button.dart';
import 'my_behavior.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key, this.scale = 20});

  final double scale;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    AuthCubit cubit = BlocProvider.of<AuthCubit>(context);

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          AchievementView(
            title: "Please,",
            subTitle: "Enter a valid email and password",
            isCircle: false,
            color: AppColors.blueGrey,
          ).show(context);
        }
        if (state is LoginLoadingState) {}
        if (state is LoginSuccessState) {
          AchievementView(
                  title: "check",
                  subTitle: "your email verification link",
                  isCircle: false,
                  color: AppColors.blueGrey)
              .show(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: Stack(
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
              ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: _height,
                    child: Form(
                      key: cubit.loginformkey,
                      child: Column(
                        children: [
                          Expanded(child: SizedBox()),
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(),
                                Text(
                                  Strings.signIn.tr(context) +
                                      " " +
                                      Strings.mogha.tr(context),
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                const SizedBox(),
                                CustomTextFormField(
                                  icon: Icons.email_outlined,
                                  hintText: Strings.email.tr(context),
                                  type: TextInputType.emailAddress,
                                  controller: cubit.emailController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  'please fill all fields')));
                                      return '';
                                    }
                                    return null;
                                  },
                                ),
                                CustomTextFormField(
                                  controller: cubit.passwordController,
                                  isPassword: cubit.isPassword,
                                  s_icon: cubit.secure,
                                  onPressed: () {
                                    CupertinoAlertDialog(
                                      title: Text('verify your email address'),
                                      content: TextButton(
                                        onPressed: () {},
                                        child: Text('resend verification link'),
                                      ),
                                    );
                                    cubit.togglePassword();
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  'please fill all fields')));
                                      return '';
                                    }
                                    return null;
                                  },
                                  icon: Icons.lock_outline,
                                  hintText: Strings.password.tr(context),
                                ),
                                const CustomRow(),
                              ],
                            ),
                          ),
                          CustomSignButton(
                            scale: scale,
                            text: Strings.signIn.tr(context),
                            onTap: () {
                              if (cubit.loginformkey.currentState!.validate()) {
                                HapticFeedback.lightImpact();
                                Fluttertoast.showToast(
                                    msg: 'SIGN-IN button pressed');
                                cubit.login(
                                  email: cubit.emailController.text,
                                  password: cubit.passwordController.text,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
