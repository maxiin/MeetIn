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
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Form(
              key: form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: validateEmail,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  TextFormField(
                    obscureText: _obscureText,
                    validator: (pass) => lengthValidator(pass, 8, null),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: IconButton(
                          onPressed: _toggle,
                          icon: Icon(Icons.remove_red_eye),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: RaisedButton(
                      onPressed: () {
                        if (form.currentState.validate()) {
                          Scaffold.of(ctx)
                            .showSnackBar(SnackBar(content: Text('Processing Data')));
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ),
                ],
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
