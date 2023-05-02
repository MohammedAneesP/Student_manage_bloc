part of 'student_display_bloc.dart';

@immutable
abstract class StudentDisplayEvent {}

class DisplayingDetls extends StudentDisplayEvent {
  int aaIndex;

  DisplayingDetls({required this.aaIndex});
}

