import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:moga/core/routes/app_routes.dart';
import 'package:moga/features/settings/presentation/views/settings.dart';
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
          onTap: () {},
        ),
        RepeatedCard(
          prefix: Icons.language_sharp,
          title: 'Change Language',
          onTap: () {},
        ),
        ProfileHeaderLabel(headerLabel: 'Account Settings'),
        RepeatedCard(
          prefix: IconBroken.Edit_Square,
          title: 'Edit Profile',
          onTap: () {
            GoRouter.of(context).push(AppRoutes.editProfile);
          },
        ),
        RepeatedCard(
          prefix: BoxIcons.bx_lock,
          title: 'Change Password',
          onTap: () {},
        ),
        RepeatedCard(
          prefix: BoxIcons.bx_paperclip,
          title: 'About',
          onTap: () {},
        ),
        RepeatedCard(
          prefix: IconBroken.Logout,
          title: 'Log Out',
          onTap: () {},
        ),
      ],
    );
  }
}
