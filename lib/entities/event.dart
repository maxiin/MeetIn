import 'package:faker/faker.dart';

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
  Platforms platform;

  Event(
      {this.id,
      this.date,
      this.name,
      this.longitude,
      this.latitude,
      this.address,
      this.placeName,
      this.language,
      this.platform,
      this.status});

  static randomEvent() {
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

enum EventStatus {
  interested,
  going,
  open,
}

enum Platforms {
  meet,
  teams,
  skype,
}
