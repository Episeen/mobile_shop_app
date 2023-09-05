class BestSeller {
  final int id;
  final bool isFavorites;
  final String title;
  final int price;
  final int discount;
  late final String picture;

  BestSeller({
    required this.id,
    required this.isFavorites,
    required this.title,
    required this.price,
    required this.discount,
    required this.picture,
  });

  factory BestSeller.fromJson(Map<String, dynamic> json) {
    return BestSeller(
      id: json['id'],
      isFavorites: json['is_favorites'],
      title: json['title'],
      price: json['price_without_discount'],
      discount: json['discount_price'],
      picture: json['picture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'is_favorites': isFavorites,
      'title': title,
      'price_without_discount': price,
      'discount_price': discount,
      'picture': picture,
    };
  }
}

// "id": 111,
// "is_favorites": true,
// "title": "Samsung Galaxy s20 Ultra",
// "price_without_discount": 1500,
// "discount_price": 1047,
// "picture": "https://shop.gadgetufa.ru/ima
