import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({super.key, required this.text,this.onTap});

 final String text;
 final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: Theme.of(context).textTheme.labelSmall,
        recognizer: TapGestureRecognizer()
          ..onTap = onTap,
      ),
    );
  }
}
