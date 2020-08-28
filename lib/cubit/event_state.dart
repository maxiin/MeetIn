part of 'event_cubit.dart';

@immutable
abstract class EventState {
  final events;
  EventState(this.events);
}

class EventInitial extends EventState {
  EventInitial() : super([]);
}

class EventLoading extends EventState {
  EventLoading() : super([]);
}

class EventLoaded extends EventState {
  final List<Event> events;
  EventLoaded(this.events) : super(events);
}
