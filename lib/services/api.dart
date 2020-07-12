import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//final test = await http.post('http://localhost:3000/signup', body: {'email': _emailController.text, 'password': _passwordController.text});

class ApiServices {
  static post(data, {BuildContext ctx}) async {
    if (ctx != null) {
      _loading(ctx, true);
    }
    await Future.delayed(Duration(seconds: 3));
    if (ctx != null) {
      _loading(ctx, false);
    }
  }

  static _loading(BuildContext context, bool loading) {
    if (loading) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: CircularProgressIndicator(),
            );
          });
    } else {
      Navigator.pop(context);
    }
  }
}
