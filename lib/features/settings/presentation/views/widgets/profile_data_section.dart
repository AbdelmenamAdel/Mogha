
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:moga/core/common/custom_navigate.dart';
import 'package:moga/core/routes/app_routes.dart';
import 'package:moga/core/widgets/custom_divider.dart';
import 'package:moga/features/auth/data/models/create_user_model.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';

import 'log_out.dart';

class ProfileDataInSection extends StatelessWidget {
  const ProfileDataInSection({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel model = SocialCubit.get(context).model!;
    return Card(
      elevation: 10,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                context.navigate(AppRoutes.profile,context);
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(model.profilePhoto),
                  radius: 25,
                ),
                title: Text(
                  model.userName,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                trailing: LogOutBottomBar(),
              ),
            ),
            CustomDivider(),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Icon(
                      IconBroken.Plus,
                      size: 28,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Create a new account ',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
