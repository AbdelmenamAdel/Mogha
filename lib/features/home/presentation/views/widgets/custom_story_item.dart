import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moga/core/widgets/custom_cached_network_image.dart';
import 'package:moga/features/auth/data/models/create_user_model.dart';
import 'package:moga/features/chats/presentation/views/view_story_view.dart';

class CustomStoryItem extends StatelessWidget {
  const CustomStoryItem({
    super.key,
    required this.user,
  });

  final UserModel user;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * .2;
    return Column(
      children: [
        SizedBox(
          height: height,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ViewStoryView(stories: user.story);
                  },
                ),
              );
            },
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
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .96,
                  child: AspectRatio(
                    aspectRatio: 9 / 13,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CustomCachedNetworkImage(
                        imageUrl: user.profilePhoto,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 110.w,
          child: Text(
            user.userName,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        )
      ],
    );
  }
}
