import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:e_commerce_app/features/product/data/models/product_model.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  // نبدأ بحالة نجاح وقائمة فارغة
  FavouritesCubit() : super(FavouritesInitial());

  // المتغير الخاص بتخزين المنتجات
  final List<ProductModel> favouriteProducts = [];

  // دالة التبديل (إضافة/حذف)
  void toggleFavourite(ProductModel product) {
    if (favouriteProducts.contains(product)) {
      favouriteProducts.remove(product);
    } else {
      favouriteProducts.add(product);
    }
    // تحديث الحالة بنسخة جديدة من القائمة
    emit(FavouritesSuccess(List.from(favouriteProducts)));
  }

  // دالة مساعدة للتحقق من الزر (اختيارية لأننا نتحقق في الـ UI)
  bool isFavourite(ProductModel product) {
    return favouriteProducts.contains(product);
  }
}
