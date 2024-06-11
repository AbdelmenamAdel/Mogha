import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:moga/core/common/custom_navigate.dart';
import 'package:moga/core/routes/app_routes.dart';
import 'package:moga/core/services/service_locator.dart';
import 'package:moga/core/widgets/custom_divider.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';
import 'repeated_list_in_drawer.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.condition,
    required this.animation1,
    required this.animation2,
    required this.animation3,
  });
  final Animation<double> animation1;
  final Animation<double> animation2;
  final Animation<double> animation3;

  final bool condition;
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return BackdropFilter(
      filter:
          ImageFilter.blur(sigmaY: animation1.value, sigmaX: animation1.value),
      child: Container(
        height: condition ? 0 : _height,
        width: condition ? 0 : _width,
        color: Colors.transparent,
        child: Center(
          child: Transform.scale(
            scale: animation3.value,
            child: Container(
              width: _width * .9,
              height: _width * 1.3,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(animation2.value),
                borderRadius: BorderRadius.circular(30),
              ),
              child: CustomRepeatedRows(),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomRepeatedRows extends StatelessWidget {
  const CustomRepeatedRows({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundImage:
                  NetworkImage(sl<SocialCubit>().model?.profilePhoto ?? ''),
              radius: 35,
            ),
            Text(
              sl<SocialCubit>().model?.userName ?? '',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            CustomDivider(),
            RepeatedListTailInDrawer(
              icon: Icons.person_outline_rounded,
              title: 'Profile',
              onTap: () {
                HapticFeedback.lightImpact();
                context.navigate(AppRoutes.profile, context);
              },
            ),
            CustomDivider(),
            RepeatedListTailInDrawer(
              icon: Icons.add_a_photo_outlined,
              title: 'Add Story',
              onTap: () {
                HapticFeedback.lightImpact();
                context.navigate(AppRoutes.addStory, context);
              },
            ),
            CustomDivider(),
            RepeatedListTailInDrawer(
              icon: IconBroken.Paper_Upload,
              title: 'Add Post',
              onTap: () {
                HapticFeedback.lightImpact();
                context.navigate(AppRoutes.newPost, context);
              },
            ),
            CustomDivider(),
            RepeatedListTailInDrawer(
              icon: Icons.settings_outlined,
              title: 'Settings',
              onTap: () {
                HapticFeedback.lightImpact();
                sl<SocialCubit>().changeBottomNav(3);
              },
            ),
            CustomDivider(),
            RepeatedListTailInDrawer(
              icon: Icons.info_outline_rounded,
              title: 'About',
              onTap: () {
                HapticFeedback.lightImpact();
                context.navigate(AppRoutes.about, context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
