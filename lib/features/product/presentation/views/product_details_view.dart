import 'package:e_commerce_app/features/product/data/models/product_model.dart';
import 'package:flutter/material.dart';

import 'widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF8DADA),
        title: Text(
          'Product Details',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xffF8DADA),

      body: SafeArea(child: ProductDetailsViewBody(productModel: productModel)),
    );
  }
}
