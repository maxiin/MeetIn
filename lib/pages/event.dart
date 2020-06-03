import 'dart:ui';

import 'package:events_app/components/selectImg.dart';
import 'package:events_app/entities/event.dart';
import 'package:events_app/utils/colors.dart';
import 'package:events_app/utils/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '../repository.dart';

class EventPage extends StatefulWidget {
  EventPage() : super();

  @override
  EventState createState() => EventState();
}

class EventState extends State<EventPage> {
  var repo = new Repository();
  Event _event = new Event();

  EventState() {
    repo.events.listen((value) {
      setState(() {
        _event = value[0];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final header = Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32)),
          child: SelectImg(type: SelectType.full),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 8,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.0),
                    color: clearTintColor,
                  ),
                  child: TitleText(_event.name)
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: FloatingActionButton(
                    onPressed: () {},
                    child: SvgPicture.asset('assets/defaults/female-avatar.svg'),
                    shape: borderRadius,
                    mini: true,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );

    return Scaffold(
      body: ListView(
        children: <Widget>[
          header
        ],
      ),
    );
  }

}