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
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 8, right: 8, top: 8),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(5.0),
          child: CustomStoryItem(
            imageUrl:
                'https://avatars.githubusercontent.com/u/127325365?s=400&u=2be761cfa7774f75b78274bb04b13bc6561afc07&v=4',
          ),
        ),
      ),
    );
  }
}
