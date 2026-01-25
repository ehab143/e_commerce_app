part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartSuccess extends CartState {
  final List<ProductModel> products;
  const CartSuccess(this.products);
  @override
  List<Object> get props => [products];
}

final class CartFailure extends CartState {
  final String errMessage;
  const CartFailure(this.errMessage);
  @override
  List<Object> get props => [errMessage];
}
