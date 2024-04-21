import 'package:flutter/material.dart';
import 'widgets/default_app_bar.dart';

class AddPostView extends StatelessWidget {
  const AddPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultAppBar(title: 'Add Post'),
        ],
      ),
    );
  }
}
