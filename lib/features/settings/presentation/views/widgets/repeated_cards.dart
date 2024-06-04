import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:moga/core/common/custom_navigate.dart';
import 'package:moga/core/routes/app_routes.dart';
import 'package:moga/core/services/service_locator.dart';
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
          title: 'E-mail  :  $email',
          suffix: Icons.email,
        ),
        RepeatedCard(
          prefix: IconBroken.User,
          title: 'Friends',
          onTap: () {
            context.navigate(AppRoutes.friends, context);
          },
        ),
        RepeatedCard(
          prefix: Icons.language_sharp,
          title: 'Change Language',
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
        ProfileHeaderLabel(headerLabel: 'Account Settings'),
        RepeatedCard(
          prefix: IconBroken.Edit_Square,
          title: 'Edit Profile',
          onTap: () {
            context.navigate(AppRoutes.editProfile, context);
          },
        ),
        RepeatedCard(
          prefix: BoxIcons.bx_lock,
          title: 'Change Password',
          onTap: () {
            context.navigate(AppRoutes.changePass, context);
          },
        ),
        RepeatedCard(
          prefix: BoxIcons.bx_paperclip,
          title: 'About',
          onTap: () {
            context.navigate(AppRoutes.about, context);
          },
        ),
        RepeatedCard(
          prefix: IconBroken.Logout,
          title: 'Log Out',
          onTap: () {
            showAdaptiveDialog(
              context: context,
              builder: (context) {
                return CustomDialog(
                  title: 'Confirm Log Out',
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
