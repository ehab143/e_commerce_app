import 'package:e_commerce_app/features/product/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<dynamic> ShowDialog(BuildContext context, ProductModel productModel) {
  return showDialog(
    context: context,
    barrierDismissible: false, // يمنع إغلاق الـ Dialog عند الضغط خارجه
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // حواف دائرية للـ Dialog
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min, // عشان الـ Dialog يكون على قد المحتوى
          children: [
            // --- الأيقونة الخضراء ---
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 60, // حجم كبير
            ),
            const SizedBox(height: 10),
            const Text(
              "Done!",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              '${productModel.title} has been added to your cart.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          // --- زر الـ OK ---
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // لون الزر أخضر
                foregroundColor: Colors.white, // لون النص أبيض
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 12,
                ),
              ),
              onPressed: () {
                // الترتيب هنا مهم جداً:

                // 1. نقفل الـ Dialog الأول
                GoRouter.of(context).pop();

                // 2. بعدها نرجع للصفحة الرئيسية
                GoRouter.of(context).pop();
              },
              child: const Text('OK', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      );
    },
  );
}
