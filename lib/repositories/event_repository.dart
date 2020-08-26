import 'dart:math';

import 'package:events_app/entities/event.dart';
import 'package:faker/faker.dart';

import 'base_repository.dart';

class EventRepository implements CommonRepository<Event> {
  @override
  Future<Event> getOne(int eventId) {
    // Simulate network delay
    return Future.delayed(
      Duration(seconds: 1),
      () {
        final random = Random();

        // Simulate some network exception
        if (random.nextBool()) {
          throw NetworkException();
        }

        // Return "fetched" weather
        return createFakeEvent();
      },
    );
  }

  @override
  Future<List<Event>> getMany() {
    // Simulate network delay
    return Future.delayed(
      Duration(seconds: 1),
      () {
        // Simulate some network exception
        if (random.boolean()) {
          throw NetworkException();
        }

        final eventList = new List<Event>();

        for (int i = 0; i < random.integer(10) + 5; i++) {
          eventList.add(createFakeEvent());
        }

        // Return "fetched" weather
        return eventList;
      },
    );
  }
}

Event createFakeEvent() {
  return new Event(
      id: random.integer(100),
      date: fromNow(),
      name: faker.conference.name(),
      latitude: faker.address.lat(min: -24, max: -23),
      longitude: faker.address.lng(min: -47, max: -46),
      address: faker.address.streetAddress(),
      placeName: faker.address.streetName(),
      language: faker.person.language(),
      status: EventStatus.interested);
}

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

class NetworkException implements Exception {}
