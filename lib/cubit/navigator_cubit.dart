import 'package:bloc/bloc.dart';
import 'package:events_app/entities/event.dart';
import 'package:events_app/repositories/event_repository.dart';
import 'package:meta/meta.dart';

part 'navigator_state.dart';

class NavigatorCubit extends Cubit<NavigatorState> {
  final EventRepository _weatherRepository;

  NavigatorCubit(this._weatherRepository) : super(NavigatorInitial());
}
