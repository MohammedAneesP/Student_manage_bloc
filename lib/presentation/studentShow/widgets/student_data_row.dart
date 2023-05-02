
import 'package:flutter/material.dart';

class StudentDisplayRow extends StatelessWidget {
 const  StudentDisplayRow({
    Key? key,
    required this.anString,
    required this.anData,
  }) : super(key: key);

  final dynamic anData;
 final String anString;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "$anString  :  $anData",
          style: const TextStyle(fontSize: 25),
        )
      ],
    );
  }
}
