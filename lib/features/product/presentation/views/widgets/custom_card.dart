import 'package:e_commerce_app/core/utilis/app_routes.dart';
import 'package:e_commerce_app/features/product/data/manager/cubits/favourites_cubit/favourites_cubit.dart';
import 'package:e_commerce_app/features/product/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(
          context,
        ).push(AppRouter.kProductDetailsView, extra: productModel);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 30,
                  offset: Offset(-4, 4),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5.0,
                  vertical: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productModel.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            '\r${productModel.price}\$',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<FavouritesCubit>(
                              context,
                            ).toggleFavourite(productModel);
                          },
                          icon: BlocBuilder<FavouritesCubit, FavouritesState>(
                            builder: (context, state) {
                              // القيمة الافتراضية
                              bool isFavorite = false;
                              // التحقق من الحالة ومن وجود المنتج
                              if (state is FavouritesSuccess) {
                                isFavorite = state.products.contains(
                                  productModel,
                                );
                              }
                              return Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorite ? Colors.red : Colors.grey,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            right: 28,
            bottom: 130,
            child: Image.network(
              productModel.imageUrl,
              width: 130,
              height: 130,
            ),
          ),
        ],
      ),
    );
  }
}
