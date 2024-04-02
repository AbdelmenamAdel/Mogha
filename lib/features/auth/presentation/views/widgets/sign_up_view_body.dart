import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moga/core/routes/app_routes.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/core/utils/app_images.dart';
import 'package:moga/core/utils/app_strings.dart';
import 'package:moga/core/widgets/custom_image_picker.dart';
import 'package:moga/core/widgets/custom_navigate.dart';
import 'package:moga/core/widgets/custom_pick_image.dart';
import 'package:moga/core/widgets/custom_profile_image.dart';
import 'package:moga/core/widgets/custom_text_form_field.dart';
import 'package:moga/core/local/app_local.dart';
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
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(),
                          CustomTextFormField(
                              icon: Icons.account_circle_outlined,
                              hintText: Strings.userName.tr(context)),
                          CustomTextFormField(
                              icon: Icons.email_outlined,
                              hintText: Strings.email.tr(context),
                              type: TextInputType.emailAddress),
                          CustomTextFormField(
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
                                  context.navigate(AppRoutes.login, context);
                                },
                                child: Text(
                                  Strings.signIn.tr(context),
                                  style: Theme.of(context).textTheme.labelSmall,
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
                        HapticFeedback.lightImpact();
                        Fluttertoast.showToast(
                          msg: 'SIGN-IN button pressed',
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
