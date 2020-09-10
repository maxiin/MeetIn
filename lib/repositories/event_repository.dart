import 'dart:math';

import 'package:events_app/entities/event.dart';

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
        return Event.randomEvent();
      },
    );
  }

  @override
  Future<List<Event>> getMany() {
    // Simulate network delay
    return Future.delayed(
      Duration(seconds: 5),
      () {
        // Simulate some network exception
        /* if (random.boolean()) {
          throw NetworkException();
        }
        */
        final eventList = new List<Event>();
        final random = Random();

        for (int i = 0; i < random.nextInt(10) + 5; i++) {
          eventList.add(Event.randomEvent());
        }

        // Return "fetched" weather
        return eventList;
      },
    );
  }
}

class NetworkException implements Exception {}
