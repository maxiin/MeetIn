import 'dart:math';

import 'package:rxdart/rxdart.dart';
import 'package:faker/faker.dart';

import 'entities/event.dart';

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

class Repository {
  BehaviorSubject<List<Event>> events =
      new BehaviorSubject<List<Event>>.seeded([]);

  static final Repository _instance = Repository._internal();
  factory Repository() => _instance;

  Repository._internal();
}
