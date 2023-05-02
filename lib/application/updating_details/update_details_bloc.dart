import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:student_statemanagement/database/dbfunctions.dart';
import 'package:student_statemanagement/database/model_class.dart';

part 'update_details_event.dart';
part 'update_details_state.dart';

class UpdateDetailsBloc extends Bloc<UpdateDetailsEvent, UpdateDetailsState> {
  UpdateDetailsBloc() : super(UpdateDetailsInitial()) {
    on<StudentDetailsEdit>(
      (event, emit) {
        //  StudentModel? editStud;
        final updateBlocList = studentBox.values.toList();
        // updateBlocList.insert(event.editIndex, editStud!);
        // studentBox.putAt(event.editIndex, editStud);
        return emit(UpdateDetailsState(updateStudent: updateBlocList));
      },
    );
  }
}
