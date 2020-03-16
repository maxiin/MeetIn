import 'package:flutter/material.dart';

import 'colors.dart';

final cardWidth = 170.0;
final cardHeight = 230.0;
final buttonHeight = 40.0;
final bigButton = 80.0;

final titleSize = 32.0;
final mainTextSize = 18.0;
final textSize = 15.0;
final titleWeight = FontWeight.bold;
final descWeight = FontWeight.w300;
final borderRadius = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(24),
);

class TitleText extends StatelessWidget {
  final String text;
  final Color color;

  TitleText(this.text,{this.color});

  @override
  Widget build(BuildContext context) {
    return new Text(text,
      style: TextStyle(
        color: color,
        fontWeight: titleWeight,
        fontSize: titleSize
      ),
      textAlign: TextAlign.start,
    );
  }
}

// Bigger and stronger texts but not as important as titles
class MainText extends StatelessWidget {
  final String text;
  final Color color;

  MainText(this.text,{this.color});

  @override
  Widget build(BuildContext context) {
    return new Text(text,
      style: TextStyle(
        color: color,
        fontWeight: titleWeight,
        fontSize: mainTextSize,
      ),
    );
  }
}

// small and light text for simple info
class ClearText extends StatelessWidget {
  final String text;
  final Color color;

  ClearText(this.text,{this.color});

  @override
  Widget build(BuildContext context) {
    return new Text(text,
      style: TextStyle(
        color: color,
        fontWeight: descWeight,
        fontSize: textSize
      ),
      textAlign: TextAlign.left,
    );
  }
}

// General text
class DescriptionText extends StatelessWidget {
  final String text;
  final Color color;

  DescriptionText(this.text,{this.color});

  @override
  Widget build(BuildContext context) {
    return new Text(text,
      style: TextStyle(
        color: color,
        fontSize: mainTextSize
      ),
    );
  }
}

class ButtonText extends StatelessWidget {
  final String text;

  ButtonText(this.text);

  @override
  Widget build(BuildContext context) {
    return new Text(text,
      style: TextStyle(
        color: Colors.white,
        fontSize: textSize
      ),
    );
  }
}

InputDecoration inputStyle({@required String hint}) {
  return InputDecoration(
    hintText: hint,
    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
    fillColor: Colors.white70,
    errorStyle: TextStyle(
      color: secondaryColor
    ),
    focusedErrorBorder:new OutlineInputBorder(
      borderRadius: BorderRadius.circular(32.0),
      borderSide: BorderSide(color: secondaryColor, width: 2),
    ),
    errorBorder: new OutlineInputBorder(
      borderRadius: BorderRadius.circular(32.0),
      borderSide: BorderSide(color: secondaryColor),
    ),
  );
}

InputDecoration passwordInputStyle({@required String hint, @required void Function() toggle}) {
  return InputDecoration(
    hintText: 'Password',
    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
    fillColor: Colors.white70,
    suffixIcon:  IconButton(
      onPressed: toggle,
      icon: Icon(Icons.remove_red_eye),
    ),
    errorStyle: TextStyle(
      color: secondaryColor
    ),
    focusedErrorBorder:new OutlineInputBorder(
      borderRadius: BorderRadius.circular(32.0),
      borderSide: BorderSide(color: secondaryColor, width: 2),
    ),
    errorBorder: new OutlineInputBorder(
      borderRadius: BorderRadius.circular(32.0),
      borderSide: BorderSide(color: secondaryColor),
    ),
  );
}