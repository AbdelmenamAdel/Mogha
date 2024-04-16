import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icon_broken/icon_broken.dart';

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

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({
    super.key,
    this.actions,
    this.title,
  });

  final String? title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title??'',style: Theme.of(context).textTheme.titleMedium,),
      titleSpacing: 0.0,
      leading: IconButton(
        onPressed: () {
          GoRouter.of(context).pop();
        },
        icon: Icon(IconBroken.Arrow___Left_2),
      ),
      actions: actions,
    );
  }
}
