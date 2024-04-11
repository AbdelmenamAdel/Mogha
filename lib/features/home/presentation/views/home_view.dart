import 'package:flutter/material.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return SafeArea(
      child: Scaffold(

        body: Center(child: Text('home'),)
        // HomeViewBody(
        //   scrollController: scrollController,
        // ),

      ),
    );
  }
}
