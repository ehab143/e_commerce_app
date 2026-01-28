import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int id;
  final String title;
  final String price;
  final String imageUrl;
  final String description;
  final String category;

  const ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.category,
  });

  factory ProductModel.fromjson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'].toString(),
      imageUrl: jsonData['thumbnail'],
      description: jsonData['description'],
      category: jsonData['category'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    title,
    price,
    imageUrl,
    description,
    category,
  ];
}
