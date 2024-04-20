import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:moga/core/utils/custom_gnav_bar.dart';
import 'package:moga/features/chats/chat_view.dart';
import 'package:moga/features/home/presentation/views/home_view.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:moga/features/settings/presentation/views/settings_view.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_states.dart';
import 'package:moga/features/users/users_view.dart';

class SocialLayoutView extends StatelessWidget {
  const SocialLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        SocialCubit cubit = SocialCubit.get(context);
        List<Widget> screens = [
          HomeView(),
          ChatsView(),
          UsersView(),
          SettingsView(),
        ];
        return Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: SafeArea(
            child: Scaffold(
              body: screens[cubit.currentIndex],
              bottomNavigationBar: CustomGNavBar(
                  onTabChange: (index) {
                    cubit.changeBottomNav(index);
                  },
                  currentIndex: cubit.currentIndex,
                  tabs: [
                    GButton(icon: IconBroken.Home, text: 'Home'),
                    GButton(icon: IconBroken.Chat, text: 'Chats'),
                    GButton(icon: IconBroken.Location, text: 'Users'),
                    GButton(icon: IconBroken.Setting, text: 'Settings'),
                  ]),
            ),
          ),
        );
      },
    );
  }
}
