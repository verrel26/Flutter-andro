import 'package:myapp/models/product_model.dart';

class CartModel {
  int? id;
  ProductModel? product;
  int? quantity;

  CartModel({
    this.id,
    this.product,
    this.quantity = 1,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = ProductModel.fromJson(json['product']);
    quantity = json['quantity'] ?? 1;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product?.toJson(),
      'quantity': quantity,
    };
  }

  // Menambahkan rumus untuk total harga barang
  double getTotalPrice() {
    return product!.price! * quantity!;
  }
}
