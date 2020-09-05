import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(NavigationEvents());

  Future<void> changePage(int index) async {
    print(index);
    try {
      emit(NavigationLoading(index));
      switch (index) {
        case 0:
          emit(NavigationEvents());
          break;
        case 1:
          emit(NavigationDashboard());
          break;
        case 2:
          emit(NavigationProfile());
          break;
      }
    } catch (e) {
      emit(NavigationError(index));
    }
  }
}
