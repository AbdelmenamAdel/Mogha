import 'package:flutter/material.dart';

import 'post_widget.dart';

class PostsListView extends StatelessWidget {
  const PostsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => PostWidget(),
    );
  }
}