import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:moga/core/bloc/global_cubit/app_language_cubit.dart';
import 'package:moga/core/services/service_locator.dart';
import 'package:moga/core/utils/app_images.dart';
import 'package:moga/features/post/presentation/views/widgets/default_app_bar.dart';
import 'package:moga/features/settings/presentation/views/widgets/auther_media.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 500),
            delay: const Duration(milliseconds: 50),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: 10,
              child: FadeInAnimation(
                child: widget,
              ),
            ),
            children: [
              DefaultAppBar(
                elevation: 1,
                title: 'About Developer',
                centerTitle: true,
                style: TextStyle(
                  fontSize: 24,
                  letterSpacing: 1.5,
                  fontFamily: 'Dosis',
                ),
              ),
              SizedBox(height: 30.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 800),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 20,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                    SizedBox(width: 5.w),
                    SizedBox(
                      height: 140.h,
                      width: 140.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10).r,
                        child: Image.asset(
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                          AppImages.initImage,
                        ),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Abdelmoneim Diff Allah",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              fontFamily: "Dosis",
                              letterSpacing: 1.sp,
                              fontSize: 21.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Text(
                            "Studying at Faculty of Computers &\nArtificial Intelligence Benha University",
                            style: TextStyle(
                              fontFamily: "Dosis",
                              letterSpacing: 1.sp,
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(height: 15.h),
                          SizedBox(
                            width: 210.w,
                            child: Text(
                              "وَأَنْ لَيْسَ لِلْإِنْسَانِ إِلَّا مَا سَعَى (39) وَأَنَّ سَعْيَهُ سَوْفَ يُرَى (40) ثُمَّ يُجْزَاهُ الْجَزَاءَ الْأَوْفَى (41)",
                              textDirection: TextDirection.rtl,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: "Dosis",
                                letterSpacing: 1.sp,
                                fontWeight: FontWeight.w600,
                                fontSize: 11.sp,
                                // color: textColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.h),
              Padding(
                padding: const EdgeInsets.only(left: 5).r,
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    "Mogha",
                    style: TextStyle(
                      fontSize: 24.sp,
                      letterSpacing: 3.sp,
                      fontFamily: 'Dosis',
                      fontWeight: FontWeight.bold,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: sl<GlobalCubit>().langCode == 'en'
                    ? const EdgeInsets.only(left: 17).r
                    : const EdgeInsets.only(right: 17).r,
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    "an online application that allows users to purchase handmade items from artisans and Crafters around Egypt. "
                    "It provides a convenient way for customers to find unique, one-of-a-kind items that are not available in stores. "
                    "\n\nThe application features a wide selection of handmade items ranging from clothing, home decor and more. "
                    "Customers can browse through the different categories to find the perfect item for their needs."
                    "\n\nThe application also offers secure payment options and fast shipping to ensure customer satisfaction. "
                    "With its easy-to-use interface and wide selection of handmade products, this e-commerce application is an ideal choice for those looking for unique gifts or special items.",
                    style: TextStyle(
                      color: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .color!
                          .withOpacity(.7),
                      fontSize: 14.sp,
                      letterSpacing: 1.9.sp,
                      fontFamily: 'Dosis',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.only(left: 5, bottom: 10).r,
                child: Text(
                  "Social Media",
                  style: TextStyle(
                    fontSize: 15.sp,
                    letterSpacing: 3.sp,
                    fontFamily: 'Dosis',
                    fontWeight: FontWeight.bold,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              AuthorMedia()
            ],
          ),
        ),
      ),
    );
  }
}
