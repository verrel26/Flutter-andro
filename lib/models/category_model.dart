import 'package:myapp/models/gallery_model.dart';

class CategoryModel {
  int? id;
  // String categories_id;
  String? name;
  double? price;
  String? description;
  String? tags;
  // CategoryModel? category;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<GalleryModel>? galleries;

  // Konstruktor dengan required parameter
  CategoryModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.tags,
    // this.category,
    this.createdAt,
    this.updatedAt,
    this.galleries,
  });

  // Named constructor untuk inisialisasi dari JSON
  CategoryModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        price = double.parse(json['price'].toString()),
        description = json['description'],
        tags = json['tags'];
  // category= CategoryModel.fromJson(json['category']);
  // galleries = (json['galleries'] as List)
  //   .map((gallery)=> GalleryModel.fromJson(gallery))
  //   .toList();
  // createdAt = DateTime.parse(json['created_at']);
  // updatedAt = DateTime.parse(json['updated_at']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'description': description,
        'tags': tags,
        // 'category': category?.toJson(),
        'galleries': galleries?.map((gallery) => gallery.toJson()).toList(),
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
