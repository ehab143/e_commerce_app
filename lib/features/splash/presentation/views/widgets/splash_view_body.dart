import 'package:e_commerce_app/core/utilis/app_routes.dart';
import 'package:e_commerce_app/core/utilis/styles.dart';
import 'package:flutter/material.dart';
 import 'package:go_router/go_router.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 2),

          Image.asset('assets/images/logo.png', fit: BoxFit.contain),

          SizedBox(height: 160),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).go(AppRouter.kOnBordingView);
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(16),
              ),
              width: MediaQuery.of(context).size.width * 0.88,

              height: 50,
              child: Text('Let\'s Get Started', style: Styles.textStyle18),
            ),
          ),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}
