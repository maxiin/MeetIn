import 'dart:math';

import 'package:events_app/components/bigButton.dart';
import 'package:events_app/components/eventCard.dart';
import 'package:events_app/entities/event.dart';
import 'package:events_app/utils/colors.dart';
import 'package:events_app/utils/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../repository.dart';

final weekdays = List.generate(7, (index) => index)
  .map((value) => DateFormat(DateFormat.WEEKDAY)
  .format(DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1)).add(Duration(days: value))))
  .toList();
final events = [
  new Event(id: 1, date: new DateTime(2020, 3, 16, Random().nextInt(23), Random().nextInt(59)), name: 'RUKU\'s Annual Carnival', location: new EventLocation(name: 'Al Hamra Mall', address: 'Al Hamra Mall', lat: 0, lng: 0), status: EventStatus.interested),
  new Event(id: 8, date: new DateTime(2020, 3, 16, Random().nextInt(23), Random().nextInt(59)), name: 'Cindy & The Avengers', location: new EventLocation(name: 'Star Cineplax', address: 'Star Cineplax', lat: 0, lng: 0), status: EventStatus.going),
  new Event(id: 9, date: new DateTime(2020, 3, 16, Random().nextInt(23), Random().nextInt(59)), name: 'RUKU\'s Annual Carnival', location: new EventLocation(name: 'Al Hamra Mall', address: 'Al Hamra Mall', lat: 0, lng: 0), status: EventStatus.open),
  new Event(id: 2, date: new DateTime(2020, 3, 17, Random().nextInt(23), Random().nextInt(59)), name: 'Cindy & The Avengers', location: new EventLocation(name: 'Star Cineplax', address: 'Star Cineplax', lat: 0, lng: 0), status: EventStatus.interested),
  new Event(id: 3, date: new DateTime(2020, 3, 18, Random().nextInt(23), Random().nextInt(59)), name: 'RUKU\'s Annual Carnival', location: new EventLocation(name: 'Al Hamra Mall', address: 'Al Hamra Mall', lat: 0, lng: 0), status: EventStatus.going),
  new Event(id: 4, date: new DateTime(2020, 3, 19, Random().nextInt(23), Random().nextInt(59)), name: 'Cindy & The Avengers', location: new EventLocation(name: 'Star Cineplax', address: 'Star Cineplax', lat: 0, lng: 0), status: EventStatus.interested),
  new Event(id: 5, date: new DateTime(2020, 3, 20, Random().nextInt(23), Random().nextInt(59)), name: 'RUKU\'s Annual Carnival', location: new EventLocation(name: 'Al Hamra Mall', address: 'Al Hamra Mall', lat: 0, lng: 0), status: EventStatus.going),
  new Event(id: 6, date: new DateTime(2020, 3, 21, Random().nextInt(23), Random().nextInt(59)), name: 'Cindy & The Avengers', location: new EventLocation(name: 'Star Cineplax', address: 'Star Cineplax', lat: 0, lng: 0), status: EventStatus.interested),
  new Event(id: 7, date: new DateTime(2020, 3, 22, Random().nextInt(23), Random().nextInt(59)), name: 'RUKU\'s Annual Carnival', location: new EventLocation(name: 'Al Hamra Mall', address: 'Al Hamra Mall', lat: 0, lng: 0), status: EventStatus.open),
];

class DashboardPage extends StatefulWidget {
  DashboardPage() : super();

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<DashboardPage> {
  var repo = new Repository();

  DashboardState() {
    repo.update();
  }

  update() {
    setState(() {
      repo.update();
    });
  }

  @override
  Widget build(BuildContext context) {
    final header = Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TitleText('Upcoming Events'),
          FloatingActionButton(
            onPressed: () {},
            child: SvgPicture.asset('assets/defaults/female-avatar.svg'),
            shape: borderRadius,
            mini: true,
          ),
        ],
      ),
    );

    List<Widget> createDayList() {
      List<Widget> childs = [];
      weekdays.asMap().forEach((index, value) => {
        childs.add(
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: 
              FlatButton(
                onPressed: () => { 
                  update()
                },
                child: Column(
                  children: <Widget>[
                    Text(value,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: mainTextSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text('•',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
        )
      });
      return childs;
    }

    final dayList = Container(
      height: buttonHeight,
      // color: Colors.grey,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: createDayList(),
      ),
    );

    final eventList = Container(
      height: 80.0,
      // color: Colors.grey,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: events.map((e) => DailyEvent(event: e, open: () {Navigator.of(context).pushNamed('/event');})).toList(),
      ),
    );

    final hostingHeader = Padding(
      padding: EdgeInsets.all(20),
      child: TitleText('Event you are hosting'),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          header,
          SizedBox(height: 24),
          dayList,
          // eventList,
          Container(
            height: 230,
            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: eventList,
          ),
          hostingHeader,
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: ClearText('You are not hosting any event yet'),
          ),
          // Container(
          //   height: 230,
          //   margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
          //   child: eventList,
          // ),
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
        ],
      ),
    );
  }

}