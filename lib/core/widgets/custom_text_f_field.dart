import 'package:flutter/material.dart';
import 'package:moga/core/utils/app_colors.dart';

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
    this.validator,
    this.suffix,
    this.focus,
    this.checkOldPasswordValidation,
    this.onChanged,
  });

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final Widget? suffix;
  final bool? autofocus;
  final bool? focus;
  final bool? checkOldPasswordValidation;
  final void Function(String?)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
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
        validator: validator,
        onChanged: onChanged,
        keyboardType: keyboardType,
        controller: controller,
        cursorColor: bsc ?? Colors.blue,
        autofocus: autofocus ?? false,
        style: TextStyle(
          fontFamily: 'Dosis',
        ),
        // style: TextStyle(color: Colors.blue,),
        decoration: InputDecoration(
          constraints: BoxConstraints(minHeight: 50),
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          labelText: labelText,
          hintText: hintText,
          errorText: checkOldPasswordValidation == false
                  ? 'not valid old password'
                  : null,
          suffixIcon: suffix,
          hintStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontFamily: 'Dosis',
                letterSpacing: 2,
              ),
          labelStyle: TextStyle(
            color: bsc == null
                ? AppColors.blue
                : Theme.of(context).textTheme.displaySmall!.color,
            fontFamily: 'Dosis',
            letterSpacing: 2,
          ),
          prefixIconColor: Colors.blue,
          border: outlineInputBorder(),
          enabledBorder: outlineInputBorder(),
          focusedBorder:
              focus == true ? focusOutlineInputBorder() : outlineInputBorder(),
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
      borderSide: BorderSide(
        color: bsc ?? Colors.blue,
        width: 2,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(radius ?? 5),
    );
  }

  OutlineInputBorder focusOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: bsc ?? AppColors.blue,
        width: 3,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(21),
    );
  }
}
