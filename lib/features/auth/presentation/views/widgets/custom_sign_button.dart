import 'package:flutter/material.dart';
import 'package:moga/core/utils/app_colors.dart';

class CustomSignButton extends StatelessWidget {
  const CustomSignButton(
      {super.key, required this.scale, required this.text, this.onTap});

  final double scale;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Expanded(
      flex: 3,
      child: Stack(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: width * .07),
              height: width * .7,
              width: width * .7,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    AppColors.kPrimary,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Center(
            child: Transform.scale(
              scale: scale,
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: onTap,
                child: Container(
                  height: width * .2,
                  width: width * .2,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: AppColors.kPrimary,
                    shape: BoxShape.circle,
                  ),
                  child: Text(text,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: AppColors.black.withOpacity(.8),
                            fontWeight: FontWeight.w600,
                          )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
