import 'package:flutter/material.dart';

class ApiServices {
  static loading(BuildContext context, bool loading) {
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
