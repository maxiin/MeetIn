import 'dart:math';

import 'package:events_app/entities/event.dart';
import 'package:events_app/repository.dart';

final events = [
  new Event(
      id: 1,
      date:
          new DateTime(2020, 3, 16, Random().nextInt(23), Random().nextInt(59)),
      name: 'RUKU\'s Annual Carnival',
      location: new EventLocation(
          name: 'Al Hamra Mall', address: 'Al Hamra Mall', lat: 0, lng: 0),
      status: EventStatus.interested),
  new Event(
      id: 8,
      date:
          new DateTime(2020, 3, 16, Random().nextInt(23), Random().nextInt(59)),
      name: 'Cindy & The Avengers',
      location: new EventLocation(
          name: 'Star Cineplax', address: 'Star Cineplax', lat: 0, lng: 0),
      status: EventStatus.going),
  new Event(
      id: 9,
      date:
          new DateTime(2020, 3, 16, Random().nextInt(23), Random().nextInt(59)),
      name: 'RUKU\'s Annual Carnival',
      location: new EventLocation(
          name: 'Al Hamra Mall', address: 'Al Hamra Mall', lat: 0, lng: 0),
      status: EventStatus.open),
  new Event(
      id: 2,
      date:
          new DateTime(2020, 3, 17, Random().nextInt(23), Random().nextInt(59)),
      name: 'Cindy & The Avengers',
      location: new EventLocation(
          name: 'Star Cineplax', address: 'Star Cineplax', lat: 0, lng: 0),
      status: EventStatus.interested),
  new Event(
      id: 3,
      date:
          new DateTime(2020, 3, 18, Random().nextInt(23), Random().nextInt(59)),
      name: 'RUKU\'s Annual Carnival',
      location: new EventLocation(
          name: 'Al Hamra Mall', address: 'Al Hamra Mall', lat: 0, lng: 0),
      status: EventStatus.going),
  new Event(
      id: 4,
      date:
          new DateTime(2020, 3, 19, Random().nextInt(23), Random().nextInt(59)),
      name: 'Cindy & The Avengers',
      location: new EventLocation(
          name: 'Star Cineplax', address: 'Star Cineplax', lat: 0, lng: 0),
      status: EventStatus.interested),
  new Event(
      id: 5,
      date:
          new DateTime(2020, 3, 20, Random().nextInt(23), Random().nextInt(59)),
      name: 'RUKU\'s Annual Carnival',
      location: new EventLocation(
          name: 'Al Hamra Mall', address: 'Al Hamra Mall', lat: 0, lng: 0),
      status: EventStatus.going),
  new Event(
      id: 6,
      date:
          new DateTime(2020, 3, 21, Random().nextInt(23), Random().nextInt(59)),
      name: 'Cindy & The Avengers',
      location: new EventLocation(
          name: 'Star Cineplax', address: 'Star Cineplax', lat: 0, lng: 0),
      status: EventStatus.interested),
  new Event(
      id: 7,
      date:
          new DateTime(2020, 3, 22, Random().nextInt(23), Random().nextInt(59)),
      name: 'RUKU\'s Annual Carnival',
      location: new EventLocation(
          name: 'Al Hamra Mall', address: 'Al Hamra Mall', lat: 0, lng: 0),
      status: EventStatus.open),
];

class EventService {
  static Future<List<Event>> getMany() async {
    await Future.delayed(Duration(seconds: 3));
    Repository().events.add(events);
    return events;
  }

  static Future<Event> createOne(Event event) async {
    await Future.delayed(Duration(seconds: 3));
    final val = Repository().events.value;
    Repository().events.add([...val, ...events]);
    return event;
  }
}
