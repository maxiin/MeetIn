import 'package:bloc/bloc.dart';
import 'package:events_app/entities/event.dart';
import 'package:events_app/repositories/event_repository.dart';
import 'package:meta/meta.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(EventInitial());

  Future<void> loadEvents() async {
    emit(EventLoading());
    final events = await EventRepository().getMany();
    emit(EventLoaded(events));
  }
}
