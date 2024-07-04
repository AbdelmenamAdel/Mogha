import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:flutter_regex/flutter_regex.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:moga/core/common/custom_notifier.dart';
import 'package:moga/core/local/app_local.dart';
import 'package:moga/core/services/service_locator.dart';
import 'package:moga/core/utils/app_strings.dart';
import 'package:moga/core/widgets/common_button.dart';
import 'package:moga/core/widgets/custom_text_f_field.dart';
import 'package:moga/features/auth/presentation/manager/auth/auth_cubit.dart';
import 'package:moga/features/post/presentation/views/widgets/default_app_bar.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  final TextEditingController oldPasswordController = TextEditingController();

  final TextEditingController newPasswordController = TextEditingController();
  bool checkOldPasswordValidation = true;

  @override
  void dispose() {
    newPasswordController.dispose();
    oldPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: scaffoldKey,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: AnimationLimiter(
              child: Column(
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 200),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 50,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                    DefaultAppBar(
                      elevation: 1,
                      title: Strings.changePassword.tr(context),
                      centerTitle: true,
                      style: TextStyle(
                        fontSize: 24,
                        letterSpacing: 1.5,
                        fontFamily: 'Dosis',
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      Strings.toChangePassDo.tr(context),
                      style: TextStyle(
                        fontFamily: 'Dosis',
                        fontSize: 18.sp,
                        letterSpacing: 1.sp,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 25.h),
                    Padding(
                      padding: const EdgeInsets.all(8.0).r,
                      child: CustomTextField(
                        bsc: Theme.of(context).textTheme.displaySmall!.color,
                        focus: true,
                        hintText: Strings.enterCurrentPassword.tr(context),
                        labelText: Strings.oldPassword.tr(context),
                        validator: (value) {
                          // if (!value!.isPasswordNormal1()) {
                          //   return 'Enter a valid password';
                          // }
                          return null;
                        },
                        checkOldPasswordValidation: checkOldPasswordValidation,
                        controller: oldPasswordController,
                        suffix: Icon(Icons.password_outlined),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0).r,
                      child: CustomTextField(
                        bsc: Theme.of(context).textTheme.displaySmall!.color,
                        focus: true,
                        hintText: Strings.enterNewPassword.tr(context),
                        labelText: Strings.newPassword.tr(context),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password mustn\'t be empty';
                          } else if (!value.isPasswordNormal1()) {
                            return 'Enter a strong password';
                          }
                          return null;
                        },
                        controller: newPasswordController,
                        suffix: Icon(Icons.password_outlined),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0).r,
                      child: CustomTextField(
                        bsc: Theme.of(context).textTheme.displaySmall!.color,
                        focus: true,
                        hintText: Strings.enterConfirmPassword.tr(context),
                        labelText: Strings.confirmPassword.tr(context),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password mustn\'t be empty';
                          } else if (value != newPasswordController.text) {
                            return 'Password not matching';
                          }
                          return null;
                        },
                        suffix: Icon(Icons.password_outlined),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Padding(
                      padding: const EdgeInsets.all(10).r,
                      child: FlutterPwValidator(
                        controller: newPasswordController,
                        minLength: 8,
                        uppercaseCharCount: 1,
                        numericCharCount: 2,
                        specialCharCount: 1,
                        width: 350.w,
                        height: 140.h,
                        onSuccess: () {},
                        onFail: () {},
                      ),
                    ),
                    SizedBox(height: 60.h),
                    Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: CommonButton(
                        borderRadius: 9.r,
                        title: Strings.saveChanges.tr(context),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            _validationMethod();
                          }
                        },
                        width: 0.6,
                        height: 34,
                        borderColor:
                            Theme.of(context).textTheme.displaySmall!.color!,
                        textColor:
                            Theme.of(context).textTheme.displaySmall!.color!,
                        fillColor: Theme.of(context).scaffoldBackgroundColor,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _validationMethod() async {
    checkOldPasswordValidation = await sl<AuthCubit>().checkOldPassword(
      sl<SocialCubit>().model!.email,
      oldPasswordController.text,
    );
    setState(() {});
    checkOldPasswordValidation == true
        ? await sl<AuthCubit>()
            .updateUserPassword(
            newPasswordController.text.trim(),
          )
            .whenComplete(() async {
            await sl<AuthCubit>()
                .runTransactionPassword(newPasswordController.text.trim());
            formKey.currentState!.reset();
            newPasswordController.clear();
            oldPasswordController.clear();
            showAchievementView(
              context: context,
              title: 'your password has been updated',
            );
            Future.delayed(
              const Duration(
                milliseconds: 1500,
              ),
            ).whenComplete(
              () {
                GoRouter.of(context).pop();
              },
            );
          })
        : (oldPasswordController.text.isNotEmpty &&
                oldPasswordController.text.length > 7)
            ? showAchievementView(
                context: context,
                title: 'Please,',
                subTitle: 'check from your correct password')
            : null;
  }
}
