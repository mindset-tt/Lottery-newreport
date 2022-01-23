// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:lotterymanagement/Colors/Colors.dart';
import 'package:lotterymanagement/Fonts/Fonts.dart';
import 'package:lotterymanagement/Responsive/Responsive.dart';

class CustomDialogs {
  static Future confirmBillDialogs(
      BuildContext context, Function onPressed) async {
    return await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            content: SizedBox(
              width: 250,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.warning,
                          size: 100,
                          color: colorred,
                        ),
                        Text("ຕ້ອງການຊຳລະບິນນີ້ແທ້ບໍ່ ?",
                            style: TextStyle(
                                color: colorblack,
                                fontSize: fontgeneral,
                                fontFamily: phetsarath))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Buttons(
                          text: "ຍົກເລີກ",
                          width: 100,
                          fontWeight: FontWeight.bold,
                          color: colorbackground,
                          colortext: colorblack,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Buttons(
                          fontWeight: FontWeight.normal,
                          width: 100,
                          color: colordarkblue,
                          colortext: colorwhite,
                          text: "ຕົກລົງ",
                          onPressed: onPressed,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  static Future cancelBillDialogs(
      BuildContext context, Function onPressed) async {
    return await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            content: SizedBox(
              width: 250,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.cancel,
                          size: 100,
                          color: colorred,
                        ),
                        Text("ຕ້ອງການຍົກເລີກບິນນີ້ແທ້ບໍ່ ?",
                            style: TextStyle(
                                color: colorblack,
                                fontSize: fontgeneral,
                                fontFamily: phetsarath))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Buttons(
                          text: "ຍົກເລີກ",
                          width: 100,
                          fontWeight: FontWeight.bold,
                          color: colorbackground,
                          colortext: colorblack,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Buttons(
                          fontWeight: FontWeight.normal,
                          width: 100,
                          color: colordarkblue,
                          colortext: colorwhite,
                          text: "ລົບ",
                          onPressed: onPressed,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  static Future warningDialogs(BuildContext context) async {
    return await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            content: SizedBox(
              width: 250,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 350,
                    child: Column(
                      children: [
                        const Icon(
                          Icons.warning,
                          size: 100,
                          color: colorblow,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("ຂໍອະໄພ ! ຂໍ້ມູນບໍ່ຖືກຕ້ອງ ?",
                            style: TextStyle(
                                color: colorblack,
                                fontSize: fontgeneral,
                                fontFamily: phetsarath)),
                        const SizedBox(
                          height: 10,
                        ),
                        Buttons(
                          text: "ປິດ",
                          fontWeight: FontWeight.bold,
                          width: MediaQuery.of(context).size.width,
                          color: colorbackground,
                          colortext: colorblack,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  static Future invalidDialogs(BuildContext context, String values) async {
    return await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            content: SizedBox(
              width: 250,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 350,
                    child: Column(
                      children: [
                        const Icon(
                          Icons.warning,
                          size: 100,
                          color: colorblow,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("$values !",
                            style: TextStyle(
                                color: colorblack,
                                fontSize: fontgeneral,
                                fontFamily: phetsarath)),
                        const SizedBox(
                          height: 10,
                        ),
                        Buttons(
                          text: "ປິດ",
                          fontWeight: FontWeight.bold,
                          width: MediaQuery.of(context).size.width,
                          color: colorbackground,
                          colortext: colorblack,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  static Future confirmDialogs(BuildContext context, Function onPressed,
      String title, String confirm) async {
    return await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              content: SizedBox(
                width: 250,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 350,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.warning,
                            size: 100,
                            color: colorred,
                          ),
                          Text(title,
                              style: TextStyle(
                                  color: colorblack,
                                  fontSize: fontgeneral,
                                  fontFamily: phetsarath))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 350,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Buttons(
                            text: "ຍົກເລີກ",
                            width: 100,
                            fontWeight: FontWeight.bold,
                            color: colorbackground,
                            colortext: colorblack,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Buttons(
                            fontWeight: FontWeight.normal,
                            width: 100,
                            color: colordarkblue,
                            colortext: colorwhite,
                            text: confirm,
                            onPressed: onPressed,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          });
        });
  }

  static Future errorDialogs(BuildContext context, String values) async {
    return await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            content: SizedBox(
              width: 280,
              height: Responsive.isMobile(context) ? 250 : 220,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 350,
                    child: Column(
                      children: [
                        const Icon(
                          Icons.error,
                          size: 100,
                          color: colorred,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(values,
                            style: TextStyle(
                                color: colorblack,
                                fontSize: fontgeneral,
                                fontFamily: phetsarath)),
                        const SizedBox(
                          height: 10,
                        ),
                        Buttons(
                          text: "ປິດ",
                          fontWeight: FontWeight.bold,
                          width: MediaQuery.of(context).size.width,
                          color: colorbackground,
                          colortext: colorblack,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  static Future loadingDialogs(BuildContext context, String title) async {
    return await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            content: SizedBox(
                width: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontFamily: phetsarath,
                          fontSize: fontgeneral,
                          color: colorblack,
                        ),
                      ),
                    )
                  ],
                )),
          );
        });
  }
}

class Buttons extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;
  final Color colortext;
  final FontWeight fontWeight;
  final double width;
  const Buttons({
    Key key,
    this.text,
    this.onPressed,
    this.color,
    this.colortext,
    this.fontWeight,
    this.width,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: RaisedButton(
        padding: const EdgeInsets.all(defaultPadding),
        elevation: 10,
        color: color,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text(text,
            style: TextStyle(
                color: colortext,
                fontSize: fontgeneral,
                fontWeight: fontWeight,
                fontFamily: phetsarath)),
      ),
    );
  }
}
