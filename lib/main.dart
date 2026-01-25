import 'package:e_commerce_app/core/utilis/app_routes.dart';
import 'package:e_commerce_app/core/utilis/service_locator.dart';
import 'package:e_commerce_app/features/authentication/data/cubits/auth_cubit/auth_cubit.dart';
import 'package:e_commerce_app/features/product/data/manager/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/product/data/manager/cubits/favourites_cubit/favourites_cubit.dart';
import 'package:e_commerce_app/features/product/data/manager/cubits/fetch_all_products/fetch_all_products_cubit.dart';
import 'package:e_commerce_app/features/product/data/repos/product_repo.dart';
import 'package:e_commerce_app/features/product/data/repos/product_repo_impl.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  setUpServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => FavouritesCubit()),
        BlocProvider(create: (context) => CartCubit()),

        BlocProvider(
          create: (context) =>
              FetchAllProductsCubit(getIt.get<ProductRepoImpl>())
                ..fetchAllProducts(),
        ),
      ],

      child: MaterialApp.router(
        color: Color(0xFFFCE4EC),
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          colorScheme: ColorScheme.light(),
        ),
      ),
    );
  }
}
