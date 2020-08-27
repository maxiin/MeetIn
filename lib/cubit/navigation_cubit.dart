import 'package:bloc/bloc.dart';
import 'package:events_app/entities/event.dart';
import 'package:events_app/pages/dashboard.dart';
import 'package:events_app/repositories/event_repository.dart';
import 'package:meta/meta.dart';

part 'navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  final EventRepository _eventRepository;

  BottomNavigationCubit(this._eventRepository) : super(NavigationLoading()) {
    _eventRepository.getMany().then((events) => emit(NavigationEvents(events)));
  }

  Future<void> changePage(int index) async {
    try {
      emit(NavigationLoading());
      switch (index) {
        case 0:
          final events = await _eventRepository.getMany();
          emit(NavigationEvents(events));
          break;
        case 1:
          emit(NavigationDashboard());
          break;
        case 2:
          emit(NavigationProfile());
          break;
      }
    } catch (e) {}
  }
}
