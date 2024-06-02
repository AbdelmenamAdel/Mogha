
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moga/core/common/url_luncher.dart';

class AuthorMedia extends StatelessWidget {
  const AuthorMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15,left: 15,right: 15).r,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () async {
                  var whatsapp = "+201556878109";
                  await urlLauncher(
                    context,
                    "whatsapp://send?phone=$whatsapp&text= السلام عليكم يا بشمهندس يارب تكون بخير ",
                  );
                },
                icon: Icon(
                  FontAwesomeIcons.whatsapp,
                  color: Colors.green,
                  size: 24.sp,
                ),
              ),
              IconButton(
                onPressed: () async {
                  await urlLauncher(
                      context, "https://www.facebook.com/abdelmenam.adel.10");
                },
                icon: Icon(
                  FontAwesomeIcons.facebook,
                  color: Colors.blue,
                  size: 24.sp,
                ),
              ),
              IconButton(
                onPressed: () async {
                  await urlLauncher(
                      context, "https://github.com/AbdelmenamAdel/");
                },
                icon: Icon(
                  FontAwesomeIcons.github,
                  color: Colors.black,
                  size: 24.sp,
                ),
              ),
              IconButton(
                onPressed: () async {
                  await urlLauncher(context,
                      "https://www.linkedin.com/in/abdelmenam-adel-175b35265/");
                },
                icon: Icon(
                  FontAwesomeIcons.linkedinIn,
                  color: Colors.blue[300]!,
                  size: 24.sp,
                ),
              ),
            ],
          ),
        ),
        Text(
          "MOGHA",
          style: TextStyle(
            fontFamily: 'Limelight',
            color: Theme.of(context).textTheme.displaySmall!.color,
            letterSpacing: 3.sp,
            fontSize: 24.sp,
          ),
        ),
      ],
    );
  }
}
