import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moga/core/bloc/global_cubit/app_language_cubit.dart';
import 'package:moga/core/bloc/global_cubit/app_language_states.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/features/auth/data/models/create_user_model.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';

import 'widgets/log_out.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var globalCubit = GlobalCubit.get(context);
    UserModel model = SocialCubit.get(context).model!;
    return SafeArea(
      child: BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: Text(''),
              titleSpacing: -40,
              title: Text(
                'Settings',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(letterSpacing: 2),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    globalCubit.changeTheme();
                  },
                  icon: Icon(globalCubit.status),
                  color: globalCubit.status == CupertinoIcons.sun_max_fill
                      ? Colors.yellowAccent
                      : AppColors.kPrimary,
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(model.profilePhoto),
                                  radius: 25,
                                ),
                                title: Text(
                                  model.userName,
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                                trailing: LogOutBottomBar()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Divider(
                              height: 0,
                              color: Theme.of(context).dividerColor,
                            ),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
