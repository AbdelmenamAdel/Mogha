import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:moga/core/utils/custom_gnav_bar.dart';
import 'custom_app_bar.dart';
import 'posts_list_view.dart';
import 'story_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CustomAppBar(),
                  StoryListView(),
                ],
              ),
            ),

            // SliverFillRemaining(
            //   child: const PostsListView(),
            // ),
            SliverToBoxAdapter(
              child: CustomGNavBar(currentIndex: 0, tabs: [
                GButton(icon: Icons.home, text: 'home'),
                GButton(icon: Icons.search, text: 'search'),
                GButton(icon: Icons.add, text: 'add'),
                GButton(icon: Icons.settings, text: 'settings'),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
