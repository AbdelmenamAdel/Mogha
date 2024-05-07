import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moga/core/services/service_locator.dart';
import 'package:moga/features/chats/presentation/manager/chats/chats_cubit.dart';
import 'package:moga/features/chats/presentation/manager/chats/chats_states.dart';
import 'package:moga/features/social/presentation/views/widgets/custom_app_bar.dart';
import 'chats_view_body.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatsCubit, ChatsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                CustomAppBar(title: 'Users'),
                ChatsViewBody(),
              ],
            ),
          ),
        );
      },
    );
  }
}
