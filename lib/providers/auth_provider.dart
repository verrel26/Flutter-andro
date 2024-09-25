import 'package:flutter/foundation.dart';
import 'package:myapp/models/user_model.dart';
import 'package:myapp/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  set user(UserModel? user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      UserModel user = await AuthService().register(
        name: name,
        username: username,
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

// LOGIN
  Future<bool> login({
    required email,
    required password,
  }) async {
    try {
      UserModel user = await AuthService().login(
        email: email,
        password: password,
      );
      if (kDebugMode) {
        print(user);
      }
      _user = user;
      return true;
    } catch (e) {
      print(e);

      return false;
    }
  }
}
