import 'package:e_commerce_app/features/authentication/presentation/views/login_view.dart';
import 'package:e_commerce_app/features/authentication/presentation/views/register_view.dart';
import 'package:e_commerce_app/features/authentication/presentation/views/reset_password_view.dart';
import 'package:e_commerce_app/features/on_bording/presentation/views/on_bording_view.dart';
import 'package:e_commerce_app/features/product/presentation/views/my_cart_view.dart';
import 'package:e_commerce_app/features/product/presentation/views/my_favourites_view.dart';
import 'package:e_commerce_app/features/product/presentation/views/product_details_view.dart';
import 'package:e_commerce_app/features/product/presentation/views/products_view.dart';
import 'package:e_commerce_app/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String kSplashView = '/';
  static const String kRegisterView = '/RegisterView';
  static const String kLoginView = '/LoginView';
  static const String kResetPassword = '/ResetPassword';
  static const String kProductsView = '/ProductsView';
  static const String kOnBordingView = '/OnBordingView';
  static const String kProductDetailsView = '/ProductDetailsView';
  static const String kMyCartView = '/MyCartView';
  static const String kMyFavouritesView = '/MyFavourites';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kMyFavouritesView,
        builder: (context, state) => const MyFavouritesView(),
      ),
      GoRoute(
        path: kMyCartView,
        builder: (context, state) => const MyCartView(),
      ),
      GoRoute(
        path: kProductDetailsView,
        builder: (context, state) => const ProductDetailsView(),
      ),
      GoRoute(
        path: kOnBordingView,
        builder: (context, state) => const OnBordingView(),
      ),
      GoRoute(
        path: kProductsView,
        builder: (context, state) => const ProductsView(),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(path: kLoginView, builder: (context, state) => const LoginView()),

      GoRoute(
        path: kResetPassword,
        builder: (context, state) => const ResetPasswordView(),
      ),
    ],
  );
}
