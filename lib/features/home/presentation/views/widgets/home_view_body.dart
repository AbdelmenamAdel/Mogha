import 'package:flutter/material.dart';
import 'posts_list_view.dart';
import 'story_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              StoryListView(),
              Divider(),
            ],
          ),
        ),
        SliverFillRemaining(
          child: const PostsListView(),
        ),
      ],
    );
  }
}
