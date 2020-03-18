import 'package:events_app/utils/colors.dart';
import 'package:events_app/utils/design.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateCard extends StatelessWidget {
  final Function onPressed;
  final DateTime date;
  final bool showHour;

  DateCard({@required this.date, @required this.onPressed, this.showHour = false});

  @override
  Widget build(BuildContext context) {
    final smallMon = () => new DateFormat('MMM').format(date);
    final day = () => new DateFormat('d').format(date);
    final time = () => new DateFormat('hh:mm').format(date);

    List<Widget> texts() {
      final list = new List<Widget>();
      list.addAll([
        MainText(smallMon(), color: Colors.white),
        TitleText(day(), color: Colors.white),
      ]);
      if (showHour) {
        list.add(ClearText(time(), color: Colors.white));
      }
      return list;
    }

    return Container(
      color: primaryColor,
      height: bigButton,
      width: bigButton,
      child: FlatButton(
        onPressed: onPressed,
        padding: EdgeInsets.only(top: 2, bottom: 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: texts(),
        ),
      ),
    );
  }
}