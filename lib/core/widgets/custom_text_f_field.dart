import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.labelText,
    this.prefixIcon,
    this.autofocus,
    this.keyboardType,
    this.onSaved,
    this.hintText,
    this.height,
    this.onFieldSubmitted,
  });

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final bool? autofocus;
  final void Function(String?)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final TextInputType? keyboardType;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        cursorColor: Colors.blue,
        autofocus: autofocus ?? false,
        decoration: InputDecoration(
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          labelText: labelText,
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.displaySmall,
          labelStyle: TextStyle(color: Colors.blue),
          prefixIconColor: Colors.blue,
          border: outlineInputBorder(),
          focusedBorder: outlineInputBorder(),
        ),
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
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
