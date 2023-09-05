class Product {
  final String title;
  final String image;
  final int price;

  Product({
    required this.title,
    required this.image,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'],
      price: json['price'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'image': image,
    };
  }
}
