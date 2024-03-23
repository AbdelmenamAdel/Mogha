import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moga/core/local/app_local.dart';
import 'package:moga/core/routes/app_routes.dart';
import 'package:moga/core/utils/app_strings.dart';
import 'package:moga/core/widgets/custom_navigate.dart';
import 'package:moga/core/widgets/custom_rich_text.dart';
import 'package:moga/core/widgets/custom_toast.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 42),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomRichText(
            text: Strings.forgetPass.tr(context),
            onTap: () {
              HapticFeedback.lightImpact();
              showToast(message: 'clicked');
              context.navigate(AppRoutes.sendCode, context);
            },
          ),
          const Spacer(),
          CustomRichText(
            text: Strings.cNA.tr(context),
            onTap: () {
              context.navigate(AppRoutes.signUp,context);
              HapticFeedback.lightImpact();
              showToast(message: 'clicked');
            },
          ),
        ],
      ),
    );
  }
}
