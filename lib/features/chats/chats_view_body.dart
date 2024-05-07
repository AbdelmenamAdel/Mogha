import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/core/widgets/show_hero_image.dart';
import 'package:moga/features/chats/chat_details_view.dart';
import 'package:moga/features/chats/presentation/manager/chats/chats_cubit.dart';
import 'package:moga/features/chats/presentation/manager/chats/chats_states.dart';

class ChatsViewBody extends StatelessWidget {
  const ChatsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = ChatsCubit.get(context);
    return BlocConsumer<ChatsCubit, ChatsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Expanded(
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatDetailsView(
                          user: cubit.users[index],
                        ),
                      ));
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
                  child: ListTile(
                    leading: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {
                        showHeroImage(context, cubit.users[index].profilePhoto);
                      },
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          cubit.users[index].profilePhoto,
                        ),
                        radius: 30,
                        backgroundColor: AppColors.blue,
                      ),
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
        });
  }
}
