import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/utilis/api_service.dart';
import 'package:e_commerce_app/features/product/data/repos/product_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setUpServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<ProductRepoImpl>(
    ProductRepoImpl(getIt.get<ApiService>()),
  );
}
