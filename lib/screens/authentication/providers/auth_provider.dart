// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../models/usermodel.dart';

class AuthProvider with ChangeNotifier {
  AuthProvider() {
    loadUser();
  }
  User? user;
  static User? currUser;
  final storage = const FlutterSecureStorage();
  final String USER_ID = 'user.id';
  final String USER_EMAIL = 'user.email';
  final String USER_TOKEN = 'user.token';

  saveUser(User user) {
    this.user = AuthProvider.currUser = user;
    storage.write(key: USER_ID, value: user.id);
    storage.write(key: USER_TOKEN, value: user.token);
    storage.write(key: USER_EMAIL, value: user.email);
    log('saved user');
    notifyListeners();
  }

  Future<User?> loadUser() async {
    Map<String, String> values = await storage.readAll();
    String? id = values[USER_ID];
    String? token = values[USER_TOKEN];
    String? email = values[USER_EMAIL];
    if (id != null && email != null && token != null) {
      user = AuthProvider.currUser = User(token: token, id: id, email: email);
      notifyListeners();
      log(id);
      log(token);
    }
    return user;
  }

  deleteUser() async {
    user = null;
    await storage.deleteAll();
    notifyListeners();
  }
}
