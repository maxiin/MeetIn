class Event {
  final int id;
  final DateTime date;
  final String name;
  final EventLocation location;
  final EventStatus status;

  Event(this.id, this.date, this.name, this.location, this.status);
}

class EventLocation {
  final double lng;
  final double lat;
  final String address;
  final String name;

  EventLocation(this.name, this.address, this.lat, this.lng);
}

enum EventStatus {
  interested,
  going,
  open,
}