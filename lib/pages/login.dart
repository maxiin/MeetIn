import 'package:events_app/utils/colors.dart';
import 'package:events_app/utils/design.dart';
import 'package:events_app/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dashboard.dart';

class LoginPage extends StatefulWidget {
  LoginPage() : super();

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginPage> {
  String email = "";
  String password = "";
  bool _obscureText = true;
  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext ctx) {
    final logo = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SvgPicture.asset('assets/images/logo-dark.svg',
          height: 44,
          color: primaryColor,
        ),
        TitleText('Meet', color: primaryColor),
        TitleText('In', color: secondaryColor),
      ],
    );

    final welcomeText = Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: TitleText('Welcome!'),
            ),
          ],
        ),
        DescriptionText('MeetIn is the brand new online event app where you can invite friends and meet new people online!',
          color: Colors.black54
        ),
      ],
    );

    final emailInput = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      validator: validateEmail,
      decoration: inputStyle(hint: 'Email'),
    );

    final passwordInput = TextFormField(
      autofocus: false,
      obscureText: _obscureText,
      validator: (pass) => lengthValidator(pass, 8, null),
      decoration: passwordInputStyle(hint: 'Password', toggle: _toggle),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          // if (form.currentState.validate()) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashboardPage()));
          // }
        },
        padding: EdgeInsets.all(12),
        color: primaryColor,
        child: ButtonText('Log In'),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
            child: Opacity(
              opacity: 0.2,
              child: SvgPicture.asset('assets/images/party.svg', alignment: Alignment.topCenter)
            ),
          ),
          Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                logo,
                welcomeText,
                SizedBox(height: 48.0),
                Form(
                  key: form,
                  child: Column(
                    children: <Widget>[
                      emailInput,
                      SizedBox(height: 8.0),
                      passwordInput,
                      SizedBox(height: 16.0),
                      loginButton,
                    ],
                  ),
                ),
                forgotLabel
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future login(context) async {
    return Future.delayed(Duration(seconds: 10)).then((context) => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashboardPage()),
        )
      }
    );
  }
}
