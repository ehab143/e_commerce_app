import 'package:flutter/material.dart';

import 'widgets/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8DADA),

      appBar: AppBar(
        backgroundColor: Color(0xffF8DADA),
        centerTitle: true,
        title: Text(
          'My Cart',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: MyCartViewBody(),
    );
  }
}
