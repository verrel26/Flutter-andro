class UserModel {
  int id;
  String name;
  String email;
  String username;
  String token;
  String profilePhotoUrl;

  // Konstruktor dengan required parameter
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.token,
    required this.profilePhotoUrl,
  });

  // Named constructor untuk inisialisasi dari JSON
  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['user']['id'],
        name = json['user']['name'],
        email = json['user']['email'],
        username = json['user']['username'],
        token = json['access_token'],
        profilePhotoUrl = json['user']['profile_photo_url'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'username': username,
        'token': token,
        'profilePhotoUrl': profilePhotoUrl,
      };
}
