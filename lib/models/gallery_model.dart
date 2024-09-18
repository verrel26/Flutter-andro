class GalleryModel {
  int? id;
  String? url;
  // Konstruktor dengan required parameter
  GalleryModel({
    this.id,
    this.url,
  });

  // Named constructor untuk inisialisasi dari JSON
  GalleryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
    };
  }
}
