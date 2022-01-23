// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:lotterymanagement/Colors/Colors.dart';
import 'package:lotterymanagement/Fonts/Fonts.dart';

class ShowNullData extends StatelessWidget {
  const ShowNullData({
    Key key, this.width, this.height,
  }) : super(key: key);
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            width: width,
            height: height,
            child: Image.asset(
              "assets/images/empty.png",
              fit: BoxFit.fill,
            ),
          ),
          Text("ບໍ່ມີຂໍ້ມູນ",
              style: TextStyle(
                  color: colorgray,
                  fontWeight: FontWeight.bold,
                  fontSize: fontmiddle,
                  fontFamily: phetsarath)),
        ],
      ),
    );
  }
}