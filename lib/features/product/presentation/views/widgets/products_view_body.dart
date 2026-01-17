import 'package:flutter/material.dart';

import 'custom_grid_view.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              // SizedBox(height: 70),
              // Row(
              //   children: [
              //     Text(
              //       'Match Your Style',
              //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              //     ),
              //     Spacer(),
              //     Container(
              //       decoration: BoxDecoration(
              //         color: Colors.grey.withOpacity(0.2),
              //         borderRadius: BorderRadius.circular(12),
              //       ),
              //       width: 50,
              //       height: 50,
              //       child: IconButton(
              //         onPressed: () {},
              //         icon: Icon(Icons.search),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(height: 30),
              CustomGridView(),
              SizedBox(height: 80),
              
            ],
          ),
        ),
      ),
    );
  }
}
