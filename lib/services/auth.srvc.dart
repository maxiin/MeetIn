import 'dart:developer';

import 'package:flutter/material.dart';
import 'api.srvc.dart';

class AuthService extends ApiServices {
  static Future<bool> login(String email, String password,
      {BuildContext ctx}) async {
    await ApiServices.post({email, password}, ctx: ctx);

    if (email.isNotEmpty && password.isNotEmpty) {
      return true;
    }
    return false;
  }

  static signup() {}
}
