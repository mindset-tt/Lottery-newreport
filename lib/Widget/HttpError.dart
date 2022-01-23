// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:lotterymanagement/Colors/Colors.dart';
import 'package:lotterymanagement/Fonts/Fonts.dart';

class HttpError extends StatelessWidget {
  const HttpError({
    Key key,
    this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: colordarkblue,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              title,
              style: TextStyle(
                  fontFamily: phetsarath,
                  color: colorred,
                  fontSize: fontgeneral,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
