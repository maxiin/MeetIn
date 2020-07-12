import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//final test = await http.post('http://localhost:3000/signup', body: {'email': _emailController.text, 'password': _passwordController.text});
import 'api.dart';

class AuthService {
  static Future<bool> login(String email, String password,
      {BuildContext context}) async {
    ApiServices.loading(context, true);
    await Future.delayed(Duration(seconds: 3));
    ApiServices.loading(context, false);

    if (email.isNotEmpty && password.isNotEmpty) {
      return true;
    }
    return false;
  }

  static signup() {}
}
