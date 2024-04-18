import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:moga/core/utils/app_colors.dart';

class CustomPostWidget extends StatelessWidget {
  const CustomPostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                minVerticalPadding: 0,
                leading: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://img.freepik.com/free-photo/handsome-caucasian-man-casual-outfit-pointing-fingers-left-smiling-showing-promo-offer-standing-blue-background_1258-65029.jpg?t=st=1713088183~exp=1713091783~hmac=0ca3b0954b67f077341ede4a034e60c42abf06fa92f80965b2517d776fb3f94c&w=996'),
                ),
                contentPadding: EdgeInsets.zero,
                title: Row(
                  children: [
                    Text('Abdelmoneim Adel ',
                        style: Theme.of(context).textTheme.displaySmall),
                    Icon(Icons.verified, color: Colors.blue, size: 18)
                  ],
                ),
                subtitle: Text(
                  'January 29,2024 at 11:00 pm',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                trailing: IconButton(
                  icon: Icon(IconBroken.More_Circle),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Divider(
                  height: 0,
                  color: Theme.of(context).dividerColor,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontSize: 14, height: 1.2),
              ),
              SizedBox(height: 10),
              Wrap(
                alignment: WrapAlignment.start,
                children: [
                  InkWell(
                    overlayColor: MaterialStatePropertyAll(Color(0xf2B8EECF2)),
                    child: Text(
                      '#Software',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.blue),
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    overlayColor: MaterialStatePropertyAll(Color(0xf2B8EECF2)),
                    child: Text(
                      '#Software',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.blue),
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    overlayColor: MaterialStatePropertyAll(Color(0xf2B8EECF2)),
                    child: Text(
                      '#Software',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.blue),
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    overlayColor: MaterialStatePropertyAll(Color(0xf2B8EECF2)),
                    child: Text(
                      '#Software',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.blue),
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    overlayColor: MaterialStatePropertyAll(Color(0xf2B8EECF2)),
                    child: Text(
                      '#Software',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.blue),
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    overlayColor: MaterialStatePropertyAll(Color(0xf2B8EECF2)),
                    child: Text(
                      '#Software_Development',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.blue),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(height: 8),
              Container(
                height: 175,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: Image.network(
                  'https://img.freepik.com/free-photo/attractive-young-man-wearing-glasses-casual-clothes-showing-ok-good-sign-approval-like-someth_1258-161826.jpg?t=st=1713099288~exp=1713102888~hmac=7bf694e645d046054b47fbcd7ff529690f0e42aece2172f6281b33e9d75fb53e&w=1060',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Row(
                children: [
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            IconBroken.Heart,
                            size: 18,
                            color: AppColors.red,
                          ),
                          SizedBox(width: 5),
                          Text('143')
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                  Spacer(),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            IconBroken.Chat,
                            size: 16,
                            color: Colors.amber,
                          ),
                          SizedBox(width: 5),
                          Text('112 Comments')
                        ],
                      ),
                    ),
                    onTap: () {},
                  )
                ],
              ),
              Divider(
                height: 5,
                color: Theme.of(context).dividerColor,
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(
                      'https://img.freepik.com/free-photo/handsome-caucasian-man-casual-outfit-pointing-fingers-left-smiling-showing-promo-offer-standing-blue-background_1258-65029.jpg?t=st=1713088183~exp=1713091783~hmac=0ca3b0954b67f077341ede4a034e60c42abf06fa92f80965b2517d776fb3f94c&w=996'),
                ),
                title: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'write a comment ....',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
                contentPadding: EdgeInsets.zero,
                trailing: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          IconBroken.Heart,
                          color: AppColors.red,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Like')
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
