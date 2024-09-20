import 'dart:convert';
import 'package:myapp/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'https://0ee1-103-141-74-10.ngrok-free.app/api';

  Future<UserModel> register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    var url = Uri.parse('$baseUrl/register'); // Ubah string URL menjadi Url
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password, // Ganti '=' dengan ':'
    });

// Menyesuaikan dengan ket di postman (POST atau GET)
    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    // print(response.statusCode);
    // print(response.body);
    print(jsonDecode(response.body)['data']);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      // UserModel user = UserModel.fromJson(data['user']);
      UserModel user = UserModel.fromJson(data);
      // user.token = 'Bearer ${data['access_token']}'; // Spasi setelah Bearer

      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }

// LOGIN
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    var url = Uri.parse('$baseUrl/login'); // Ubah string URL menjadi Url
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password, // Ganti '=' dengan ':'
    });

// Menyesuaikan dengan ket di postman (POST atau GET)
    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(jsonDecode(response.body)['data']);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data);

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }
}
