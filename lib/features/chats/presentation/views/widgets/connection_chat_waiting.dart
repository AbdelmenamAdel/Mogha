import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:moga/core/utils/app_images.dart';
import 'package:moga/core/widgets/custom_text_f_field.dart';

class ConnectionChatWaiting extends StatelessWidget {
  const ConnectionChatWaiting({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: true,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AppImages.bg,
            ), // Replace with your image path
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(child: SizedBox()),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      onFieldSubmitted: (value) {},
                      height: 50,
                      hintText: 'Write a message....',
                      bsc: Theme.of(context).scaffoldBackgroundColor,
                      radius: 18,
                      bgc: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        IconBroken.Send,
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
