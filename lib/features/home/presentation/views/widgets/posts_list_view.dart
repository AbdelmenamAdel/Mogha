
import 'package:flutter/material.dart';

import 'post_widget.dart';

class PostsListView extends StatelessWidget {
  const PostsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) => PostWidget(),
    );
  }
}
