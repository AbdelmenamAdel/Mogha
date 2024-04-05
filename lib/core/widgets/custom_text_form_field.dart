import 'package:flutter/material.dart';
import 'package:moga/core/utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    this.validator,
    super.key,
    required this.hintText,
    this.icon,
    this.type = TextInputType.text,
    this.isPassword = false,
    this.onChanged,
    this.onSaved,
    this.onFieldSubmitted,
    this.controller,
    this.s_icon,
  });

  final bool isPassword;
  final TextInputType type;
  final IconData? icon;
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final IconData? s_icon;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: width / 8,
      width: width / 1.22,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: width / 30),
      decoration: BoxDecoration(
        color: AppColors.textField,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        onSaved: onSaved,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        style: TextStyle(color: AppColors.white.withOpacity(.9)),
        obscureText: isPassword,
        keyboardType: type,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.white.withOpacity(.7),
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          suffixIcon: Icon(s_icon),
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(.5),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
