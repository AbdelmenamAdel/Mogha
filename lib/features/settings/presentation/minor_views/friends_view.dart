import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moga/features/post/presentation/views/widgets/default_app_bar.dart';

class FriendsView extends StatelessWidget {
  const FriendsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultAppBar(
            elevation: 1,
            title: 'Friends',
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
