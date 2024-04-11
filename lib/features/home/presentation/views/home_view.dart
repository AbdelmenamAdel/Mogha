import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hidable/hidable.dart';
import 'package:moga/core/utils/custom_gnav_bar.dart';
import 'package:moga/features/home/presentation/views/widgets/custom_app_bar.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return SafeArea(
      child: Scaffold(
        appBar: Hidable(
          controller: scrollController,
          child: CustomAppBar(),
        ),
        body: HomeViewBody(
          scrollController: scrollController,
        ),

      ),
    );
  }
}
