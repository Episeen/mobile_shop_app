class HomeStore {
  final int id;
  final bool? isNew;
  final bool? isFavorites;
  final String title;
  final String subtitle;
  final String picture;
  final bool isBuy;

  HomeStore({
    required this.id,
    this.isNew,
    this.isFavorites,
    required this.title,
    required this.subtitle,
    required this.picture,
    required this.isBuy,
  });

  factory HomeStore.fromJson(Map<String, dynamic> json) {
    return HomeStore(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      picture: json['picture'],
      isBuy: json['is_buy'],
      isNew: json['is_new'],
      isFavorites: json['is_favorites'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'picture': picture,
      'is_buy': isBuy,
      'is_new': isNew,
      'is_favorites': isFavorites,
    };
  }
}

// "id": 1,
// "is_new": true,
// "is_favorites": true,
// "title": "Iphone 13",
// "subtitle": "Súper. Mega. Rápido.",
// "picture": "https://static.beeline.ru/upload/dpcupload/contents/342/12pro-456.jpg",
// "is_buy": true
