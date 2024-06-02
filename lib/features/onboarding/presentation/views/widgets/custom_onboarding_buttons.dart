import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:moga/core/database/cache/cache_helper.dart';
import 'package:moga/core/routes/app_routes.dart';
import 'package:moga/core/services/service_locator.dart';
import 'package:moga/core/utils/app_strings.dart';
import 'package:moga/core/common/custom_navigate.dart';

class CustomOnBoardingButtons extends StatelessWidget {
  const CustomOnBoardingButtons({
    super.key,
    required this.currentIndex,
    required this.pageCount,
    required this.swiperController,
  });

  final int currentIndex;
  final SwiperController swiperController;
  final int pageCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16.0, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          if (currentIndex == 0) Spacer(),
          if (currentIndex > 0)
            IconButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey.shade700,
              ),
              icon: Icon(
                Icons.arrow_back_sharp,
                size: 32,
              ),
              onPressed: () {
                swiperController.previous();
              },
            ),
          IconButton(
            icon: Icon(
              currentIndex < pageCount - 1
                  ? CupertinoIcons.arrow_right_circle
                  : CupertinoIcons.checkmark_alt_circle,
              size: 45,
            ),
            onPressed: () async {
              if (currentIndex < pageCount - 1) {
                swiperController.next();
              } else {
                await sl<CacheHelper>()
                    .saveData(key: Strings.onBoardingKey, value: true)
                    .then((value) {
                  debugPrint('onBoarding is Visited');
                  context.navigate(AppRoutes.changeLang, context);
                }).catchError((e) {
                  debugPrint(e.toString());
                });
              }
            },
          )
        ],
      ),
    );
  }
}
