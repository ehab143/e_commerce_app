import 'package:e_commerce_app/core/utilis/app_routes.dart';
import 'package:e_commerce_app/features/authentication/presentation/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Image.asset(
          'assets/images/logo.png',
          width: double.infinity,
          height: 400,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Text(
                'Product name  ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                '\$99.99',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'This is a detailed description of the product. It provides all the necessary information that a customer might need before making a purchase decision.',
            style: TextStyle(fontSize: 16),
          ),
        ),
        SizedBox(height: 80),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomButton(
            text: 'Add to Cart',
            onTap: () {
              GoRouter.of(context).push(AppRouter.kMyCartView);
            },
          ),
        ),
      ],
    );
  }
}
