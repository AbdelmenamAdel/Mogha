import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/features/chats/data/models/message_model.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class CustomChatBubble extends StatelessWidget {
  CustomChatBubble({super.key, required this.type, required this.model});
  BubbleType type;
  MessageModel model;
  @override
  Widget build(BuildContext context) {
    return CustmChatBubble(context, type, model);
  }

  Widget CustmChatBubble(
          BuildContext context, BubbleType type, MessageModel model) =>
      ChatBubble(
        clipper: ChatBubbleClipper1(type: type),
        alignment: type == BubbleType.sendBubble ? Alignment.topRight : null,
        margin: EdgeInsets.only(top: 20),
        backGroundColor: type == BubbleType.sendBubble
            ? Color(0xfffDDFFEC)
            : Color(0xffF0F4F9),
        child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            child: (model.image == null && model.video == null)
                ? Text(
                    model.message!,
                    style: TextStyle(color: AppColors.black),
                  )
                : (model.image != null)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              // Navigator.pushNamed(context, '/image', arguments: model.image);
                            },
                            child: Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12)),
                              child:
                                  Image.network(model.image!, fit: BoxFit.fill),
                            ),
                          ),
                          if (model.message != '') SizedBox(height: 8),
                          if (model.message != '')
                            Text(
                              model.message!,
                              style: TextStyle(color: AppColors.black),
                            ),
                        ],
                      )
                    : ShowChatVideo(
                        video: model.video!, message: model.message!)),
      );
}

class ShowChatVideo extends StatelessWidget {
  const ShowChatVideo({
    super.key,
    required this.video,
    required this.message,
  });
  final String video;
  final String message;
  @override
  Widget build(BuildContext context) {
    late VideoPlayerController videoController =
        VideoPlayerController.networkUrl(Uri.parse(video));
    videoController.initialize();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onLongPress: () {
            videoController.pause();
          },
          onTap: () {
            videoController.play();
          },
          child: SizedBox(
            height: 300.h,
            width: 300.w,
            child: Stack(
              children: [
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: VideoPlayer(videoController),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Icon(Icons.play_arrow),
                )
              ],
            ),
          ),
        ),
        if (message != '') SizedBox(height: 8),
        if (message != '')
          Text(
            message,
            style: TextStyle(color: AppColors.black),
          ),
      ],
    );
  }
}
