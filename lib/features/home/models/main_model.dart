import 'best_seller.dart';
import 'home_store.dart';

class MainModel {
  final List<HomeStore> homeStores;
  final List<BestSeller> bestSellers;

  MainModel({required this.homeStores, required this.bestSellers});

  factory MainModel.fromJson(Map<String, dynamic> json) {
    return MainModel(
      homeStores: (json['home_store'] as List).map((e) => HomeStore.fromJson(e)).toList(),
      bestSellers: (json['best_seller'] as List).map((e) => BestSeller.fromJson(e)).toList(),
    );
  }
}
