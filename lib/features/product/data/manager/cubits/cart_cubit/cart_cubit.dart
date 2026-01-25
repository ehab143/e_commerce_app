import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/product/data/models/product_model.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final List<ProductModel> cartProducts = [];

  void addToCart(ProductModel product) {
    if (!cartProducts.contains(product)) {
      cartProducts.add(product);
      emit(CartSuccess(List.from(cartProducts)));
    }
  }

  void removeFromCart(ProductModel product) {
    cartProducts.remove(product);
    emit(CartSuccess(List.from(cartProducts)));
  }

  bool isInCart(ProductModel product) {
    return cartProducts.contains(product);
  }
}
