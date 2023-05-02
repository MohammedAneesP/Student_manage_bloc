import 'package:bloc/bloc.dart';


part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(BottomNavigationInitial()) {
    on<BottomFirstScreen>((event, emit) {
      return emit(BottomNavigationState(count: 0));
    });
    on<BottomStudntListScreen>((event, emit) {
      return emit(BottomNavigationState(count: 1));
    });
  }
}
