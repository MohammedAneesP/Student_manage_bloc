part of 'search_data_bloc.dart';

@immutable
abstract class SearchDataEvent {}

class SearchedList extends SearchDataEvent {
  String anQuery;
  SearchedList({required this.anQuery});
}




