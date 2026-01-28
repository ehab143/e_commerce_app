import 'package:e_commerce_app/features/product/data/manager/cubits/fetch_all_products/fetch_all_products_cubit.dart';
import 'package:e_commerce_app/features/product/presentation/views/widgets/products_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/products_search_delegate.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF8DADA),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              width: 50,
              height: 50,
              child: IconButton(
                onPressed: () {
                  final cubit = BlocProvider.of<FetchAllProductsCubit>(context);
                  if (cubit.state is FetchAllProductsSuccess) {
                    final products =
                        (cubit.state as FetchAllProductsSuccess).products;
                    showSearch(
                      context: context,
                      delegate: ProductsSearchDelegate(allProducts: products),
                    );
                  }
                },
                icon: Icon(Icons.search),
              ),
            ),
          ),
        ],

        title: Text(
          'Match Your Style',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Color(0xffF8DADA),

      body: ProductsViewBody(),
    );
  }
}
