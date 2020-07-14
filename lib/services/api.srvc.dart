import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
//final test = await http.post('http://localhost:3000/signup', body: {'email': _emailController.text, 'password': _passwordController.text});

class ApiServices {
  static post(data, {BuildContext ctx, BehaviorSubject repo}) async {
    _loading(ctx, true);
    await Future.delayed(Duration(seconds: 3));
    // request
    final response = data;

    _loading(ctx, false);
    if (repo != null && response != null) {
      repo.add([...repo.value, response]);
      return repo.value;
    }
    return data;
  }

  static getOne(int id, {BuildContext ctx, BehaviorSubject repo}) async {
    _loading(ctx, true);
    await Future.delayed(Duration(seconds: 3));
    // request
    final response = repo == null ? [] : repo.value[id];

    _loading(ctx, false);
    return response;
  }

  static Future<T> getMany<T>(
      {dynamic filter, BuildContext ctx, BehaviorSubject<T> repo}) async {
    print('get ' + ctx.toString());

    _loading(ctx, true);
    await Future.delayed(Duration(seconds: 3));
    // request
    final response = repo == null ? [] : repo.value;

    _loading(ctx, false);
    return response;
  }

  static _loading(BuildContext context, bool loading) {
    if (context == null) {
      return;
    }
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
