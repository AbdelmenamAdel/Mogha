import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      storyItems: [
        StoryItem.text(
          title: 'Hi There 👋, this is my first story',
          backgroundColor: Colors.purple,
          textStyle: const TextStyle(color: Colors.white),
        ),
        StoryItem.pageImage(
            url:
                'https://firebasestorage.googleapis.com/v0/b/mogha-266d4.appspot.com/o/story%2FMen3em.jpg?alt=media&token=46c1071b-ad4b-4d6a-b573-0585d03d7152',
            controller: storyController),
        StoryItem.pageVideo(
          duration: Duration(seconds: 3),
          'https://firebasestorage.googleapis.com/v0/b/mogha-266d4.appspot.com/o/story%2Fvideo.mp4?alt=media&token=5470c15d-c273-4a0e-bc2a-4e90bf9bccb7',
          controller: storyController,
        ),
        StoryItem.pageVideo(
          duration: Duration(seconds: 24),
          'https://firebasestorage.googleapis.com/v0/b/mogha-266d4.appspot.com/o/story%2FGDN3VBm0JAz0jxMBADE_DXA9h_BHbmdjAAAF.mp4?alt=media&token=b7b4ee04-2692-4772-b448-98954532d174',
          controller: storyController,
        ),
      ],
      controller: storyController,
      onComplete: () {
        GoRouter.of(context).pop();
      },
    );
  }
}
