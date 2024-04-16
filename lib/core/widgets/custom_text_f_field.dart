import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.labelText,
    this.prefixIcon,
    this.autofocus,
  });

  final TextEditingController? controller;
  final String? labelText;
  final IconData? prefixIcon;
  final bool? autofocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.blue,
      autofocus: autofocus ?? false,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.blue),
        prefixIconColor: Colors.blue,
        border: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue, width: 2),
      borderRadius: BorderRadius.circular(5),
    );
  }
}
