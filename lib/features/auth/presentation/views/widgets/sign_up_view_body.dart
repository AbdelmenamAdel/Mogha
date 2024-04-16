import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_regex/flutter_regex.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/core/utils/app_images.dart';
import 'package:moga/core/utils/app_strings.dart';
import 'package:moga/core/widgets/custom_notifier.dart';
import 'package:moga/core/widgets/custom_profile_image.dart';
import 'package:moga/core/widgets/custom_text_form_field.dart';
import 'package:moga/core/local/app_local.dart';
import 'package:moga/features/auth/presentation/manager/auth/auth_cubit.dart';
import 'package:rive/rive.dart';
import 'custom_sign_button.dart';
import 'my_behavior.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key, this.scale = 20});

  final double scale;

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    AuthCubit cubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          GoRouter.of(context).pop();
          cubit.userNameController.clear();
          cubit.emailController.clear();
          cubit.passwordController.clear();
        }
        if (state is RegisterErrorState) {
          showAchievementView(
            context: context,
            title: 'Firebase!',
            subTitle: state.errMessage,
          );
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
                    height: height,
                    child: Form(
                      key: cubit.signUpFormKey,
                      child: Column(
                        children: [
                          const Expanded(child: SizedBox()),
                          CustomImageProfile(),
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '${Strings.signUp.tr(context)} ${Strings.mogha.tr(context)}',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                const SizedBox(),
                                CustomTextFormField(
                                    validator: (value) {
                                      if (!value!.isUsername()) {
                                        showAchievementView(
                                          context: context,
                                          title: "Please,",
                                          subTitle: "Enter a valid name",
                                        );
                                        return null;
                                      }
                                      return null;
                                    },
                                    controller: cubit.userNameController,
                                    icon: Icons.account_circle_outlined,
                                    hintText: Strings.userName.tr(context)),
                                CustomTextFormField(
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
                                    controller: cubit.emailController,
                                    icon: Icons.email_outlined,
                                    hintText: Strings.email.tr(context),
                                    type: TextInputType.emailAddress),
                                CustomTextFormField(
                                  isPassword: cubit.isPassword,
                                  s_icon: cubit.secure,
                                  onPressed: () {
                                    cubit.togglePassword();
                                  },
                                  validator: (value) {
                                    if (!value!.isPasswordHard()) {
                                      showAchievementView(
                                          context: context,
                                          title: "Please,",
                                          subTitle:
                                              """Enter a strong password including
                                          at least
                                          1 capital char
                                          1 special char
                                          1 number """);
                                      return null;
                                    }
                                    return null;
                                  },
                                  controller: cubit.passwordController,
                                  icon: Icons.lock_outline,
                                  hintText: Strings.password.tr(context),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Do you hava an account ?  ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .copyWith(fontSize: 14),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        GoRouter.of(context).pop();
                                      },
                                      child: Text(
                                        Strings.signIn.tr(context),
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          CustomSignButton(
                            scale: widget.scale,
                            text: Strings.signUp.tr(context),
                            onTap: () {
                              if (cubit.signUpFormKey.currentState!
                                  .validate()) {
                                cubit.register(
                                  email: cubit.emailController.text,
                                  password: cubit.passwordController.text,
                                  userName: cubit.userNameController.text,
                                );
                                HapticFeedback.lightImpact();
                                Fluttertoast.showToast(
                                  msg: 'SIGN-IN button pressed',
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
