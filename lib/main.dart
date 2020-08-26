import 'package:events_app/pages/login.dart';
import 'package:events_app/utils/colors.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // Root.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: primaryMaterialColor,
        ),
        //home: LoginPage(),
        home: LoginPage());
  }
}
