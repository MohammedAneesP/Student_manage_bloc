import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_statemanagement/application/list_view/for_list_view_bloc.dart';
import 'package:student_statemanagement/application/student_display/student_display_bloc.dart';
import 'package:student_statemanagement/core/constants.dart';
import 'package:student_statemanagement/database/dbfunctions.dart';
import 'package:student_statemanagement/database/model_class.dart';
import 'package:student_statemanagement/presentation/add_studnt_detls/widgets/textFieldRowWidgt.dart';
import '../../application/image_picker/image_picker_bloc.dart';
import '../../application/updating_details/update_details_bloc.dart';

class UpdateScreen extends StatelessWidget {
  final int anIndex;
  UpdateScreen({super.key, required this.anIndex});

  TextEditingController updateNameCtrl = TextEditingController();
  TextEditingController updateAgeCtrl = TextEditingController();
  TextEditingController updateCourseCtrl = TextEditingController();
  TextEditingController updateYearCtrl = TextEditingController();
  String? updateImage;
  String? editImage;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<UpdateDetailsBloc>(context)
          .add(StudentDetailsEdit(editIndex: anIndex));
    });
    if (anIndex >= 0) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Details"),
        ),
        body: SingleChildScrollView(
          child: BlocBuilder<UpdateDetailsBloc, UpdateDetailsState>(
            builder: (context, state) {
              editImage = state.updateStudent[anIndex].theImage;
              updateNameCtrl.text = state.updateStudent[anIndex].name;
              updateAgeCtrl.text = state.updateStudent[anIndex].age;
              updateCourseCtrl.text = state.updateStudent[anIndex].course;
              updateYearCtrl.text = state.updateStudent[anIndex].year;

              return Center(
                child: Column(
                  children: [
                    kHeighth50,
                    BlocBuilder<ImagePickerBloc, ImagePickerState>(
                      builder: (context, state) {
                        if (state.anImage == null) {
                          updateImage = editImage;
                          return CircleAvatar(
                            radius: 100,
                            backgroundImage: FileImage(File("$updateImage")),
                          );
                        } else {
                          updateImage = state.anImage!.path;
                          return CircleAvatar(
                            radius: 100,
                            backgroundImage: FileImage(File("$updateImage")),
                          );
                        }
                      },
                    ),
                    kHeighth50,
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
                        studentNameCtrl: updateNameCtrl, leadText: "Name"),
                    TextFieldRow(
                        studentNameCtrl: updateAgeCtrl, leadText: "Age"),
                    TextFieldRow(
                        studentNameCtrl: updateCourseCtrl, leadText: "Course"),
                    TextFieldRow(
                        studentNameCtrl: updateYearCtrl, leadText: "Year"),
                    ElevatedButton(
                      onPressed: () async {
                        log(anIndex.toString());
                        await editedRequiredFiles(context);
                        BlocProvider.of<StudentDisplayBloc>(context)
                            .add(DisplayingDetls(aaIndex: anIndex));

                        BlocProvider.of<ForListViewBloc>(context)
                            .add(StudentListeningList());

                        BlocProvider.of<ImagePickerBloc>(context)
                            .add(RemoveImage());
                            
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Submit",
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Future<void> editedRequiredFiles(context) async {
    final editedStudName = updateNameCtrl.text.trim();
    final editedStudAge = updateAgeCtrl.text.trim();
    final editedStudCourse = updateCourseCtrl.text.trim();
    final editedStudYear = updateYearCtrl.text.trim();
    final editedStudImage = updateImage;

    if (editedStudImage == null ||
        editedStudYear.isEmpty ||
        editedStudAge.isEmpty ||
        editedStudCourse.isEmpty ||
        editedStudName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        snackBarFunc("all fields are Required", Colors.red),
      );
    } else {
      final updatedDetails = StudentModel(
        name: editedStudName,
        age: editedStudAge,
        course: editedStudCourse,
        year: editedStudYear,
        theImage: editedStudImage,
      );
      await studentBox.putAt(anIndex, updatedDetails);
      ScaffoldMessenger.of(context).showSnackBar(
        snackBarFunc(
          "Updated SuccessFully",
          Colors.green,
        ),
      );
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
