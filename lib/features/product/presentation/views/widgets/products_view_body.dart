import 'package:e_commerce_app/features/product/data/manager/cubits/fetch_all_products/fetch_all_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_grid_view.dart';

class ProductsViewBody extends StatelessWidget {
  ProductsViewBody({super.key});

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchAllProductsCubit, FetchAllProductsState>(
      listener: (context, state) {
        if (state is FetchAllProductsFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        if (state is FetchAllProductsSuccess) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    CustomGridView(products: state.products),
                    SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          );
        } else if (state is FetchAllProductsFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
