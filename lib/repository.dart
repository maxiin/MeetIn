import 'package:rxdart/rxdart.dart';

import 'entities/event.dart';

class Repository {
  BehaviorSubject<List<Event>> events = new BehaviorSubject();

  static final Repository _instance = Repository._internal();
  factory Repository() => _instance;

  update() {
    events.add([
      new Event(id: 1, date: new DateTime(2020, 3, 16, 9, 28), name: 'RUKU\'s Annual Carnival', location: new EventLocation(name: 'Al Hamra Mall', address: 'Al Hamra Mall', lat: 0, lng: 0), status: EventStatus.interested),
      new Event(id: 8, date: new DateTime(2020, 3, 16, 9, 28), name: 'Cindy & The Avengers', location: new EventLocation(name: 'Star Cineplax', address: 'Star Cineplax', lat: 0, lng: 0), status: EventStatus.going),
    ]);
  }

  Repository._internal() {
  }
}