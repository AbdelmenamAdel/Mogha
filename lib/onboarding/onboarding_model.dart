import 'package:moga/core/utils/app_images.dart';
import 'package:moga/core/utils/app_strings.dart';

class OnBoardingModel {
  final String imgPath;
  final String title;
  final String subTitle;

  OnBoardingModel({
    required this.imgPath,
    required this.title,
    required this.subTitle,
  });
  static List<OnBoardingModel> onBoardingScreens = [
    OnBoardingModel(
        imgPath: AppImages.on1,
        title: "Welcome to Mogha! Entertainment where connecting with friends",
        subTitle: Strings.password),
    OnBoardingModel(
        imgPath: AppImages.on2,
        title: " sharing moments, and discovering new content",
        subTitle: Strings.password),
    OnBoardingModel(
        imgPath: AppImages.on3,
        title: "Express yourself through photos, videos, and stories.",
        subTitle: Strings.password),
    OnBoardingModel(
        imgPath: AppImages.on4,
        title: "Endless possibilities. Let's make memories together!",
        subTitle: Strings.password),
    OnBoardingModel(
        imgPath: AppImages.on5,
        title: "Start intaractiving with share and emogis",
        subTitle: Strings.password),
  ];
}
