import 'dart:math';
import 'package:events_app/entities/event.dart';
import 'package:events_app/repository.dart';
import 'package:events_app/services/api.srvc.dart';
import 'package:flutter/cupertino.dart';

final event = new Event(
    id: 5,
    date: new DateTime(2020, 3, 20, Random().nextInt(23), Random().nextInt(59)),
    name: 'RUKU\'s Annual Carnival',
    placeName: 'Al Hamra Mall',
    address: 'Al Hamra Mall',
    latitude: 0,
    longitude: 0,
    status: EventStatus.going);

class EventService {
  static Future<List<Event>> getMany({BuildContext ctx}) {
    return ApiServices.getMany<Event>(repo: Repository().events, ctx: ctx);
  }

  static Future<Event> createOne(Event event, {BuildContext ctx}) async {
    return ApiServices.post(event, repo: Repository().events, ctx: ctx);
  }
}
