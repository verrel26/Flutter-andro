import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:myapp/models/user_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  String baseUrl = 'https://7ac9-103-141-74-10.ngrok-free.app/api';

  Future<List<ProductService>> getProducts() async {
    var url = Uri.parse('$baseUrl/register');
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonEncode(response.body)['data']['data'];
      List<productModel> products = [];
      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }

      return products;
    } else {
      throw Exception('Gagal mengambil data');
    }
  }
}
