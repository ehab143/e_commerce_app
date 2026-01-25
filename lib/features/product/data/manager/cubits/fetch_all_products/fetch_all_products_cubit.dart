import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/product/data/models/product_model.dart';
import 'package:e_commerce_app/features/product/data/repos/product_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'fetch_all_products_state.dart';

class FetchAllProductsCubit extends Cubit<FetchAllProductsState> {
  FetchAllProductsCubit(this.productRepo) : super(FetchAllProductsInitial());
  final ProductRepo productRepo;

  Future<void> fetchAllProducts() async {
    emit(FetchAllProductsLoading());
    var result = await productRepo.fetchAllProducts();

    result.fold(
      (failure) {
        emit(FetchAllProductsFailure(failure.errMessage));
      },

      (products) {
        emit(FetchAllProductsSuccess(products));
      },
    );
  }
}
