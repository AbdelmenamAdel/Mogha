import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'posts_list_view.dart';
import 'story_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:const CustomScrollView(
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
            SliverFillRemaining(
              child: const PostsListView(),
            ),
          ],
        ),
      ),
    );
  }
}
