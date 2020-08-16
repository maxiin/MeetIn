import 'dart:math';

import 'package:rxdart/rxdart.dart';

import 'entities/event.dart';

final eventList = [
  new Event(
      id: 1,
      date:
          new DateTime(2020, 3, 16, Random().nextInt(23), Random().nextInt(59)),
      name: 'RUKU\'s Annual Carnival',
      placeName: 'Al Hamra Mall',
      address: 'Al Hamra Mall',
      latitude: 0,
      longitude: 0,
      status: EventStatus.interested),
  new Event(
      id: 8,
      date:
          new DateTime(2020, 3, 16, Random().nextInt(23), Random().nextInt(59)),
      name: 'Cindy & The Avengers',
      placeName: 'Al Hamra Mall',
      address: 'Al Hamra Mall',
      latitude: 0,
      longitude: 0,
      status: EventStatus.going),
  new Event(
      id: 9,
      date:
          new DateTime(2020, 3, 16, Random().nextInt(23), Random().nextInt(59)),
      name: 'RUKU\'s Annual Carnival',
      placeName: 'Al Hamra Mall',
      address: 'Al Hamra Mall',
      latitude: 0,
      longitude: 0,
      status: EventStatus.open),
  new Event(
      id: 2,
      date:
          new DateTime(2020, 3, 17, Random().nextInt(23), Random().nextInt(59)),
      name: 'Cindy & The Avengers',
      placeName: 'Al Hamra Mall',
      address: 'Al Hamra Mall',
      latitude: 0,
      longitude: 0,
      status: EventStatus.interested),
  new Event(
      id: 3,
      date:
          new DateTime(2020, 3, 18, Random().nextInt(23), Random().nextInt(59)),
      name: 'RUKU\'s Annual Carnival',
      placeName: 'Al Hamra Mall',
      address: 'Al Hamra Mall',
      latitude: 0,
      longitude: 0,
      status: EventStatus.going),
  new Event(
      id: 4,
      date:
          new DateTime(2020, 3, 19, Random().nextInt(23), Random().nextInt(59)),
      name: 'Cindy & The Avengers',
      placeName: 'Al Hamra Mall',
      address: 'Al Hamra Mall',
      latitude: 0,
      longitude: 0,
      status: EventStatus.interested),
  new Event(
      id: 5,
      date:
          new DateTime(2020, 3, 20, Random().nextInt(23), Random().nextInt(59)),
      name: 'RUKU\'s Annual Carnival',
      placeName: 'Al Hamra Mall',
      address: 'Al Hamra Mall',
      latitude: 0,
      longitude: 0,
      status: EventStatus.going),
  new Event(
      id: 6,
      date:
          new DateTime(2020, 3, 21, Random().nextInt(23), Random().nextInt(59)),
      name: 'Cindy & The Avengers',
      placeName: 'Al Hamra Mall',
      address: 'Al Hamra Mall',
      latitude: 0,
      longitude: 0,
      status: EventStatus.interested),
  new Event(
      id: 7,
      date:
          new DateTime(2020, 3, 22, Random().nextInt(23), Random().nextInt(59)),
      name: 'RUKU\'s Annual Carnival',
      placeName: 'Al Hamra Mall',
      address: 'Al Hamra Mall',
      latitude: 0,
      longitude: 0,
      status: EventStatus.open),
];

class Repository {
  BehaviorSubject<List<Event>> events =
      new BehaviorSubject<List<Event>>.seeded([]);

  static final Repository _instance = Repository._internal();
  factory Repository() => _instance;

  Repository._internal() {}
}
