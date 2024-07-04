import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moga/core/local/app_local.dart';
import 'package:moga/core/utils/app_strings.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.title,
    this.onYesTap,
  });
  final String title;
  final void Function()? onYesTap;
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .displayMedium!
            .copyWith(fontFamily: 'Dosis'),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: SizedBox(
            height: 50,
            child: Center(
              child: Text(
                Strings.no.tr(context),
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontFamily: 'Dosis'),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: onYesTap,
          child: SizedBox(
            height: 50,
            child: Center(
              child: Text(
                Strings.yes.tr(context),
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontFamily: 'Dosis'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
