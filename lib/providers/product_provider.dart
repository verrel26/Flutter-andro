import 'package:flutter/foundation.dart';
import 'package:myapp/models/product_model.dart';
import 'package:myapp/models/user_model.dart';
import 'package:myapp/services/auth_service.dart';
import 'package:myapp/services/product_service.dart';

class ProductProvider with ChangeNotifier {
  List<productModel> _products = [];

  List<productModel> get products => _products;

  set products(List<productModel> products) {
    _products = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<productModel> products = await ProductService().getProducts();
    } catch (e) {
      print(e);
    }
  }
}
