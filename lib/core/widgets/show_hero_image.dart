import 'package:flutter/material.dart';

void showHeroImage(context, String image) {
  showDialog(
    context: context,
    builder: (context) => Center(
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
  );
}
