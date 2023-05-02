import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:student_statemanagement/database/dbfunctions.dart';
import 'package:student_statemanagement/database/model_class.dart';

part 'search_data_event.dart';
part 'search_data_state.dart';

class SearchDataBloc extends Bloc<SearchDataEvent, SearchDataState> {
  SearchDataBloc() : super(SearchDataInitial()) {
    on<SearchedList>(
      (event, emit) {
        List<StudentModel> anSearchView = studentBox.values.toList();
        List<StudentModel> filteredList = anSearchView.where((element) {
          final srName = element.name.toLowerCase();
          final srQuery = event.anQuery.toLowerCase();
          return srName.contains(srQuery);
        }).toList();
        if (filteredList.length == 0) {
          return emit(SearchDataState(
              searchingList: anSearchView, filteredValue: [], isNull: true));
        } else {
          return emit(SearchDataState(
              searchingList: anSearchView,
              filteredValue: filteredList,
              isNull: false));
        }
      },
    );
  }
}
