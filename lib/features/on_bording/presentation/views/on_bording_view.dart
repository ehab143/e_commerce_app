import 'package:e_commerce_app/features/on_bording/presentation/views/widgets/on_bording_view_body.dart';
import 'package:flutter/material.dart';

class OnBordingView extends StatelessWidget {
  const OnBordingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8DADA),
      body: OnBordingViewBody(),
    );
  }
}
