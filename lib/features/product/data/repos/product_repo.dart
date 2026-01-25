import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/features/product/data/models/product_model.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductModel>>> fetchAllProducts();
}
