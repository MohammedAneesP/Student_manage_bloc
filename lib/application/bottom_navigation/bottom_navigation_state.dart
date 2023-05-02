part of 'bottom_navigation_bloc.dart';

 class BottomNavigationState {
  int count;

  BottomNavigationState({required this.count});
}

class BottomNavigationInitial extends BottomNavigationState {
  BottomNavigationInitial():super(count: 0);
}
