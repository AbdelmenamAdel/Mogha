import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:moga/core/common/custom_navigate.dart';
import 'package:moga/core/local/app_local.dart';
import 'package:moga/core/routes/app_routes.dart';
import 'package:moga/core/services/service_locator.dart';
import 'package:moga/core/utils/app_strings.dart';
import 'package:moga/features/auth/presentation/manager/auth/auth_cubit.dart';
import 'package:moga/features/settings/presentation/views/settings_view.dart';
import '../../minor_views/widgets/change_lang_sheet.dart';
import 'log_out_dialog.dart';
import 'repeated_card.dart';

class RepeatedCards extends StatelessWidget {
  const RepeatedCards({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RepeatedCard(
          prefix: BoxIcons.bxl_gmail,
          title: Strings.emailInSettins.tr(context) + '$email',
          suffix: Icons.email,
        ),
        RepeatedCard(
          prefix: IconBroken.User,
          title: Strings.friends.tr(context),
          onTap: () {
            context.navigate(AppRoutes.friends, context);
          },
        ),
        RepeatedCard(
          prefix: Icons.language_sharp,
          title: Strings.changeLanguage.tr(context),
          onTap: () {
            showModalBottomSheet(
              elevation: 5,
              context: context,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              builder: (context) => ChangeLanguageSheet(),
            );
            // context.navigate(AppRoutes.changeLanguage, context);
          },
        ),
        ProfileHeaderLabel(headerLabel: Strings.accountSettings.tr(context)),
        RepeatedCard(
          prefix: IconBroken.Edit_Square,
          title: Strings.editProfile.tr(context),
          onTap: () {
            context.navigate(AppRoutes.editProfile, context);
          },
        ),
        RepeatedCard(
          prefix: BoxIcons.bx_lock,
          title: Strings.changePassword.tr(context),
          onTap: () {
            context.navigate(AppRoutes.changePass, context);
          },
        ),
        RepeatedCard(
          prefix: BoxIcons.bx_paperclip,
          title: Strings.about.tr(context),
          onTap: () {
            context.navigate(AppRoutes.about, context);
          },
        ),
        RepeatedCard(
          prefix: IconBroken.Logout,
          title: Strings.logout.tr(context),
          onTap: () {
            showAdaptiveDialog(
              context: context,
              builder: (context) {
                return CustomDialog(
                  title: Strings.confirmLogOut.tr(context),
                  onYesTap: () {
                    sl<AuthCubit>().logOut();
                    GoRouter.of(context).pushReplacement(AppRoutes.login);
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }
}
