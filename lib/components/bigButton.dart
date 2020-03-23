import 'package:events_app/utils/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class BigButton extends StatelessWidget {
  final String title;
  final String description;
  final Color color;
  final Function onPressed;
  final bool noMargin;

  BigButton({@required this.title, @required this.description, @required this.color, @required this.onPressed, this.noMargin = false});

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   margin: EdgeInsets.fromLTRB(noMargin ? 0 : 10, 0, 0, 0),
    //   color: color,
    //   height: bigButton,
    //   width: double.infinity,
    //   child: FlatButton(
    //     onPressed: onPressed,
    //     child: Container(
    //       padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: <Widget>[
    //           Column(
    //             mainAxisAlignment: MainAxisAlignment.spaceAround,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: <Widget>[
    //               MainText(title, color: Colors.white),
    //               ClearText(description, color: Colors.white),
    //             ]
    //           ),
    //           IconButton(icon: Icon(Icons.arrow_forward_ios, color: Colors.white), onPressed: () {}),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return Container(
      margin: EdgeInsets.fromLTRB(noMargin ? 0 : 10, 0, 0, 0),
      color: color,
      height: bigButton,
      width: double.infinity,
      child: Slidable(  
        actionPane: SlidableBehindActionPane(),
        actionExtentRatio: 1,
        child: Container(
          color: color,
          padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
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
        secondaryActions: <Widget>[
          SlideAction(
            closeOnTap: false,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(10, 10, 10  , 10),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                decoration: inputStyle(hint: 'Email'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}