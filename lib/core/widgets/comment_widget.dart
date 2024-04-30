import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moga/core/utils/app_colors.dart';

class CustomCommentWidget extends StatelessWidget {
  const CustomCommentWidget({
    super.key,
    required this.name,
    required this.comment,
  });

  final String name;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {},
          child: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(''),
          ),
        ),
        SizedBox(width: 5),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                  bottomLeft: Radius.circular(18)),
              color: AppColors.grey.withOpacity(.3)),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.6,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        name,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppColors.black,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    SizedBox(width: 2),
                    Icon(
                      Icons.verified,
                      color: Colors.blue,
                      size: 16,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 5),
                  child: Text(
                    comment,
                    style: TextStyle(color: AppColors.black),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Text(
                      '02:34',
                      style: TextStyle(
                        color: AppColors.black.withOpacity(.6),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
