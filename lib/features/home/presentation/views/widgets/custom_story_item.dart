
import 'package:flutter/material.dart';
import 'package:moga/core/widgets/custom_cached_network_image.dart';

class CustomStoryItem extends StatelessWidget {
  const CustomStoryItem({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * .2;
    return Column(
      children: [
        SizedBox(
          height: height*1.05,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: height * 1.2,
                child: AspectRatio(
                  aspectRatio: 9 / 12.5,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color(0xffA60F93),
                            Color(0xffD91A46),
                            Color(0xffFBAA47),
                          ],
                          begin: Alignment.topRight
                          ,end: Alignment.bottomLeft
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height,
                child: AspectRatio(
                  aspectRatio: 9 / 13,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CustomCachedNetworkImage(
                      imageUrl: imageUrl,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
Text('User Name',style: Theme.of(context).textTheme.displaySmall,)
      ],
    );
  }
}
