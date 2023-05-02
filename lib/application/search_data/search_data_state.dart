part of 'search_data_bloc.dart';

class SearchDataState {
  bool isNull;
  List<StudentModel> searchingList;
  List<StudentModel> filteredValue;
  SearchDataState({required this.searchingList,required this.filteredValue,required this.isNull});
}

class SearchDataInitial extends SearchDataState {
  SearchDataInitial() : super(searchingList: [],filteredValue: [],isNull: false);
}
