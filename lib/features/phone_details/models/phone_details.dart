class PhoneDetails {
  List<String> image;
  bool favorite;
  String title;
  double rating;
  String cpu;
  String camera;
  String ssd;
  String sd;
  List<String> color;
  List<String> capacity;
  int price;

  PhoneDetails({
    required this.image,
    required this.favorite,
    required this.title,
    required this.rating,
    required this.cpu,
    required this.camera,
    required this.ssd,
    required this.sd,
    required this.color,
    required this.capacity,
    required this.price,
  });

  factory PhoneDetails.fromJson(Map<String, dynamic> json) {
    print(json);
    return PhoneDetails(
      image: (json['images'] as List).map((e) => e as String).toList(),
      favorite: json['is_favorites'],
      title: json['title'],
      rating: json['rating'],
      cpu: json['CPU'],
      camera: json['camera'],
      ssd: json['ssd'],
      sd: json['sd'],
      color: (json['color']  as List).map((e) => e as String).toList(),
      capacity: (json['capacity']  as List).map((e) => e as String).toList(),
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "images": image,
      "is_favorites": favorite,
      "title": title,
      "rating": rating,
      "CPU": cpu,
      "camera": camera,
      "ssd": ssd,
      "sd": sd,
      "color": color,
      "capacity": capacity,
      "price": price,
    };
  }
}
// "_id": "612a529bd943be7d000794b6",
// "images": [
// "https://images.samsung.com/my/smartphones/galaxy-note20/buy/005-galaxynote20-mysticbronze-mo-720.jpg"
// ],
// "is_favorites": true,
// "title": "Samsung Note 20 Ultra",
// "rating": 3.5,
// "CPU": "Exynos 990",
// "camera": "108,12 mp",
// "ssd": "8 GB",
// "sd": "256 GB",
// "color": [
// "#772D03",
// "#010035"
// ],
// "capacity": [
// "128 GB",
// "256 gb"
// ],
// "price": 1500
