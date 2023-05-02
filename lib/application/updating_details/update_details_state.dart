part of 'update_details_bloc.dart';


class UpdateDetailsState {
  List<StudentModel>updateStudent;

  UpdateDetailsState({required this.updateStudent});
}

class UpdateDetailsInitial extends UpdateDetailsState {
  UpdateDetailsInitial():super(updateStudent: []);
}
