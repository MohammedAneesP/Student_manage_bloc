import 'package:bloc/bloc.dart';
import 'package:student_statemanagement/database/dbfunctions.dart';
import 'package:student_statemanagement/database/model_class.dart';

part 'for_list_view_event.dart';
part 'for_list_view_state.dart';

class ForListViewBloc extends Bloc<ForListViewEvent, ForListViewState> {
  ForListViewBloc() : super(ForListViewInitial()) {
    on<StudentListeningList>((event, emit) {
      final nextBlocList = studentBox.values.toList();
      return emit(ForListViewState(listBloc: nextBlocList));
    });
    on<RemoveList>((event, emit) async {
      final nextBlockList = studentBox.values.toList();
      nextBlockList.removeAt(event.anIndex);
      await studentBox.deleteAt(event.anIndex);
      return emit(ForListViewState(listBloc: nextBlockList));
    });
  }
}
