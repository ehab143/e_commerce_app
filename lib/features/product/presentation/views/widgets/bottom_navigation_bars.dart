import 'package:e_commerce_app/features/product/presentation/views/my_cart_view.dart';
import 'package:e_commerce_app/features/product/presentation/views/my_favourites_view.dart';
import 'package:e_commerce_app/features/product/presentation/views/products_view.dart';
import 'package:flutter/material.dart';

class BottomNavigationBars extends StatefulWidget {
  const BottomNavigationBars({super.key});

  @override
  State<BottomNavigationBars> createState() => _BottomNavigationBarsState();
}

class _BottomNavigationBarsState extends State<BottomNavigationBars> {
  int selectedIndex = 0;

  static const List<Widget> pages = [
    ProductsView(),
    MyFavouritesView(),
    MyCartView(),
  ];

  void onTap(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xffF8DADA),
        currentIndex: selectedIndex,
        onTap: onTap,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'shopping Cart',
          ),
        ],
      ),
    );
  }
}
