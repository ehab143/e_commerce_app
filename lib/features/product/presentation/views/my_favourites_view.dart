import 'package:flutter/material.dart';

import 'widgets/my_favourites_view_body.dart';

class MyFavouritesView extends StatelessWidget {
  const MyFavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8DADA),

      appBar: AppBar(
        backgroundColor: Color(0xffF8DADA),
        centerTitle: true,
        title: Text(
          'My Favourites',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(child: MyFavouritesViewBody()),
    );
  }
}
