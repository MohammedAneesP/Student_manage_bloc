import 'package:hive/hive.dart';
 part 'model_class.g.dart';

@HiveType(typeId: 1)
class StudentModel extends HiveObject {
  
  @override
  @HiveField(0)
  int? key;

  @HiveField(1)
  String name;

  @HiveField(2)
  String age;

  @HiveField(3)
  String course;

  @HiveField(4)
  String year;

  @HiveField(5)
  String theImage;

  StudentModel({
    required this.name,
    required this.age,
    required this.course,
    required this.year,
    required this.theImage,
    this.key,
  });
}
