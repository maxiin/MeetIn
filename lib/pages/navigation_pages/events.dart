import 'dart:async';

import 'package:events_app/components/event-card.dart';
import 'package:events_app/cubit/event_cubit.dart';
import 'package:events_app/entities/event.dart';
import 'package:events_app/pages/event_page.dart';
import 'package:events_app/services/event.srvc.dart';
import 'package:events_app/utils/colors.dart';
import 'package:events_app/utils/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository.dart';

class EventsPage extends StatefulWidget {
  EventsPage() : super();

  @override
  EventsPageState createState() => EventsPageState();
}

class EventsPageState extends State<EventsPage> {
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
                  switch (data.runtimeType) {
                    case EventInitial:
                      cubit.loadEvents();
                      return CircularProgressIndicator();
                    case EventLoading:
                      return CircularProgressIndicator();
                    case EventLoaded:
                      return Expanded(
                        child: ListView.builder(
                            padding: EdgeInsets.fromLTRB(8, 16, 8, 0),
                            scrollDirection: Axis.vertical,
                            itemCount: data.events.length,
                            itemBuilder: (BuildContext context, int index) {
                              return DailyEvent(
                                  event: data.events[index],
                                  open: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EventPage(data.events[index])));
                                  });
                            }),
                      );
                    default:
                      return Text('error');
                  }
                }),
          ],
        ));
  }
}
