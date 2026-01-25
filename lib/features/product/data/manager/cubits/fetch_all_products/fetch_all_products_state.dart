part of 'fetch_all_products_cubit.dart';

@immutable
sealed class FetchAllProductsState extends Equatable {
  const FetchAllProductsState();

  @override
  List<Object> get props => [];
}

final class FetchAllProductsInitial extends FetchAllProductsState {}

final class FetchAllProductsLoading extends FetchAllProductsState {}

final class FetchAllProductsSuccess extends FetchAllProductsState {
  final List<ProductModel> products;

  const FetchAllProductsSuccess(this.products);
}

final class FetchAllProductsFailure extends FetchAllProductsState {
  final String errMessage;
  const FetchAllProductsFailure(this.errMessage);
}
