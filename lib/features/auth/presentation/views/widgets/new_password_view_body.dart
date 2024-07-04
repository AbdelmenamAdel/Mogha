import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:moga/core/local/app_local.dart';
import 'package:moga/core/utils/app_images.dart';
import 'package:moga/core/utils/app_strings.dart';
import 'package:moga/core/widgets/custom_text_form_field.dart';
import 'package:rive/rive.dart';

import 'custom_sign_button.dart';
import 'my_behavior.dart';

class NewPasswordViewBody extends StatelessWidget {
  const NewPasswordViewBody({super.key, required this.scale});
  final double scale;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
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
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const CircleAvatar(
                            radius: 80,
                            backgroundImage: AssetImage(AppImages.appIcon),
                          ),
                          Text(
                            Strings.createNewPassword.tr(context),
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          const SizedBox(),
                          CustomTextFormField(
                            icon: Icons.password_rounded,
                            hintText: Strings.newPassword.tr(context),
                          ),
                          CustomTextFormField(
                            icon: Icons.password_rounded,
                            hintText: Strings.createNewPassword.tr(context),
                          ),
                          CustomTextFormField(
                              icon: Icons.numbers_outlined,
                              hintText: Strings.verificationCode.tr(context),
                              type: TextInputType.number),
                        ],
                      ),
                    ),
                    CustomSignButton(
                      scale: scale,
                      text: Strings.verify.tr(context),
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
