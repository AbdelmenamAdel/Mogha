import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:moga/core/routes/app_routes.dart';
import 'package:moga/core/widgets/custom_navigate.dart';
import 'package:moga/onboarding/onboarding_model.dart';
import 'package:rive/rive.dart';
import 'core/utils/app_images.dart';

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
                // loop: false,
                itemBuilder: (context, index) {
                  return _buildPage(
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
              _buildButtons(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Container(
      margin: const EdgeInsets.only(right: 16.0, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          if (_currentIndex == 0) Spacer(),
          if (_currentIndex > 0)
            IconButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey.shade700,
              ),
              icon: Icon(
                Icons.arrow_back_sharp,
                size: 32,
              ),
              onPressed: () {
                _swiperController.previous();
              },
            ),
          IconButton(
            icon: Icon(
              _currentIndex < _pageCount - 1
                  ? CupertinoIcons.arrow_right_circle
                  : CupertinoIcons.checkmark_alt_circle,
              size: 45,
            ),
            onPressed: () async {
              if (_currentIndex < _pageCount - 1) {
                _swiperController.next();
              } else {
                context.navigate(AppRoutes.signUp, context);
              }
            },
          )
        ],
      ),
    );
  }

  Widget _buildPage({required String title, required String image}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 75.0, vertical: 150),
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
          colorFilter:
              const ColorFilter.mode(Colors.black38, BlendMode.multiply),
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10.0,
            spreadRadius: 5.0,
            offset: Offset(5.0, 5.0),
            color: Colors.black26,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////?

class PNetworkImage extends StatelessWidget {
  final String image;
  final BoxFit? fit;
  final double? width, height;
  const PNetworkImage(this.image, {Key? key, this.fit, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Image.asset(
        'assets/placeholder.jpg',
        fit: BoxFit.cover,
      ),
      fit: fit,
      width: width,
      height: height,
    );
  }
}

//////////////////////////////////////////////////////////////?

class CustomPaginationBuilder extends SwiperPlugin {
  final Color? activeColor;
  final Color? color;
  final Size activeSize;
  final Size size;
  final double space;

  final Key? key;

  const CustomPaginationBuilder(
      {this.activeColor,
      this.color,
      this.key,
      this.size = const Size(10.0, 2.0),
      this.activeSize = const Size(10.0, 2.0),
      this.space = 3.0});

  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    ThemeData themeData = Theme.of(context);
    Color activeColor = this.activeColor ?? themeData.primaryColor;
    Color color = this.color ?? themeData.scaffoldBackgroundColor;

    List<Widget> list = [];

    if (config.itemCount > 20) {
      print(
          "The itemCount is too big, we suggest use FractionPaginationBuilder instead of DotSwiperPaginationBuilder in this sitituation");
    }

    int itemCount = config.itemCount;
    int activeIndex = config.activeIndex;

    for (int i = 0; i < itemCount; ++i) {
      bool active = i == activeIndex;
      Size size = active ? activeSize : this.size;
      list.add(SizedBox(
        width: size.width,
        height: size.height,
        child: Container(
          decoration: BoxDecoration(
              color: active ? activeColor : color,
              borderRadius: BorderRadius.circular(10.0)),
          key: Key("pagination_$i"),
          margin: EdgeInsets.all(space),
        ),
      ));
    }

    if (config.scrollDirection == Axis.vertical) {
      return Column(
        key: key,
        mainAxisSize: MainAxisSize.min,
        children: list,
      );
    } else {
      return Row(
        key: key,
        mainAxisSize: MainAxisSize.min,
        children: list,
      );
    }
  }
}
//////////////////////////////////////////////////////////////?

