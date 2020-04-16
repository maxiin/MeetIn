class Event {
  int id;
  DateTime date;
  String name;
  EventLocation location;
  EventStatus status;

  Event({this.id, this.date, this.name, this.location, this.status});
}

class EventLocation {
  double lng;
  double lat;
  String address;
  String name;

  EventLocation({this.name, this.address, this.lat, this.lng});
}

enum EventStatus {
  interested,
  going,
  open,
}