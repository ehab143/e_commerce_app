import 'package:e_commerce_app/features/product/presentation/views/widgets/products_view_body.dart';
import 'package:flutter/material.dart';

import 'widgets/bottom_navigation_bars.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF8DADA),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              width: 50,
              height: 50,
              child: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            ),
          ),
        ],

        title: Text(
          'Match Your Style',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Color(0xffF8DADA),
      bottomNavigationBar: BottomNavigationBars(),
      body: ProductsViewBody(),
    );
  }
}
