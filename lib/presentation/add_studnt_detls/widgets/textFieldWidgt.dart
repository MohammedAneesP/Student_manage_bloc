import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {Key? key, required this.studentNameCtrl, this.anInputType})
      : super(key: key);

  final TextEditingController studentNameCtrl;
  final TextInputType? anInputType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 300,
      child: TextField(
        keyboardType: anInputType,
        textAlignVertical: const TextAlignVertical(y: -0.9),
        controller: studentNameCtrl,
        decoration: const InputDecoration(border: OutlineInputBorder()),
      ),
    );
  }
}
