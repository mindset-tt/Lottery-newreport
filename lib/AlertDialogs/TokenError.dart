// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotterymanagement/Colors/Colors.dart';
import 'package:lotterymanagement/Fonts/Fonts.dart';
import 'CustomDialog.dart';
class TokenPage extends StatelessWidget {
  const TokenPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorbackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 500,
            child: Image.asset(
              "assets/images/404.jpg",
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "ຂໍອະໄພ! ບໍ່ພົບຫນ້ານີ້ !! Can not read authorization",
            style: TextStyle(
                fontFamily: phetsarath,
                color: colorblack,
                fontSize: fonttitle,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: SizedBox(
              width: 220,
              child: Buttons(
                text: "ປິດ",
                fontWeight: FontWeight.bold,
                width: MediaQuery.of(context).size.width,
                color: colorbackground,
                colortext: colorblack,
                onPressed: () {
                  Get.offAllNamed("/login");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
