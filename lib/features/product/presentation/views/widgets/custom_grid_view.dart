import 'package:e_commerce_app/features/product/data/models/product_model.dart';
import 'package:flutter/material.dart';

import 'custom_card.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key, required this.products});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),

      clipBehavior: Clip.none,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 30,
        childAspectRatio: 1.5 / 2.3,
      ),
      itemBuilder: (context, index) {
        return CustomCard(productModel: products[index]);
      },
      itemCount: products.length,
    );
  }
}
