class CategoryModel {
  int? id;
  String? name;

  // Konstruktor dengan required parameter
  CategoryModel({
    this.id,
    this.name,
  });

  // Named constructor untuk inisialisasi dari JSON
  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
