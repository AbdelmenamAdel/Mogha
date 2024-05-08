import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:moga/core/local/app_local.dart';
import 'package:moga/core/routes/app_routes.dart';
import 'package:moga/core/utils/app_images.dart';
import 'package:moga/core/utils/app_strings.dart';
import 'package:moga/core/common/custom_navigate.dart';
import 'package:moga/core/widgets/custom_text_form_field.dart';
import 'package:rive/rive.dart';

import 'custom_sign_button.dart';
import 'my_behavior.dart';

class SendCodeViewBody extends StatelessWidget {
  const SendCodeViewBody({super.key, required this.scale});

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
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Text(
                              'Enter Your E-mail and we will send you code to reset your password',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                          CustomTextFormField(
                              icon: Icons.email_outlined,
                              hintText: Strings.email.tr(context),
                              type: TextInputType.emailAddress),
                        ],
                      ),
                    ),
                    CustomSignButton(
                      scale: scale,
                      text: 'Send code',
                      onTap: () {
                        HapticFeedback.lightImpact();
                        Fluttertoast.showToast(
                          msg: 'SIGN-IN button pressed',
                        );
                        context.navigate(AppRoutes.newPassword, context);
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
