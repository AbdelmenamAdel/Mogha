import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:moga/features/onboarding/data/models/onboarding_model.dart';
import 'package:rive/rive.dart';
import '../../../../core/utils/app_images.dart';
import 'widgets/custom_onboarding_body.dart';
import 'widgets/custom_onboarding_buttons.dart';
import 'widgets/custom_pagination_builder.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final SwiperController _swiperController = SwiperController();
  final int _pageCount = OnBoardingModel.onBoardingScreens.length;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const RiveAnimation.asset(
            AppImages.rivBackground,
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 2),
              child: const SizedBox(),
            ),
          ),
          Column(
            children: <Widget>[
              Expanded(
                  child: Swiper(
                index: _currentIndex,
                controller: _swiperController,
                itemCount: _pageCount,
                onIndexChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return CustomOnBoardingBody(
                    title: OnBoardingModel.onBoardingScreens[index].title,
                    image: OnBoardingModel.onBoardingScreens[index].imgPath,
                  );
                },
                pagination: SwiperPagination(
                  builder: CustomPaginationBuilder(
                    activeSize: const Size(12.0, 25.0),
                    size: const Size(11.0, 16.0),
                    color: Colors.grey.shade600,
                  ),
                ),
              )),
              const SizedBox(height: 10.0),
              CustomOnBoardingButtons(
                currentIndex: _currentIndex,
                pageCount: _pageCount,
                swiperController: _swiperController,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
