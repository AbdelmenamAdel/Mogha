import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moga/features/post/presentation/views/widgets/default_app_bar.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          DefaultAppBar(
            elevation: 1,
            title: 'About Developer',
            centerTitle: true,
            style: TextStyle(
              fontSize: 24,
              letterSpacing: 1.5,
              fontFamily: 'Dosis',
            ),
          ),
          SizedBox(height: 30.h),

        ],
      ),
    );
  }
}
