// ignore_for_file:  file_names

import 'package:flutter/material.dart';
import 'package:lotterymanagement/Colors/Colors.dart';

class Button extends StatelessWidget {
  final double fontSize;
  final String fontFamily;
  final Function onPressed;
  final Color colorstype;
  final String title;
  final double height;
  const Button(
      {Key key,
      this.fontSize,
      this.fontFamily,
      this.onPressed,
      this.colorstype,
      this.title, this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: height,
      child: RaisedButton(
        color: colordarkblue,
        textColor: colorwhite,
        padding: const EdgeInsets.all(10),
        child: Text(
          title,
          style: TextStyle(
              color: colorstype, fontSize: fontSize, fontFamily: fontFamily),
        ),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
