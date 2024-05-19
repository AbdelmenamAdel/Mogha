import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:moga/core/bloc/global_cubit/app_language_cubit.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/features/post/presentation/views/widgets/default_app_bar.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';
import 'package:moga/features/social/presentation/views/widgets/custom_app_bar.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = GlobalCubit.get(context);
    return Scaffold(
      body: Column(
        children: [
          DefaultAppBar(
            title: 'Settings',
            actions: [
              IconButton(
                onPressed: () {
                  cubit.changeTheme();
                },
                icon: Icon(cubit.status),
                color: cubit.status == CupertinoIcons.sun_max_fill
                    ? Colors.yellowAccent
                    : AppColors.kPrimary,
              )
            ],
          ),
        ],
      ),
    );
  }
}
