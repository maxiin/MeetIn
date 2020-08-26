import 'package:events_app/utils/colors.dart';
import 'package:events_app/utils/design.dart';
import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  final String title;
  final String description;
  final Color color;
  final Function onPressed;
  final bool noMargin;

  BigButton({@required this.title, @required this.description, @required this.color, @required this.onPressed, this.noMargin = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(noMargin ? 0 : 10, 0, 0, 0),
      color: color,
      height: bigButton,
      width: double.infinity,
      child: FlatButton(
        onPressed: onPressed,
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MainText(title, color: clearColor),
                  ClearText(description, color: clearColor),
                ]
              ),
              IconButton(icon: Icon(Icons.arrow_forward_ios, color: clearColor), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}