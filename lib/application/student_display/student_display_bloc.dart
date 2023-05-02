import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:student_statemanagement/database/dbfunctions.dart';
import 'package:student_statemanagement/database/model_class.dart';

part 'student_display_event.dart';
part 'student_display_state.dart';

class StudentDisplayBloc
    extends Bloc<StudentDisplayEvent, StudentDisplayState> {
  StudentDisplayBloc() : super(StudentDisplayInitial()) {
    on<DisplayingDetls>((event, emit) {
      final nextDisplayList = studentBox.values.toList();
      return emit(StudentDisplayState(studDtlsBlocList: nextDisplayList));
    });
  }
}
