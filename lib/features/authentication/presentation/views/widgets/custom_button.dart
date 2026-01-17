import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/utilis/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onTap});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        width: double.infinity,
        height: 50,
        child: Text(text, style: Styles.textStyle18),
      ),
    );
  }
}
