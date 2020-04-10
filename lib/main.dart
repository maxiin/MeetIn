import 'package:events_app/pages/login.dart';
import 'package:events_app/pages/dashboard.dart';
import 'package:events_app/pages/createEvent.dart';
import 'package:events_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      home: LoginPage(),
      routes: <String, WidgetBuilder> {
        '/login': (BuildContext context) => new LoginPage(),
        '/dash' : (BuildContext context) => new DashboardPage(),
        '/new' : (BuildContext context) => new CreateEvent(),
      },
    );
  }
}