import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../utils/app_colors.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(
          height: 24,
          width: 32,
          child: LoadingIndicator(
            indicatorType: Indicator.lineScalePulseOut,
            colors: [AppColors.kPrimary],
            strokeWidth: .5,
          ),
        ));
  }
}