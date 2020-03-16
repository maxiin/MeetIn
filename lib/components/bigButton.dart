import 'package:events_app/utils/design.dart';
import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  final String title;
  final String description;
  final Color color;
  final Function onPressed;

  BigButton({@required this.title, @required this.description, @required this.color, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
      color: color,
      height: bigButton,
      width: double.infinity,
      child: FlatButton(
        onPressed: onPressed,
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MainText(title, color: Colors.white),
                  ClearText(description, color: Colors.white),
                ]
              ),
              IconButton(icon: Icon(Icons.arrow_forward_ios, color: Colors.white), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}