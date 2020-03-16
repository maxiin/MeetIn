import 'package:events_app/utils/colors.dart';
import 'package:events_app/utils/design.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateCard extends StatelessWidget {
  final Function onPressed;
  final DateTime date;

  DateCard({@required this.date, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final smallMon = () => new DateFormat('MMM').format(date);
    final day = () => new DateFormat('d').format(date);

    return Container(
      color: primaryColor,
      height: bigButton,
      width: bigButton,
      child: FlatButton(
        onPressed: onPressed,
        padding: EdgeInsets.only(top: 8, bottom: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            MainText(smallMon(), color: Colors.white),
            TitleText(day(), color: Colors.white),
          ],
        ),
      ),
    );
  }
}