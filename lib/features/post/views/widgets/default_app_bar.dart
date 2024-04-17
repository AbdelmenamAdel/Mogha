
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';

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
          BlocProvider.of<SocialCubit>(context).profileImage==null;
          BlocProvider.of<SocialCubit>(context).coverImage==null;
        },
        icon: Icon(IconBroken.Arrow___Left_2),
      ),
      actions: actions,
    );
  }
}
