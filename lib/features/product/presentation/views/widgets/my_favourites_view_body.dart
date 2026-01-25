// import 'package:e_commerce_app/features/product/presentation/views/widgets/custom_card.dart';
// import 'package:flutter/material.dart';

// class MyFavouritesViewBody extends StatelessWidget {
//   const MyFavouritesViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column();
//   }
// }
import 'package:e_commerce_app/features/product/presentation/views/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/features/product/data/manager/cubits/favourites_cubit/favourites_cubit.dart';

class MyFavouritesViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesCubit, FavouritesState>(
      builder: (context, state) {
        if (state is FavouritesLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is FavouritesSuccess) {
          final products = state.products;
          return GridView.builder(
            itemCount: products.length,
            clipBehavior: Clip.none,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // عنصرين بجانب بعض
              crossAxisSpacing: 15,
              mainAxisSpacing: 30,
              childAspectRatio: 0.7, // نسبة الطول للعرض لضبط شكل الكارت
            ),
            itemBuilder: (context, index) {
              return CustomCard(productModel: products[index]);
            },
          );
        }
        return Center(child: Text('No favorites yet.'));
      },
    );
  }
}
