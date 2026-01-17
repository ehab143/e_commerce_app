import 'package:e_commerce_app/constants.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(backgroundColor: kPrimaryColor, content: Text(message)),
  );
}
