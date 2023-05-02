part of 'update_details_bloc.dart';

@immutable
abstract class UpdateDetailsEvent {}

class StudentDetailsEdit extends UpdateDetailsEvent {
  int editIndex;
  StudentDetailsEdit({required this.editIndex});
}