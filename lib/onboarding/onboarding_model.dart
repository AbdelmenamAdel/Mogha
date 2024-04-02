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
        title:
            "Lorem ipsum dolor \nsit amet, consectetur adipiscing \n elit placerat. ",
        subTitle: Strings.password),
    OnBoardingModel(
        imgPath: AppImages.on2,
        title:
            "Lorem ipsum dolor \nsit amet, consectetur adipiscing \n elit placerat. ",
        subTitle: Strings.password),
    OnBoardingModel(
        imgPath: AppImages.on3,
        title:
            "Lorem ipsum dolor \nsit amet, consectetur adipiscing \n elit placerat. ",
        subTitle: Strings.password),
    OnBoardingModel(
        imgPath: AppImages.on4,
        title:
            "Lorem ipsum dolor \nsit amet, consectetur adipiscing \n elit placerat. ",
        subTitle: Strings.password),
    OnBoardingModel(
        imgPath: AppImages.on5,
        title:
            "Lorem ipsum dolor \nsit amet, consectetur adipiscing \n elit placerat. ",
        subTitle: Strings.password),
  ];
}
