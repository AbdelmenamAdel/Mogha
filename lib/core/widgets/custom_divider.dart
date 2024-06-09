import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.thickness});
  final double? thickness;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Divider(
        height: 0,
        thickness: thickness,
        color: Theme.of(context).dividerColor,
      ),
    );
  }
}
