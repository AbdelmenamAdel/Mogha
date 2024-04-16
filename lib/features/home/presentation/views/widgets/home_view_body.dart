import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'custom_post_widget.dart';
import 'posts_list_view.dart';
import 'reaction_button.dart';
import 'story_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.5),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Card(
                      child: Image.network(
                        'https://img.freepik.com/free-photo/attractive-young-man-wearing-glasses-casual-clothes-showing-ok-good-sign-approval-like-someth_1258-161826.jpg?t=st=1713099288~exp=1713102888~hmac=7bf694e645d046054b47fbcd7ff529690f0e42aece2172f6281b33e9d75fb53e&w=1060',
                        height: 200,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 5,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Text(
                      'Communicate with friends',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) => CustomPostWidget(),
            ),
            // PostsListView()
          ],
        ),
      ),
    );
  }
}
