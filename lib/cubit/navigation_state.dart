part of 'navigation_cubit.dart';

@immutable
abstract class BottomNavigationState {
  const BottomNavigationState();
}

class NavigationInitial extends BottomNavigationState {}

class NavigationLoading extends BottomNavigationState {}

class NavigationEvents extends BottomNavigationState {
  final List<Event> events;
  const NavigationEvents(this.events);
}

class NavigationDashboard extends BottomNavigationState {}

class NavigationProfile extends BottomNavigationState {}
