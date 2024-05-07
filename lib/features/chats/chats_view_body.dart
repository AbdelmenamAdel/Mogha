import 'package:flutter/material.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';

class ChatsViewBody extends StatelessWidget {
  const ChatsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = SocialCubit.get(context);
    return Expanded(
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => InkWell(
          onTap: (){},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(cubit.users[index].profilePhoto),
                radius: 30,
                backgroundColor: AppColors.blue,
              ),
              title: Text(cubit.users[index].userName),
            ),
          ),
        ),
        separatorBuilder: (context, index) => Divider(
          height: 0,
          color: Theme.of(context).dividerColor,
        ),
        itemCount: cubit.users.length,
      ),
    );
  }
}