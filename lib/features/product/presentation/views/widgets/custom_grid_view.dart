import 'package:flutter/material.dart';

import 'custom_card.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key});

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
        return CustomCard();
      },
      itemCount: 10,
    );
  }
}
