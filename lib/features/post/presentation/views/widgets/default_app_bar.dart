import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icon_broken/icon_broken.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({
    super.key,
    this.actions,
    this.title,
    this.onPressed,
    this.style,
    this.centerTitle,
    this.leading,
    this.backgroundColor,
    this.elevation,this.clipBehavior
  });

  final String? title;
  final List<Widget>? actions;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Widget? leading;
  final TextStyle? style;
  final bool? centerTitle;
  final double? elevation;
  final Clip? clipBehavior;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      clipBehavior: clipBehavior,
      elevation: elevation,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      title: Text(
        title ?? '',
        style: style ?? Theme.of(context).textTheme.displayMedium,
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
