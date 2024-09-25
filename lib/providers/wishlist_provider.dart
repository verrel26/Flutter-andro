import 'package:flutter/foundation.dart';
import 'package:myapp/models/product_model.dart';

class WishlistProvider with ChangeNotifier {
  // Menggunakan List<ProductModel> untuk menyimpan produk wishlist
  List<ProductModel> _wishlist = [];

  // Getter untuk wishlist
  List<ProductModel> get wishlist => _wishlist;

  // Setter untuk wishlist
  set wishlist(List<ProductModel> wishlist) {
    _wishlist = wishlist;
    notifyListeners();
  }

  // Menambah atau menghapus product dari wishlist
  setProduct(ProductModel product) {
    if (!isWishlist(product)) {
      _wishlist.add(product);
      notifyListeners();
    } else {
      _wishlist.removeWhere((element) => element.id == product.id);
      // return false; // gunakan huruf kecil pada element
    }

    notifyListeners();
  }

  // Mengecek apakah produk ada di wishlist
  bool isWishlist(ProductModel product) {
    return _wishlist.indexWhere((element) => element.id == product.id) != -1;
  }
}
