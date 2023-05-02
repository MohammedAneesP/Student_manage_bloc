part of 'student_display_bloc.dart';

 class StudentDisplayState {
  List<StudentModel>studDtlsBlocList;

  StudentDisplayState({required this.studDtlsBlocList});
 }

class StudentDisplayInitial extends StudentDisplayState {
  StudentDisplayInitial():super(studDtlsBlocList: []);
}
