import 'package:hive/hive.dart';
import 'package:student_statemanagement/database/model_class.dart';

late Box<StudentModel>studentBox;

openStudentBox()async{
studentBox = await Hive.openBox<StudentModel>('BoxOpeningFunction');
}