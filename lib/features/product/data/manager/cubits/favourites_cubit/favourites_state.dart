part of 'favourites_cubit.dart';

sealed class FavouritesState extends Equatable {
  const FavouritesState();

  @override
  List<Object> get props => [];
}

final class FavouritesInitial extends FavouritesState {}

final class FavouritesLoading extends FavouritesState {}

final class FavouritesSuccess extends FavouritesState {
  final List<ProductModel> products;

  const FavouritesSuccess(this.products);

  @override
  List<Object> get props => [products];
}

final class FavouritesFailure extends FavouritesState {
  final String errMessage;

  const FavouritesFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}
