import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:moga/core/utils/app_colors.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  Container(
                    height: 160,
                    width: double.infinity,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: Image.network(
                        fit: BoxFit.cover,
                        'https://img.freepik.com/free-photo/handsome-caucasian-man-casual-outfit-pointing-fingers-left-smiling-showing-promo-offer-standing-blue-background_1258-65029.jpg?t=st=1713088183~exp=1713091783~hmac=0ca3b0954b67f077341ede4a034e60c42abf06fa92f80965b2517d776fb3f94c&w=996'),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CircleAvatar(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      radius: 65,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                            'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1713087956~exp=1713091556~hmac=1db397ef3651b67f3aa924c741d0450d04de208c67dce876c3a79359038cdc8b&w=996'),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Text(
              "Abdelmoneim Adel",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(height: 15),
            Text(
              'bio...',
              style: Theme.of(context).textTheme.caption,
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                    child: InkWell(
                  child: Column(children: [
                    Text(
                      '100',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text('Posts'),
                  ]),
                  onTap: () {},
                )),
                Expanded(
                    child: InkWell(
                  child: Column(children: [
                    Text(
                      '265',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text('Photos'),
                  ]),
                  onTap: () {},
                )),
                Expanded(
                    child: InkWell(
                  child: Column(children: [
                    Text(
                      '1K',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text('Following'),
                  ]),
                  onTap: () {},
                )),
                Expanded(
                    child: InkWell(
                  child: Column(children: [
                    Text(
                      '10K',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text('Followers'),
                  ]),
                  onTap: () {},
                )),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    child: Text('Edit Profile'),
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 10.0),
                OutlinedButton(
                  style: ButtonStyle(),
                  child: Icon(
                    IconBroken.Edit,
                    size: 20,
                  ),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
