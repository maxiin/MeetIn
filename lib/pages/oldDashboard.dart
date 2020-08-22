import 'dart:math';

import 'package:events_app/entities/event.dart';
import 'package:events_app/utils/colors.dart';
import 'package:events_app/utils/design.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:events_app/components/bigButton.dart';
import 'package:intl/intl.dart';

final weekdays = List.generate(7, (index) => index)
    .map((value) => DateFormat(DateFormat.WEEKDAY).format(DateTime.now()
        .subtract(Duration(days: DateTime.now().weekday - 1))
        .add(Duration(days: value))))
    .toList();

build(BuildContext context) {
  List<Widget> createDayList() {
    List<Widget> childs = [];
    weekdays.asMap().forEach((index, value) => {
          childs.add(Container(
            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: FlatButton(
              onPressed: () => {},
              child: Column(
                children: <Widget>[
                  Text(
                    value,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: mainTextSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '•',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ))
        });
    return childs;
  }

  final dayList = Container(
    height: buttonHeight,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: createDayList(),
    ),
  );

  final eventList = Container(
    height: 80.0,
    /*child: StreamBuilder<List<Event>>(
          stream: this.repo.events.asBroadcastStream(),
          builder: (BuildContext context, AsyncSnapshot<List<Event>> events) {
            List<Widget> children = [];
            if (events.data != null && events.data.isNotEmpty) {
              for (Event event in events.data) {
                children.add(DailyEvent(
                    event: event,
                    open: () {
                      Navigator.of(context)
                          .pushNamed('/event', arguments: event);
                    }));
              }
            }
            return ListView(
                scrollDirection: Axis.horizontal, children: children);
          },
        )*/
  );

  final hostingHeader = Padding(
    padding: EdgeInsets.all(20),
    child: TitleText('Event you are hosting'),
  );

  DateTime fromNow() {
    final year =
        random.integer(DateTime.now().year + 1, min: DateTime.now().year);
    final minMonth = year == DateTime.now().year ? DateTime.now().month : 1;
    final month = random.integer(13, min: minMonth);
    final minDay = month == DateTime.now().month ? DateTime.now().day : 1;
    final day = random.integer(32, min: minDay);
    return DateTime(
      year, // year
      month, // month
      day, // day
      random.integer(24), // hour
      random.integer(60), // minute
      random.integer(60), // second
      random.integer(1000), // millisecond
      random.integer(1000), // microsecond
    );
  }

  return ListView(shrinkWrap: true, children: <Widget>[
    SizedBox(height: 24),
    dayList,
    // eventList,
    Container(
      height: 230,
      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: eventList,
    ),
    RaisedButton(
      onPressed: () {
        final event = new Event(
            id: new Random().nextInt(100),
            date: fromNow(),
            name: faker.conference.name(),
            latitude: faker.address.lat(min: -24, max: -23),
            longitude: faker.address.lng(min: -47, max: -46),
            address: faker.address.streetAddress(),
            placeName: faker.address.streetName(),
            language: faker.person.language(),
            status: EventStatus.interested);
        /*this.repo.events.add([...this.repo.events.value, event]);*/
      },
    ),
    hostingHeader,
    Padding(
      padding: EdgeInsets.only(left: 20),
      child: ClearText('You are not hosting any event yet'),
    ),
    SizedBox(height: 24),
    BigButton(
      title: 'Create Public Events',
      description: 'Anyone can see the event and search for it.',
      color: primaryColor,
      onPressed: () {
        Navigator.of(context).pushNamed('/new');
      },
    ),
    SizedBox(height: 20),
    BigButton(
      title: 'Create Public Events',
      description: 'Anyone can see the event and search for it.',
      color: secondaryColor,
      onPressed: () {
        Navigator.of(context).pushNamed('/new');
      },
    ),
    SizedBox(height: 20),
  ]);
}
