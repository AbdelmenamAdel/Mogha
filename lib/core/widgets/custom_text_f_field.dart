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
    this.radius,
    this.bsc,
    this.onFieldSubmitted,
    this.bgc,
    this.suffix,
    this.onChanged,
  });

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final Widget? suffix;
  final bool? autofocus;
  final void Function(String?)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final double? height;
  final double? radius;
  final Color? bsc;
  final Color? bgc;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: bgc,
        borderRadius: BorderRadius.circular(radius ?? 0),
      ),
      child: TextFormField(
        onChanged: onChanged,
        keyboardType: keyboardType,
        controller: controller,
        cursorColor: bsc ?? Colors.blue,
        autofocus: autofocus ?? false,
        // style: TextStyle(color: Colors.blue,),
        decoration: InputDecoration(
          constraints: BoxConstraints(minHeight: 50),
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          labelText: labelText,
          hintText: hintText,
          suffixIcon: suffix,
          hintStyle: Theme.of(context).textTheme.displaySmall,
          labelStyle: TextStyle(color: Colors.blue),
          prefixIconColor: Colors.blue,
          border: outlineInputBorder(),
          enabledBorder: outlineInputBorder(),
          focusedBorder: outlineInputBorder(),
        ),
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
        maxLines: 2,
        scrollPadding: EdgeInsets.all(0),
        scrollPhysics: BouncingScrollPhysics(),
        minLines: 1,
      ),
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: bsc ?? Colors.blue, width: 2),
      borderRadius: BorderRadius.circular(radius ?? 5),
    );
  }
}
