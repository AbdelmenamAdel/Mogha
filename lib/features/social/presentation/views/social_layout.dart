import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hidable/hidable.dart';
import 'package:moga/core/services/service_locator.dart';
import 'package:moga/core/utils/custom_gnav_bar.dart';
import 'package:moga/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_states.dart';

class SocialLayoutView extends StatelessWidget {
  const SocialLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (BuildContext context, state) {  },

      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: Hidable(
            controller: scrollController,
            child: CustomAppBar(),
          ),
          bottomNavigationBar: CustomGNavBar(currentIndex: 0, tabs: [
            GButton(icon: IconBroken.Home, text: 'home'),
            GButton(icon: IconBroken.Search, text: 'search'),
            GButton(icon: IconBroken.AddUser, text: 'add'),
            GButton(icon: IconBroken.Setting, text: 'settings'),
          ]),
        );
      },
    );
  }
}
