import 'package:events_app/pages/event.dart';
import 'package:events_app/pages/login.dart';
import 'package:events_app/pages/dashboard.dart';
import 'package:events_app/pages/createEvent.dart';
import 'package:events_app/repository.dart';
import 'package:events_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

import 'entities/event.dart';

void main() => runApp(MyApp());

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

class MyApp extends StatelessWidget {
  var repo = new Repository();

  MyApp() {
    for (int i = 0; i < random.integer(10) + 5; i++) {
      final event = new Event(
          id: random.integer(100),
          date: fromNow(),
          name: faker.conference.name() + i.toString(),
          latitude: faker.address.lat(min: -24, max: -23),
          longitude: faker.address.lng(min: -47, max: -46),
          address: faker.address.streetAddress(),
          placeName: faker.address.streetName(),
          language: faker.person.language(),
          status: EventStatus.interested);
      this.repo.events.add([...this.repo.events.value, event]);
    }
  }

  // Root.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: primaryMaterialColor,
        ),
        //home: LoginPage(),
        home: LoginPage());
  }
}
