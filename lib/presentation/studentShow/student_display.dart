import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_statemanagement/core/constants.dart';

import 'package:student_statemanagement/presentation/update_student/update_student_scrn.dart';
import '../../application/student_display/student_display_bloc.dart';
import '../../application/updating_details/update_details_bloc.dart';
import 'widgets/student_data_row.dart';

class StudentDisplay extends StatelessWidget {
  int thisIndex;

  StudentDisplay({
    super.key,
    required this.thisIndex,
  });

  @override
  Widget build(BuildContext context) {
    if (thisIndex >= 0) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Student Details"),
          actions: [
            IconButton(
              onPressed: () {
                BlocProvider.of<UpdateDetailsBloc>(context)
                    .add(StudentDetailsEdit(editIndex: thisIndex));

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return UpdateScreen(anIndex: thisIndex);
                    },
                  ),
                );
              },
              icon: const Icon(
                Icons.edit_rounded,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
                child: BlocBuilder<StudentDisplayBloc, StudentDisplayState>(
              builder: (context, state) {
                return Column(
                  children: [
                    kHeight10,
                    CircleAvatar(
                      radius: 100,
                      backgroundImage: FileImage(
                        File(
                          state.studDtlsBlocList[thisIndex].theImage,
                        ),
                      ),
                    ),
                    kHeighth50,
                    StudentDisplayRow(
                        anString: 'Name',
                        anData: state.studDtlsBlocList[thisIndex].name),
                    StudentDisplayRow(
                        anString: 'Age',
                        anData: state.studDtlsBlocList[thisIndex].age),
                    StudentDisplayRow(
                        anString: 'Year',
                        anData: state.studDtlsBlocList[thisIndex].year),
                    StudentDisplayRow(
                        anString: 'Course',
                        anData: state.studDtlsBlocList[thisIndex].course),
                  ],
                );
              },
            )),
          ),
        ),
      );
    } else {
      return Container(
        color: Colors.redAccent,
      );
    }
  }
}
