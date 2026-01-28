import 'package:e_commerce_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:e_commerce_app/core/utilis/app_routes.dart';
import 'package:e_commerce_app/features/product/data/models/product_model.dart';

class ProductsSearchDelegate extends SearchDelegate {
  final List<ProductModel> allProducts; // القائمة الكاملة

  ProductsSearchDelegate({required this.allProducts});

  @override
  ThemeData appBarTheme(BuildContext context) {
    // نأخذ الثيم الحالي للتطبيق ونعدل عليه
    final ThemeData theme = Theme.of(context);

    return theme.copyWith(
      // 1. لون خلفية شريط البحث + لون الأيقونات
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xffF8DADA), // نفس لون تطبيقك
        iconTheme: IconThemeData(
          color: Colors.black,
        ), // لون سهم الرجوع وزر المسح
        elevation: 0, // إزالة الظل (اختياري)
      ),

      // 2. لون النص الذي تكتبه والمؤشر
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.grey),
        border: InputBorder.none,
      ),

      // 3. لون النص المكتوب فعلياً
      textTheme: theme.textTheme.copyWith(
        titleLarge: const TextStyle(color: Colors.black, fontSize: 18),
      ),

      // 4. لون مؤشر الكتابة (الخط اللي بيعمل وميض)
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.black,
      ),
    );
  }

  // 1. زر المسح (X) الذي يظهر يمين شريط البحث
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = ''; // مسح النص المكتوب
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  // 2. زر العودة (سهم الرجوع) يسار الشريط
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null); // إغلاق البحث
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  // 3. عرض النتائج (عند الضغط على enter)
  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context); // نعرض نفس الاقتراحات
  }

  // 4. الاقتراحات (تتغير تلقائياً مع كل حرف تكتبه)
  @override
  Widget buildSuggestions(BuildContext context) {
    // --- اللوجيك الحقيقي هنا ---

    // تصفية القائمة بناءً على النص المكتوب (query)
    // toLowerCase: عشان البحث ميهتمش بالحروف الكبيرة والصغيرة
    List<ProductModel> filteredList = allProducts.where((product) {
      return product.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    // إذا لم توجد نتائج
    if (filteredList.isEmpty) {
      return Container(
        color: Color(0xffF8DADA),
        child: const Center(child: Text("No products found")),
      );
    }
    return Container(
      color: Color(0xffF8DADA),
      child: ListView.builder(
        clipBehavior: Clip.none,
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          var item = filteredList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0,
                        blurRadius: 30,
                        offset: Offset(-3, 3),
                      ),
                    ],
                  ),
                  width: 100,
                  height: 150,
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(
                        context,
                      ).push(AppRouter.kProductDetailsView, extra: item);
                    },
                    child: Card(
                      elevation: 3,
                      child: Image.network(item.imageUrl, fit: BoxFit.contain),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '${item.price}\$',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
    // عرض القائمة المفلترة
    // return ListView.builder(
    //   itemCount: filteredList.length,
    //   itemBuilder: (context, index) {
    //     var item = filteredList[index];
    //     return ListTile(
    //       leading: Image.network(item.imageUrl, width: 50, fit: BoxFit.contain),
    //       title: Text(item.title, maxLines: 1, overflow: TextOverflow.ellipsis),
    //       subtitle: Text('${item.price}\$'),
    //       onTap: () {
    //         // عند الضغط على النتيجة، نذهب للتفاصيل
    //         GoRouter.of(
    //           context,
    //         ).push(AppRouter.kProductDetailsView, extra: item);
    //       },
    //     );
    //   },
    // );
  }
}
