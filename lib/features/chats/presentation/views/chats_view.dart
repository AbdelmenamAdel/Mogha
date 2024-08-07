import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moga/features/chats/presentation/manager/chats/chats_cubit.dart';
import 'package:moga/features/chats/presentation/manager/chats/chats_states.dart';
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
            body: ChatsViewBody(),
          ),
        );
      },
    );
  }
}
