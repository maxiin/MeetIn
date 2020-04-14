import 'package:rxdart/rxdart.dart';

import 'entities/event.dart';

class Repository {
  BehaviorSubject<List<Event>> events = new BehaviorSubject();

  static final Repository _instance = Repository._internal();
  factory Repository() => _instance;

  update() {
    events.add([
      new Event(1, new DateTime(2020, 3, 16, 9, 28), 'RUKU\'s Annual Carnival', new EventLocation('Al Hamra Mall', 'Al Hamra Mall', 0, 0), EventStatus.interested),
      new Event(8, new DateTime(2020, 3, 16, 9, 28), 'Cindy & The Avengers', new EventLocation('Star Cineplax', 'Star Cineplax', 0, 0), EventStatus.going),
    ]);
  }

  Repository._internal() {
  }
}