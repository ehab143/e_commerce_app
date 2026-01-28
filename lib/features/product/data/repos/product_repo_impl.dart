import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/core/utilis/api_service.dart';
import 'package:e_commerce_app/features/product/data/models/product_model.dart';
import 'package:e_commerce_app/features/product/data/repos/product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  final ApiService apiService;

  ProductRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<ProductModel>>> fetchAllProducts() async {
    try {
      var data = await apiService.get(endPoints: 'products');

      List<ProductModel> products = [];
      //List<dynamic> dataList = responseData['products'];
      for (var item in data['products']) {
        try {
          products.add(ProductModel.fromjson(item));
        } catch (e) {
          products.add(ProductModel.fromjson(item));
        }
      }
      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
