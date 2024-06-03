import 'dart:ui';
import 'package:flutter_regex/flutter_regex.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:moga/core/bloc/global_cubit/app_language_cubit.dart';
import 'package:moga/core/bloc/global_cubit/app_language_states.dart';
import 'package:moga/core/local/app_local.dart';
import 'package:moga/core/routes/app_routes.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/core/utils/app_images.dart';
import 'package:moga/core/utils/app_strings.dart';
import 'package:moga/core/common/custom_navigate.dart';
import 'package:moga/core/common/custom_notifier.dart';
import 'package:moga/core/widgets/custom_text_form_field.dart';
import 'package:moga/features/auth/presentation/manager/auth/auth_cubit.dart';
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
          showAchievementView(
              context: context,
              title: "OOPS,There was an error",
              subTitle: state.errMessage);
        }
        if (state is LoginLoadingState) {}
        if (state is LoginSuccessState) {
          showAchievementView(
              context: context,
              title: "Hi There 👋,",
              subTitle: "Welcome in MOGHA");
          GoRouter.of(context).pushReplacement(AppRoutes.socialLayout);
          cubit.emailController.clear();
          cubit.passwordController.clear();
          cubit.userNameController.clear();
        }
        if (state is EmailVerifiedState) {
          context.navigate(AppRoutes.home, context);
        }
      },
      builder: (context, state) {
        return BlocBuilder<GlobalCubit, GlobalState>(
            builder: (context, snapshot) {
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
                        key: cubit.loginFormKey,
                        child: Column(
                          children: [
                            Expanded(child: SizedBox()),
                            Expanded(
                              flex: 4,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                      if (!value!.isEmail() &&
                                          (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                                  .hasMatch(value) ||
                                              !value.contains('@gmail.com'))) {
                                        showAchievementView(
                                          context: context,
                                          title: "Please,",
                                          subTitle: "Enter a valid email",
                                        );
                                        return null;
                                      }
                                      return null;
                                    },
                                  ),
                                  CustomTextFormField(
                                    controller: cubit.passwordController,
                                    isPassword: cubit.isPassword,
                                    s_icon: cubit.secure,
                                    onPressed: () {
                                      cubit.togglePassword();
                                    },
                                    validator: (value) {
                                      if (!value!.isPasswordNormal1()) {
                                        showAchievementView(
                                            context: context,
                                            title: "Please,",
                                            subTitle: "Enter a valid password");
                                        return null;
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
                                if (cubit.loginFormKey.currentState!
                                    .validate()) {
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
        });
      },
    );
  }
}
