import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidable/hidable.dart';
import 'package:moga/core/bloc/global_cubit/app_language_cubit.dart';
import 'package:moga/core/bloc/global_cubit/app_language_states.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/core/widgets/custom_divider.dart';
import 'package:moga/features/auth/data/models/create_user_model.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';
import 'widgets/auther_media.dart';
import 'widgets/profile_data_section.dart';
import 'widgets/repeated_cards.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel model = SocialCubit.get(context).model!;
    final ScrollController scrollController = ScrollController();
    return SafeArea(
      child: BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: appBar(context, scrollController),
            body: Padding(
              padding: const EdgeInsets.all(5.0),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    ProfileDataInSection(),
                    SizedBox(height: 10),
                    ProfileHeaderLabel(headerLabel: 'Account Info'),
                    RepeatedCards(
                      email: model.email,
                    ),
                    AuthorMedia(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  PreferredSizeWidget? appBar(context, scrollController) {
    var globalCubit = GlobalCubit.get(context);
    return Hidable(
      controller: scrollController,
      child: AppBar(
        leading: Text(''),
        elevation: 1,
        shadowColor: AppColors.grey,
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
    );
  }
}

class ProfileHeaderLabel extends StatelessWidget {
  final String headerLabel;

  const ProfileHeaderLabel({super.key, required this.headerLabel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 35.h, width: 85.w, child: CustomDivider()),
          Text(
            headerLabel,
            style: TextStyle(
              fontFamily: 'Dosis',
              // color: textColor,
              fontSize: 23.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 35.h,
            width: 85.w,
            child: CustomDivider(),
          ),
        ],
      ),
    );
  }
}
