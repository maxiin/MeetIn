import 'package:events_app/cubit/navigation_cubit.dart';
import 'package:events_app/pages/event.dart';
import 'package:events_app/pages/nav_page.dart';
import 'package:events_app/repositories/event_repository.dart';
import 'package:events_app/services/auth.srvc.dart';
import 'package:events_app/utils/colors.dart';
import 'package:events_app/utils/design.dart';
import 'package:events_app/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dashboard.dart';

class LoginPage extends StatefulWidget {
  LoginPage() : super();

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginPage> {
  bool _obscureText = true;
  final form = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext ctx) {
    final logo = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          child: Image.asset('assets/images/logo-dark.png', height: 44),
          onTap: () {
            _emailController.text = 'testing@email.com';
            _passwordController.text = '12345678';
          },
        ),
        TitleText('Meet', color: primaryColor),
        TitleText('In', color: secondaryColor),
      ],
    );

    final background = Padding(
      padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
      child: Opacity(
          opacity: 0.2,
          child: SizedBox(
            child: Image.asset('assets/images/undraw_page.png'),
            /* child: SvgPicture.asset('assets/images/party.svg',
                alignment: Alignment.topCenter), */
            height: 200,
            width: 1080,
          )),
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
        DescriptionText(
            'MeetIn is the brand new online event app where you can invite friends and meet new people online!',
            color: darkOpacityColor),
      ],
    );

    final emailInput = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      validator: validateEmail,
      decoration: inputStyle(hint: 'Email'),
      controller: _emailController,
    );

    final passwordInput = TextFormField(
      autofocus: false,
      obscureText: _obscureText,
      validator: (pass) => lengthValidator(pass, 8, null),
      decoration: passwordInputStyle(hint: 'Password', toggle: _toggle),
      controller: _passwordController,
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () async {
          if (form.currentState.validate()) {
            bool res = await AuthService.login(
                _emailController.text, _passwordController.text,
                ctx: ctx);
            if (res) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider(
                          create: (context) =>
                              BottomNavigationCubit(EventRepository()),
                          child: NavigationPage())));
            }
          }
        },
        padding: EdgeInsets.all(12),
        color: primaryColor,
        child: ButtonText('Log In'),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: darkOpacityColor),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          background,
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
            MaterialPageRoute(builder: (context) => EventPage()),
          )
        });
  }
}
