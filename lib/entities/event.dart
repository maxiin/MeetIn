import 'package:events_app/repository.dart';

class Event {
  int id;
  DateTime date;
  String name;
  EventStatus status;
  double longitude;
  double latitude;
  String address;
  String placeName;

  Event(
      {this.id,
      this.date,
      this.name,
      this.longitude,
      this.latitude,
      this.address,
      this.placeName,
      this.status});
}

enum EventStatus {
  interested,
  going,
  open,
}
