import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:icon_broken/icon_broken.dart';

class LogOutBottomBar extends StatelessWidget {
  const LogOutBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor:
          Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      child: IconButton(
        onPressed: () {
          showModalBottomSheet(
            elevation: 5,
            context: context,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            builder: (context) => LogOutWidget(),
          );
        },
        icon: Icon(IconBroken.Edit),
      ),
    );
  }
}

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 350.h,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: Column(
          children: [
            ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: Icon(IconBroken.Logout),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
