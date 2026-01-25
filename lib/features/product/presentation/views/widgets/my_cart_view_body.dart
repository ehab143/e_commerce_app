import 'package:flutter/material.dart';

import 'cart_list_view.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Expanded(child: CartListView())]);
  }
}
