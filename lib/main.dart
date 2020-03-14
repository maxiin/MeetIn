import 'package:events_app/pages/login.dart';
import 'package:events_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Future<String> token() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  Future<StatefulWidget> openLogin(context) async {
    return Future.delayed(Duration(seconds: 4)).then((_){
      return Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())).then((widget) => widget);
    });
  }

  // Root.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: primaryMaterialColor,
      ),
      home: MyHome()
      // home: new Scaffold(
      //   resizeToAvoidBottomPadding: true,
      //   body: MyHome()
        // body: openLogin(context),
        // body: this.logedInRedirect(),
        // body: Center(
        //   child: 
        //   SvgPicture.asset('assets/images/logo-dark.svg',
        //     height: 44,
        //     color: primaryColor,
        //   ),
        // ),
      // ),
    );
  }

  logedInRedirect() {
    return FutureBuilder(
      future: token(),
      builder: (BuildContext ctx, AsyncSnapshot<String> snapshot) {
        final double statusBarHeight = MediaQuery.of(ctx).padding.top;

        if (!snapshot.data.isNotEmpty) {
          return Padding(
            padding: new EdgeInsets.only(top: statusBarHeight),
            child: LoginPage(),
          );
        }
      },
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())),
      builder: (BuildContext ctx, AsyncSnapshot<dynamic> snapshot) {
        print(snapshot.data);
        if(snapshot.hasData) {
          return snapshot.data;
        }
        return Center(
          child: SvgPicture.asset('assets/images/logo-dark.svg',
            height: 200,
            color: primaryColor,
          ),
        );
      },
    );
  }
}