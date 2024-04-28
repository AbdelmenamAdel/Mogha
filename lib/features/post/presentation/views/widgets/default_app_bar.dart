import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icon_broken/icon_broken.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({
    super.key,
    this.actions,
    this.title,
    this.onPressed,
    this.leading,
    this.backgroundColor,
  });

  final String? title;
  final List<Widget>? actions;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: Text(
        title ?? '',
        style: Theme.of(context).textTheme.displayMedium,
      ),
      titleSpacing: 0.0,
      leading: leading ??
          IconButton(
            onPressed: onPressed ??
                () {
                  GoRouter.of(context).pop();
                },
            icon: Icon(IconBroken.Arrow___Left_2),
          ),
      actions: actions,
    );
  }
}
