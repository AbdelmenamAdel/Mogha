import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moga/core/local/app_local.dart';
import 'package:moga/core/utils/app_strings.dart';
import 'custom_story_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),

         slivers: [

           SliverToBoxAdapter(child: CustomAppBar(),),

         ],
        ),
      ),
    );
  }
}


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      // color: Colors.transparent.withOpacity(.35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.camera_alt_outlined,
              size: 28,
              weight: 24,
            ),
          ),
          Text(
            Strings.mogha.tr(context),
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(letterSpacing: 4),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chat_rounded,
              size: 28,
              weight: 24,
            ),
          ),
        ],
      ),
    );
  }
}
