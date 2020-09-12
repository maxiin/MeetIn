import 'dart:math';

import 'package:events_app/utils/debugValues/category_list.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
import 'debugValues/icon_list.dart';

final cardWidth = 170.0;
final cardHeight = 230.0;
final buttonHeight = 44.0;
final bigButton = 88.0;
final selectImgFullHeight = 210.0;

final titleSize = 32.0;
final mainTextSize = 18.0;
final textSize = 15.0;
final titleWeight = FontWeight.bold;
final descWeight = FontWeight.w300;
final borderRadius = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(24),
);

IconData randomIcon() {
  return IconData(iconList[Random().nextInt(iconList.length)],
      fontFamily: 'MaterialIcons');
}

String randomCategory() {
  return categoryList[Random().nextInt(categoryList.length)];
}

class TitleText extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign align;

  TitleText(this.text, {this.color, this.align = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return new Text(
      text,
      style:
          TextStyle(color: color, fontWeight: titleWeight, fontSize: titleSize),
      textAlign: align,
    );
  }
}

/// Bigger and stronger texts but not as important as titles
class MainText extends StatelessWidget {
  final String text;
  final Color color;
  final int lines;

  MainText(this.text, {this.color, this.lines});

  @override
  Widget build(BuildContext context) {
    return new Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: titleWeight,
        fontSize: mainTextSize,
      ),
      maxLines: lines == null ? 1 : lines,
      overflow: TextOverflow.ellipsis,
    );
  }
}

/// small and light text for simple info
class ClearText extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign align;
  final int lines;

  ClearText(this.text,
      {this.color, this.align = TextAlign.start, this.lines = 99});

  @override
  Widget build(BuildContext context) {
    return new Text(
      text,
      style:
          TextStyle(color: color, fontWeight: descWeight, fontSize: textSize),
      textAlign: align,
      overflow: TextOverflow.ellipsis,
      maxLines: lines,
    );
  }
}

/// General text
class DescriptionText extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign align;

  DescriptionText(this.text, {this.color, this.align});

  @override
  Widget build(BuildContext context) {
    return new Text(
      text,
      style: TextStyle(color: color, fontSize: mainTextSize),
      textAlign: align == null ? TextAlign.start : align,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class ButtonText extends StatelessWidget {
  final String text;

  ButtonText(this.text);

  @override
  Widget build(BuildContext context) {
    return new Text(
      text,
      style: TextStyle(color: clearColor, fontSize: textSize),
    );
  }
}

InputDecoration inputStyle({@required String hint}) {
  return InputDecoration(
    hintText: hint,
    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
    fillColor: clearTintColor,
    errorStyle: TextStyle(color: secondaryColor),
    focusedErrorBorder: new OutlineInputBorder(
      borderRadius: BorderRadius.circular(32.0),
      borderSide: BorderSide(color: secondaryColor, width: 2),
    ),
    errorBorder: new OutlineInputBorder(
      borderRadius: BorderRadius.circular(32.0),
      borderSide: BorderSide(color: secondaryColor),
    ),
  );
}

InputDecoration passwordInputStyle(
    {@required String hint, @required void Function() toggle}) {
  return InputDecoration(
    hintText: 'Password',
    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
    fillColor: clearTintColor,
    suffixIcon: IconButton(
      onPressed: toggle,
      icon: Icon(Icons.remove_red_eye),
    ),
    errorStyle: TextStyle(color: secondaryColor),
    focusedErrorBorder: new OutlineInputBorder(
      borderRadius: BorderRadius.circular(32.0),
      borderSide: BorderSide(color: secondaryColor, width: 2),
    ),
    errorBorder: new OutlineInputBorder(
      borderRadius: BorderRadius.circular(32.0),
      borderSide: BorderSide(color: secondaryColor),
    ),
  );
}
