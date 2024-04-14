import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icon_broken/icon_broken.dart';
import 'posts_list_view.dart';
import 'story_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  Card(
                    child: Image.network(
                      'https://img.freepik.com/free-photo/attractive-young-man-wearing-glasses-casual-clothes-showing-ok-good-sign-approval-like-someth_1258-161826.jpg?t=st=1713099288~exp=1713102888~hmac=7bf694e645d046054b47fbcd7ff529690f0e42aece2172f6281b33e9d75fb53e&w=1060',
                      height: 200,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 5,
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
            SizedBox(height: 10),
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                            'https://img.freepik.com/free-photo/handsome-caucasian-man-casual-outfit-pointing-fingers-left-smiling-showing-promo-offer-standing-blue-background_1258-65029.jpg?t=st=1713088183~exp=1713091783~hmac=0ca3b0954b67f077341ede4a034e60c42abf06fa92f80965b2517d776fb3f94c&w=996'),
                      ),
                      title: Text('Abdelmoneim Adel'),
                      subtitle: Text(
                        'January 29,2024 at 11:00 pm',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      trailing: IconButton(
                        icon: Icon(IconBroken.More_Circle),
                        onPressed: () {},
                      ),
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
