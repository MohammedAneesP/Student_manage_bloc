// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_statemanagement/application/image_picker/image_picker_bloc.dart';
import 'package:student_statemanagement/core/constants.dart';
import 'package:student_statemanagement/database/dbfunctions.dart';
import 'package:student_statemanagement/database/model_class.dart';
import 'widgets/textFieldRowWidgt.dart';

class AddStudentDetails extends StatelessWidget {
  AddStudentDetails({super.key});
  final studentNameCtrl = TextEditingController();
  final studentAgeCtrl = TextEditingController();
  final studentCourseCtrl = TextEditingController();
  final studentYearCtrl = TextEditingController();
  String? imageFile;
  String tempImage = 'lib/assets/images/Nophoto.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
       
        title: const Text('Student Details'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                kHeight10,
                BlocBuilder<ImagePickerBloc, ImagePickerState>(
                  builder: (context, state) {
                    if (state.anImage == null) {
                      imageFile = tempImage;
                      return CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage('$imageFile'),
                      );
                    } else {
                      imageFile = state.anImage!.path;
                      return CircleAvatar(
                        radius: 100,
                        backgroundImage: FileImage(
                          File("$imageFile"),
                        ),
                      );
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BlocProvider(
                      create: (context) => ImagePickerBloc(),
                      child: ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<ImagePickerBloc>(context)
                                .add(CameraImage());
                          },
                          child: const Text("Camera")),
                    ),
                    BlocProvider(
                      create: (context) => ImagePickerBloc(),
                      child: ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<ImagePickerBloc>(context)
                                .add(GalleryImage());
                          },
                          child: const Text("Gallery")),
                    )
                  ],
                ),
                kHeighth50,
                TextFieldRow(
                    studentNameCtrl: studentNameCtrl, leadText: 'Name :'),
                TextFieldRow(studentNameCtrl: studentAgeCtrl, leadText: 'Age :'),
                TextFieldRow(
                  studentNameCtrl: studentYearCtrl,
                  leadText: 'Year :',
                  anInputType: TextInputType.number,
                ),
                TextFieldRow(
                    studentNameCtrl: studentCourseCtrl, leadText: 'Course :'),
                ElevatedButton(
                  onPressed: () {
                    addRequiredField(context);
                    BlocProvider.of<ImagePickerBloc>(context).add(RemoveImage());
                    studentNameCtrl.clear();
                    studentAgeCtrl.clear();
                    studentYearCtrl.clear();
                    studentCourseCtrl.clear();
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Submit",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addRequiredField(context) async {
    final studentName = studentNameCtrl.text.trim();
    final studentAge = studentAgeCtrl.text.trim();
    final studentYear = studentAgeCtrl.text.trim();
    final studentCourse = studentCourseCtrl.text.trim();
    final studentImage = imageFile;

    if (studentName.isEmpty ||
        studentAge.isEmpty ||
        studentYear.isEmpty ||
        studentCourse.isEmpty ||
        studentImage == tempImage ||
        studentImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        snackBarFunc("All Fields Required", Colors.redAccent),
      );
    } else {
      final studDetails = StudentModel(
        name: studentName,
        age: studentAge,
        course: studentCourse,
        year: studentYear,
        theImage: studentImage,
      );
      await studentBox.add(studDetails);
      ScaffoldMessenger.of(context)
          .showSnackBar(snackBarFunc("Successfully Added", Colors.greenAccent));
    }
  }

  SnackBar snackBarFunc(String anText, Color anColor) {
    return SnackBar(
      backgroundColor: anColor,
      margin: const EdgeInsets.all(20),
      behavior: SnackBarBehavior.floating,
      content: Text(anText),
      duration: const Duration(seconds: 3),
    );
  }
}
