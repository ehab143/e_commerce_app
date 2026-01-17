import 'package:flutter/material.dart';

class BottomNavigationBars extends StatelessWidget {
  const BottomNavigationBars({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xffF8DADA),
      currentIndex: 0,
      onTap: (index) {
        // غير الشاشة هنا
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'shopping Cart',
        ),
      ],
    );
  }
}
