
import 'package:flutter/material.dart';
import 'package:student_statemanagement/core/constants.dart';
import 'package:student_statemanagement/presentation/add_studnt_detls/widgets/textFieldWidgt.dart';

class TextFieldRow extends StatelessWidget {
  const TextFieldRow({
    Key? key,
    required this.studentNameCtrl,
    required this.leadText,
    this.anInputType,
  }) : super(key: key);

  final TextEditingController studentNameCtrl;
  final String leadText;
  final TextInputType? anInputType;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(leadText, style: kTextStyle),
        kWidth,
        TextFieldWidget(
            studentNameCtrl: studentNameCtrl, anInputType: anInputType),
      ],
    );
  }
}
