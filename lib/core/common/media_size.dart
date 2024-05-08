import 'package:flutter/material.dart';

extension MediaQuqryExtention on BuildContext {
  double width(double divide) {
    return MediaQuery.of(this).size.width * divide;
  }

  double height(double divide) {
    return MediaQuery.of(this).size.height * divide;
  }
}
