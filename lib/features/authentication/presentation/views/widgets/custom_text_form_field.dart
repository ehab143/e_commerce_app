import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.borderColor,
    this.focusedColor,
    this.hintStyle,
    this.onChanged,
    this.textStyle,
    this.textInputType,
    this.obscureText=false,
  });
  final String hintText;
  final Color borderColor;
  final Color? focusedColor;
  final TextStyle? hintStyle, textStyle;
  final void Function(String)? onChanged;
  final TextInputType? textInputType;
  final bool obscureText ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'field is required';
        } else {
          return null;
        }
      },
      obscureText: obscureText,
      keyboardType: textInputType,
      style: textStyle,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: focusedColor ?? borderColor),
        ),
      ),
    );
  }
}
