import 'package:events_app/utils/colors.dart';
import 'package:events_app/utils/design.dart';
import 'package:events_app/utils/validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        Text('Meet',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 32
          ),
        ),
        Text('In',
          style: TextStyle(
            color: secondaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 32
          ),
        ),
      ],
    );

    final welcomeText = Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Text('Welcome!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        Text('MeetIn is the brand new online event app where you can invite friends and meet new people online!',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black54,
          ),
          maxLines: 5,
          textAlign: TextAlign.left,
        ),
      ],
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      validator: validateEmail,
      decoration: buttonDecoration('Email'),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: _obscureText,
      validator: (pass) => lengthValidator(pass, 8, null),
      decoration: buttonPasswordDecoration('Password', _toggle),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          if (form.currentState.validate()) {
            Scaffold.of(ctx)
              .showSnackBar(SnackBar(content: Text('Submit')));
          }
        },
        padding: EdgeInsets.all(12),
        color: primaryColor,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
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
      body: Center(
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
                  email,
                  SizedBox(height: 8.0),
                  password,
                  SizedBox(height: 16.0),
                  loginButton,
                ],
              ),
            ),
            forgotLabel
          ],
        ),
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  login() {
    
  }
}
