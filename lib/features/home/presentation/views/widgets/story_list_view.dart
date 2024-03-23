
import 'package:flutter/material.dart';

import 'custom_story_item.dart';

class StoryListView extends StatelessWidget {
  const StoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * .26;

    return SizedBox(
      height: height,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(5.0),
          child: CustomStoryItem(imageUrl: ''),
        ),
      ),
    );
  }
}
