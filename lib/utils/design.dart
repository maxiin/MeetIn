import 'package:flutter/material.dart';

import 'colors.dart';

InputDecoration buttonDecoration(String hint) {
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

InputDecoration buttonPasswordDecoration(String hint, void Function() toggle) {
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