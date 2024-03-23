import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'post_widget.dart';
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

           SliverToBoxAdapter(child: CustomAppBar(),),
           SliverToBoxAdapter(child: StoryListView(),),
           SliverToBoxAdapter(child: PostWidget(),),

         ],
        ),
      ),
    );
  }
}

