import 'package:flutter/material.dart';

class RepeatedCard extends StatelessWidget {
  const RepeatedCard({
    super.key,
    required this.prefix,
    this.onTap,
    this.subTitle,
    this.suffix,
    required this.title,
  });

  final String title;
  final String? subTitle;
  final IconData prefix;
  final IconData? suffix;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Card(
        elevation: 5,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Icon(
                prefix,
                size: 30,
              ),
              title: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontFamily: 'Dosis'),
              ),
              trailing: suffix == null ? Icon(Icons.arrow_right) : null,
            ),
          ),
        ),
      ),
    );
  }
}
