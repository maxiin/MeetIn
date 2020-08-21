class Event {
  int id;
  DateTime date;
  String name;
  EventStatus status;
  double longitude;
  double latitude;
  String address;
  String placeName;
  String language;

  Event(
      {this.id,
      this.date,
      this.name,
      this.longitude,
      this.latitude,
      this.address,
      this.placeName,
      this.language,
      this.status});
}

enum EventStatus {
  interested,
  going,
  open,
}
