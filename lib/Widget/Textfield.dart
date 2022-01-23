// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lotterymanagement/Colors/Colors.dart';
import 'package:lotterymanagement/Fonts/Fonts.dart';
import 'package:lotterymanagement/Responsive/Responsive.dart';

class Textfield extends StatelessWidget {
  const Textfield({
    Key key,
    this.hintText,
    this.labelText,
    this.textInputType,
    this.controller,
    this.size,
    this.icon,
    this.fontWeight,
    this.inputFormatters,
    this.bordercolor,
    this.obscureText,
    this.focusNode,
    this.fontFamily,
    this.enabled,
    this.onChanged,
  }) : super(key: key);
  final TextEditingController controller;
  final String hintText, labelText;
  final TextInputType textInputType;
  final double size;
  final Icon icon;
  final FontWeight fontWeight;
  final Color bordercolor;
  final bool obscureText;
  final FocusNode focusNode;
  final List<TextInputFormatter> inputFormatters;
  final String fontFamily;
  final bool enabled;
  final Function onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: Responsive.isMobile(context) ? 50 : 38,
      child: TextFormField(
        onChanged: onChanged,
        enabled: enabled,
        focusNode: focusNode,
        obscureText: obscureText,
        autofocus: true,
        controller: controller,
        keyboardType: textInputType,
        inputFormatters: inputFormatters,
        style: TextStyle(
            color: colorblack,
            fontSize: fontmenu,
            fontFamily: fontFamily,
            fontWeight: fontWeight),
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: colorblack)),
          suffixIcon: icon,
          contentPadding: const EdgeInsets.symmetric(horizontal: 25),
          labelStyle: const TextStyle(
            color: colorgray,
          ),
          hintText: hintText,
          labelText: labelText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: bordercolor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
