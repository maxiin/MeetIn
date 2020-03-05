import 'package:events_app/utils/colors.dart';
import 'package:events_app/utils/validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Container(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Center(
                child: Image.asset('assets/images/logo.png')),
            ),
            Expanded(
              flex: 2,
              child: Form(
                key: form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: validateEmail,
                            decoration: new InputDecoration(
                              errorStyle: TextStyle(
                                color: errorColor
                              ),
                              errorBorder: new OutlineInputBorder(
                                borderSide: BorderSide(color: errorColor)
                              ),
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                              filled: true,
                              hintStyle: new TextStyle(color: Colors.grey[600]),
                              labelText: 'Email',
                              hintText: 'jon@doe.com',
                              fillColor: Colors.white70,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: TextFormField(
                            obscureText: _obscureText,
                            validator: (pass) => lengthValidator(pass, 8, null),
                            decoration: new InputDecoration(
                              errorStyle: TextStyle(
                                color: errorColor
                              ),
                              errorBorder: new OutlineInputBorder(
                                borderSide: BorderSide(color: errorColor)
                              ),
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                              filled: true,
                              labelText: 'Password',
                              fillColor: Colors.white70,
                              suffixIcon:  IconButton(
                                onPressed: _toggle,
                                icon: Icon(Icons.remove_red_eye),
                              ),
                            ),
                          ),
                        ),
                      ]
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: OutlineButton(
                          child: new Text("Button text"),
                          onPressed: () {
                            if (form.currentState.validate()) {
                              Scaffold.of(ctx)
                                .showSnackBar(SnackBar(content: Text('Submit')));
                            }
                          },
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                          borderSide: BorderSide(color: primaryColor),
                        )
                      )
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
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
