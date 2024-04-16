import 'package:flutter/material.dart';
import 'package:moga/features/post/views/add_post.dart';
import 'package:moga/features/post/views/widgets/default_app_bar.dart';
import 'package:moga/features/social/presentation/views/widgets/custom_app_bar.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultAppBar(),
        ],
      ),
    );
  }
}
