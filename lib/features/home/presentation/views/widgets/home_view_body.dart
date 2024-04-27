import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_cubit.dart';
import 'package:moga/features/social/presentation/manager/social_cubit/social_states.dart';
import 'custom_post_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    var cubit = SocialCubit.get(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.5),
      child: SingleChildScrollView(
        controller: scrollController,
        child: BlocConsumer<SocialCubit, SocialStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(
                  height: 170,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Card(
                          child: Image.network(
                            'https://img.freepik.com/free-photo/attractive-young-man-wearing-glasses-casual-clothes-showing-ok-good-sign-approval-like-someth_1258-161826.jpg?t=st=1713099288~exp=1713102888~hmac=7bf694e645d046054b47fbcd7ff529690f0e42aece2172f6281b33e9d75fb53e&w=1060',
                            height: 170,
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
                            fontSize: 12,
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
                  itemCount: cubit.posts.length,
                  itemBuilder: (context, index) => CustomPostWidget(
                    postModel: cubit.posts[index],
                    index: index,
                  ),
                ),
                // PostsListView()
              ],
            );
          },
        ),
      ),
    );
  }
}
