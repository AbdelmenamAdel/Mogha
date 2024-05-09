import 'package:flutter/material.dart';

void showHeroImage({
  required BuildContext context,
  required String image,
  required String tag,
}) {
  showDialog(
    context: context,
    builder: (context) => Center(
      child: Hero(
        tag: tag,
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}
