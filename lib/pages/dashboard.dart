import 'dart:async';

import 'package:events_app/components/eventCard.dart';
import 'package:events_app/entities/event.dart';
import 'package:events_app/services/event.srvc.dart';
import 'package:events_app/utils/colors.dart';
import 'package:events_app/utils/design.dart';
import 'package:flutter/material.dart';

import '../repository.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage() : super();

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<DashboardPage> {
  var repo = new Repository();
  StreamSubscription _eventListener;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    if (_eventListener != null) {
      _eventListener.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    EventService.getMany(ctx: context);

    final header = Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TitleText('Upcoming Events'),
          FloatingActionButton(
            onPressed: () {},
            child: Image.asset('assets/images/undraw_female_avatar.png'),
            shape: borderRadius,
            mini: true,
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      body: StreamBuilder<List<Event>>(
        stream: this.repo.events.asBroadcastStream(),
        builder: (BuildContext context, AsyncSnapshot<List<Event>> events) {
          List<Widget> children = [header];
          if (events.data != null && events.data.isNotEmpty) {
            for (Event event in events.data) {
              children.add(DailyEvent(
                  event: event,
                  open: () {
                    Navigator.of(context).pushNamed('/event', arguments: event);
                  }));
            }
          }
          return ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: children);
        },
      ),
    );
  }
}
