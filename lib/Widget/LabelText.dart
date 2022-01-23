// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:lotterymanagement/Colors/Colors.dart';
import 'package:lotterymanagement/Fonts/Fonts.dart';

class LabelText extends StatelessWidget {
  const LabelText({
    Key key,
    this.name,
    this.color,
    this.count,
  }) : super(key: key);

  final String name;
  final Color color;
  final String count;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: TextStyle(
              fontFamily: phetsarath,
              color: color,
              fontSize: fontgeneral,
              fontWeight: FontWeight.normal),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          count == "1" ? "*" : "",
          style: TextStyle(
              fontFamily: phetsarath,
              color: colorred,
              fontSize: fontmiddle,
              fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
