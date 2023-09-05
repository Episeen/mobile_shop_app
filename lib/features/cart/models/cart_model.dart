import 'package:phone_selling_app/features/cart/models/product_model.dart';

class CartModel {
  final List<Product> products;
  final int total;
  final String delivery;

  CartModel({required this.delivery, required this.total, required this.products});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      total: json['total'],
      delivery: json['Delivery'],
      products: (json['basket'] as List).map((e) => Product.fromJson(e)).toList(),
    );
  }
}
