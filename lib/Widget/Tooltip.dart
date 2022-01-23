// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:lotterymanagement/Colors/Colors.dart';
import 'package:lotterymanagement/Fonts/Fonts.dart';

class Tooltips extends StatelessWidget {
  const Tooltips({Key key, this.child, this.message}) : super(key: key);
  final Widget child;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      child: child,
      message: message,
      textStyle: TextStyle(
          color: colorwhite, fontSize: fontgeneral, fontFamily: phetsarath),
    );
  }
}
