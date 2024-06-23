import 'package:flutter/material.dart';
import 'package:moga/features/chats/data/models/story_model.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

class ViewStoryView extends StatefulWidget {
  const ViewStoryView({
    super.key,
    required this.stories,
  });
  final List<StoryModel> stories;
  @override
  State<ViewStoryView> createState() => _ViewStoryViewState();
}

class _ViewStoryViewState extends State<ViewStoryView> {
  late StoryController storyController;
  @override
  void initState() {
    storyController = StoryController();
    super.initState();
  }

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoryView(
      storyItems: widget.stories.map((story) {
        if (story.image != null)
          return StoryItem.pageImage(
              url: story.image!, controller: storyController);

        if (story.video != null)
          return StoryItem.pageVideo(
            story.video!,
            controller: storyController,
          );
       if(story.message!=null)
        return StoryItem.text(
          title: story.message!,
          backgroundColor: Colors.deepOrange,
          textStyle: const TextStyle(color: Colors.white),
        );
        
      }).toList(),
      controller: storyController,
    );
  }
}
