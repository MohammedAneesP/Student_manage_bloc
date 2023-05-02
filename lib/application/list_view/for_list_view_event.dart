part of 'for_list_view_bloc.dart';

 class ForListViewEvent {}

class StudentListeningList extends ForListViewEvent{}

class RemoveList extends ForListViewEvent{
  int anIndex;
  RemoveList({required this.anIndex});
}


