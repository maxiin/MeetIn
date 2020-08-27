part of 'navigation_cubit.dart';

@immutable
abstract class BottomNavigationState {
  final index;
  const BottomNavigationState(this.index);
}

class NavigationInitial extends BottomNavigationState {
  NavigationInitial() : super(0);
}

class NavigationLoading extends BottomNavigationState {
  final index;
  NavigationLoading(this.index) : super(index);
}

class NavigationError extends BottomNavigationState {
  final index;
  NavigationError(this.index) : super(index);
}

class NavigationEvents extends BottomNavigationState {
  final List<Event> events;
  const NavigationEvents(this.events) : super(0);
}

class NavigationDashboard extends BottomNavigationState {
  NavigationDashboard() : super(1);
}

class NavigationProfile extends BottomNavigationState {
  NavigationProfile() : super(2);
}
