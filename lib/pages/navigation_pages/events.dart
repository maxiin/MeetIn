import 'dart:async';

import 'package:events_app/components/event-card.dart';
import 'package:events_app/cubit/event_cubit.dart';
import 'package:events_app/entities/event.dart';
import 'package:events_app/pages/event_page.dart';
import 'package:events_app/utils/colors.dart';
import 'package:events_app/utils/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventsPage extends StatefulWidget {
  EventsPage() : super();

  @override
  EventsPageState createState() => EventsPageState();
}

class EventsPageState extends State<EventsPage> {
  StreamSubscription _eventListener;
  final List<Event> _events = new List();

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
    final cubit = EventCubit();

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
        body: Column(
          children: [
            header,
            SizedBox(
                height: 64,
                child: ListView.builder(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    shrinkWrap: false,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 2,
                        shadowColor: secondaryColor,
                        color: primaryColor,
                        child: SizedBox(
                          height: 64,
                          width: 64,
                          child: Center(
                            child: Icon(randomIcon()),
                          ),
                        ),
                      );
                    })),
            BlocBuilder<EventCubit, EventState>(
                cubit: cubit,
                builder: (BuildContext context, EventState data) {
                  if (data.events != null && data.events.length > 0) {
                    _events.addAll(data.events);
                  }

                  switch (data.runtimeType) {
                    case EventInitial:
                      _events.clear();
                      cubit.loadEvents();
                      break;
                    case EventLoaded:
                      _events.addAll(data.events);
                      break;
                  }

                  final _length = _events.length > 0
                      ? _events.length
                      : 1; // If no events, show only the loading
                  return Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.fromLTRB(8, 16, 8, 8),
                        scrollDirection: Axis.vertical,
                        itemCount: _length,
                        itemBuilder: (BuildContext context, int index) {
                          print(data.runtimeType);
                          print(data.events.length);
                          if (data.events.length == 0 && index + 1 == _length) {
                            return Center(child: CircularProgressIndicator());
                          } else if (index + 1 == _length) {
                            cubit.loadEvents();
                          }
                          return DailyEvent(
                              event: _events[index],
                              open: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EventPage(_events[index])));
                              });
                        }),
                  );
                }),
          ],
        ));
  }
}
