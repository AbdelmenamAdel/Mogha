import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:moga/core/utils/app_colors.dart';
import 'package:moga/core/widgets/comment_widget.dart';
import 'package:moga/core/widgets/custom_text_form_field.dart';

class CommentsView extends StatelessWidget {
  const CommentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0, left: 24, right: 24, bottom: 24),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.bGL.withOpacity(.95),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          IconBroken.Heart,
                          size: 32,
                          color: AppColors.red,
                        ),
                        Icon(
                          IconBroken.Arrow___Right_2,
                          size: 32,
                          color: AppColors.textField,
                        )
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      IconBroken.Heart,
                      size: 32,
                      color: AppColors.grey,
                    ),
                  )
                ],
              ),
              //Divider
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Divider(
                  height: 0,
                  color: AppColors.textField,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CustomCommentWidget(
                          name: 'Men3em Ibn 3del',
                          comment:
                              'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              CustomTextFormField(
                hintText: 'write a comment...',
                showCursor: false,
                color: AppColors.grey,
                textColor: AppColors.black,
                s_icon: IconBroken.Send,
                s_color: AppColors.white,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
