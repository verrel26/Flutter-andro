import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/models/category_model.dart';

class CategoryService {
  String baseUrl = 'https://0ee1-103-141-74-10.ngrok-free.app/api';

  Future<List<CategoryModel>> getCategories() async {
    var url = Uri.parse('$baseUrl/categories');
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<CategoryModel> categories = [];

      for (var item in data) {
        categories.add(CategoryModel.fromJson(item));
      }

      return categories;
    } else {
      throw Exception('Gagal mengambil data');
    }
  }
}
