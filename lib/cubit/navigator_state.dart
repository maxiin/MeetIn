part of 'navigator_cubit.dart';

@immutable
abstract class NavigatorState {
  const NavigatorState();
}

class NavigatorInitial extends NavigatorState {}

class LoadingPage extends NavigatorState {}

class PageDashboard extends NavigatorState {
  final List<Event> events;
  const PageDashboard(this.events);
}

class PageEvents extends NavigatorState {}

class PageProfile extends NavigatorState {}
