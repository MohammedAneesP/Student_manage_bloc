part of 'for_list_view_bloc.dart';

class ForListViewState {
  List<StudentModel> listBloc;
  ForListViewState({required this.listBloc});
}

class ForListViewInitial extends ForListViewState {
  ForListViewInitial() : super(listBloc: []);
}
