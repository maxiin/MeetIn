import 'package:events_app/entities/event.dart';
import 'package:events_app/utils/colors.dart';
import 'package:events_app/utils/design.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DailyEvent extends StatelessWidget {
  DailyEvent({this.event, this.open});

  final Event event;
  final Function open;

  @override
  Widget build(BuildContext context) {
    final formattedDate = () => new DateFormat('h:mm a').format(event.date);

    final time = Row(
      children: <Widget>[
        Icon(
          Icons.access_time,
          size: textSize,
          color: clearColor,
        ),
        SizedBox(width: 8),
        ClearText(formattedDate(), color: clearColor),
      ],
    );

    final title = MainText(event.name, color: clearColor);

    final location = Row(
      children: <Widget>[
        Icon(
          Icons.place,
          size: textSize,
          color: clearColor,
        ),
        SizedBox(width: 8),
        ClearText(event.placeName, color: clearColor),
      ],
    );

    final statusIcon = () {
      var icon;
      switch (event.status) {
        case EventStatus.going:
          icon = Icons.done;
          break;
        case EventStatus.interested:
          icon = Icons.star;
          break;
        default:
          icon = Icons.check_box_outline_blank;
      }
      return Icon(
        icon,
        color: clearColor,
        size: textSize,
      );
    };

    final statusText = () {
      switch (event.status) {
        case EventStatus.going:
          return ButtonText('Going');
          break;
        case EventStatus.interested:
          return ButtonText('Interested');
          break;
        default:
          return ButtonText('Open');
      }
    };

    final attendButton = SizedBox(
      height: buttonHeight,
      width: cardWidth,
      child: RaisedButton.icon(
        shape: borderRadius,
        onPressed: () => {},
        color: secondaryColor,
        icon: statusIcon(),
        label: statusText(),
      ),
    );

    return Container(
      width: cardWidth,
      margin: EdgeInsets.only(right: 8, left: 8, top: 8),
      child: Stack(
        children: <Widget>[
          SizedBox(
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              onPressed: open,
              padding: EdgeInsets.only(left: 24, top: 24, bottom: 24),
              color: primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[time, title, location, SizedBox(height: 10)],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: attendButton,
          ),
        ],
      ),
    );
  }
}
