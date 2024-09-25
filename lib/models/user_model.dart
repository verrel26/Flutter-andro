class UserModel {
  int id;
  String name;
  String email;
  String username;
  String profilePhotoUrl;
  String token;

  // Konstruktor dengan required parameter
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.profilePhotoUrl,
    required this.token,
  });

  // Named constructor untuk inisialisasi dari JSON
  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['user']['id'],
        name = json['user']['name'],
        email = json['user']['email'],
        username = json['user']['username'] ?? 'username',
        token = json['access_token'],
        profilePhotoUrl = json['user']['profile_photo_url'];

  // Konversi objek ke JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'token': token,
      'profilePhotoUrl': profilePhotoUrl,
    };
  }
}
