import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:phone_selling_app/features/cart/models/cart_model.dart';
import 'package:phone_selling_app/features/cart/models/product_model.dart';
import 'package:phone_selling_app/features/home/models/main_model.dart';
import 'package:phone_selling_app/utils/app_constants.dart';

import '../../features/phone_details/models/phone_details.dart';

class Api {
  Future<List<MainModel>> fetchMainData() async {

    final uri = Uri.parse(AppConstants.url + 'main');
    final response = await http.get(uri, headers: AppConstants.headers);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return (json as List).map((e) => MainModel.fromJson(e)).toList();
    }
    else {
      throw Exception('Error fetching phones models');
    }
  }

  Future<List<Product>> fetchProducts() async {

    final uri = Uri.parse(AppConstants.url + 'mycart');
    final response = await http.get(uri, headers: AppConstants.headers);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final result = (json as List).map((e) => CartModel.fromJson(e)).toList();
      return result.first.products;
    }
    else {
      throw Exception('Error fetching products');
    }
  }
  
  Future<PhoneDetails> fetchPhoneDetails() async {
    final uri = Uri.parse(AppConstants.url + 'productdetails');
    final response = await http.get(uri, headers: AppConstants.headers);
    if (response.statusCode == 200) {
      print(0);
      final json = jsonDecode(response.body) as List;
      print(1);
      final result = PhoneDetails.fromJson(json[0]);
      print(2);
      return result;
    }
    else  {
      throw Exception('Error fetching phone details');
    }
}
}
