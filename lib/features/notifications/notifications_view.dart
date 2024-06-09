import 'package:flutter/material.dart';
import 'package:moga/features/post/presentation/views/widgets/default_app_bar.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultAppBar(
            title: 'Notifications',
          ),
        ],
      ),
    );
  }
}
