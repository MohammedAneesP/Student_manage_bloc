import 'package:flutter/material.dart';
import 'package:student_statemanagement/core/colors.dart';
import 'package:student_statemanagement/presentation/add_studnt_detls/add_details.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Student Application"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Click to Add',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: kBlack,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddStudentDetails(),
                  ),
                );
              },
              child: const Text("Add "),
            ),
          ],
        ),
      ),
    );
  }
}
