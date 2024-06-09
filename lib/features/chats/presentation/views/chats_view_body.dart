import 'package:flutter/material.dart';
import 'package:moga/features/home/presentation/views/widgets/story_list_view.dart';
import 'package:moga/features/social/presentation/views/widgets/custom_app_bar.dart';

import 'widgets/chats_section.dart';
import 'widgets/divider_b_stories_chats.dart';

class ChatsViewBody extends StatelessWidget {
  const ChatsViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: CustomAppBar(title: 'Chats')),
        SliverToBoxAdapter(child: StoryListView()),
        SliverToBoxAdapter(child: DividerBetweenChatsAndStories()),
        SliverFillRemaining(child: ChatsSection())
      ],
    );
  }
}
