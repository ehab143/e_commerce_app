import 'package:e_commerce_app/core/helper/show_dialog.dart';
import 'package:e_commerce_app/core/utilis/app_routes.dart';
import 'package:e_commerce_app/features/authentication/presentation/views/widgets/custom_button.dart';
import 'package:e_commerce_app/features/product/data/manager/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/product/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Image.network(
            productModel.imageUrl,
            width: double.infinity,
            height: 400,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              maxLines: 2,
              productModel.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '${productModel.price}\$',

              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              productModel.description,
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(height: 65),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                bool isInCart = false;
                if (state is CartSuccess) {
                  isInCart = state.products.contains(productModel);
                }

                return CustomButton(
                  text: 'Add to Cart',
                  onTap: () {
                    // 1. إضافة المنتج للسلة
                    BlocProvider.of<CartCubit>(context).addToCart(productModel);

                    // 2. إظهار الـ Dialog
                    ShowDialog(context, productModel);
                  },
                );
              },
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
