import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:moga/core/utils/app_images.dart';
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
                            'Create new password',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          const SizedBox(),
                          const CustomTextFormField(
                            icon: Icons.password_rounded,
                            hintText: 'new password',
                          ),
                          const CustomTextFormField(
                            icon: Icons.password_rounded,
                            hintText: 'confirm new password',
                          ),
                          const CustomTextFormField(
                              icon: Icons.numbers_outlined,
                              hintText: 'verification code',
                              type: TextInputType.number),
                        ],
                      ),
                    ),
                    CustomSignButton(
                      scale: scale,
                      text: 'verify',
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
