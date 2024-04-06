import 'package:achievement_view/achievement_view.dart';
import 'package:flutter/material.dart';

void showAchievementView(BuildContext context) {
  AchievementView(
      title: "Yeaaah!",
      subTitle: "Training completed successfully",
      //content: Widget()
      //onTab: _onTabAchievement,
      //icon: Icon(Icons.insert_emoticon, color: Colors.white,),
      //typeAnimationContent: AnimationTypeAchievement.fadeSlideToUp,
      //borderRadius: 5.0,
      //color: Colors.blueGrey,
      //textStyleTitle: TextStyle(),
      //textStyleSubTitle: TextStyle(),
      //alignment: Alignment.topCenter,
      //duration: Duration(seconds: 3),
      //isCircle: false,
      listener: (status) {
        print(status);
        //AchievementState.opening
        //AchievementState.open
        //AchievementState.closing
        //AchievementState.closed
      }).show(context);
}
