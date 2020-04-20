import 'package:flutter/material.dart';

Map<int, Color> swatch = {
  50:Color.fromRGBO(255,128,139, .1),
  100:Color.fromRGBO(255,128,139, .2),
  200:Color.fromRGBO(255,128,139, .3),
  300:Color.fromRGBO(255,128,139, .4),
  400:Color.fromRGBO(255,128,139, .5),
  500:Color.fromRGBO(255,128,139, .6),
  600:Color.fromRGBO(255,128,139, .7),
  700:Color.fromRGBO(255,128,139, .8),
  800:Color.fromRGBO(255,128,139, .9),
  900:Color.fromRGBO(255,128,139, 1),
};

MaterialColor primaryMaterialColor = new MaterialColor(0xffff808b, swatch);
Color primaryColor = new Color(0xffff808b);
Color secondaryColor = new Color(0xff7a4170);
Color errorColor = new Color(0xffc9c95f);
Color tint = new Color(0x44000000);

Color clearColor = Colors.white;
Color clearTintColor = Colors.white70;
Color darkColor = Colors.black54;
Color backgroundColor = Colors.white;