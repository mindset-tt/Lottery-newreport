// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lotterymanagement/AlertDialogs/CustomDialog.dart';
import 'package:lotterymanagement/Colors/Colors.dart';
import 'package:lotterymanagement/Controllers/ChangePassword/ChangePasswordCTR.dart';
import 'package:lotterymanagement/Fonts/Fonts.dart';
import 'package:lotterymanagement/Responsive/Responsive.dart';
import 'package:lotterymanagement/UrlRespose/StatusCodeError.dart';
import 'package:lotterymanagement/Widget/AppbarheaderMobile.dart';
import 'package:lotterymanagement/Widget/Button.dart';
import 'package:lotterymanagement/Widget/LabelText.dart';
import 'package:lotterymanagement/Widget/PopupDialog.dart';
import 'package:get/get.dart';
import 'package:lotterymanagement/Widget/Textfield.dart';

class Changepassword extends StatefulWidget {
  const Changepassword({Key key}) : super(key: key);
  @override
  _ChangepasswordState createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  ChangPasswordCTR changpassword = Get.put(ChangPasswordCTR());
  @override
  void initState() {
    changpassword.clear();
    changpassword.menu.disable(true);
    changpassword.username.text = changpassword.menu.email.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          backgroundColor: colorbackground,
          appBar: Responsive.isMobile(context)
              ? HeaderMobile(
                  controller: changpassword.search,
                  hintText: "ການຕັ້ງຄ່າ ແລະ ເປີດ",
                )
              : AppBar(
                  backgroundColor: colorbackground,
                  title: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: InfoPopup(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(50),
                      ],
                      title: "ປ່ຽນລະຫັດ",
                      search: changpassword.search,
                      onChanged: (val) {
                        // branch.txtsearch(branch.search.text);
                        // branch.check = false;
                      },
                      onTap: () {
                        // if (branch.search.text != "") {
                        //   for (int i = 0; i < branch.branchmd.length; i++) {
                        //     if (branch.branchmd[i].branchId.toString() ==
                        //             branch.search.text ||
                        //         branch.branchmd[i].branchName ==
                        //             branch.search.text) {
                        //       branch.check = true;
                        //     }
                        //   }
                        //   if (branch.check == false) {
                        //     CustomDialogs.invalidDialogs(
                        //         context, "ບໍ່ພົບຂໍ້ມູນນີ້");
                        //   }
                        // }
                      },
                    ),
                  ),
                ),
          body: !Responsive.isMobile(context)
              ? SafeArea(
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.width,
                    color: colorbackground,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(right: 50, left: 50, top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Text(
                                  "ປ່ຽນລະຫັດ",
                                  style: TextStyle(
                                      fontFamily: phetsarath,
                                      color: colordarkblue,
                                      fontSize: fontmenu,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    LabelText(
                                        count: "1",
                                        name: "ອີເມລຜູ້ໃຊ້",
                                        color: changpassword.empty.value == "1"
                                            ? colorred
                                            : colorblack),
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Textfield(
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(30),
                                        ],
                                        fontFamily: phetsarath,
                                        obscureText: false,
                                        bordercolor:
                                            changpassword.empty.value == "1"
                                                ? colorred
                                                : colordarkblue,
                                        focusNode:
                                            changpassword.empty.value == "1"
                                                ? changpassword.f1
                                                : changpassword.f1,
                                        controller: changpassword.username,
                                        fontWeight: FontWeight.normal,
                                        textInputType: TextInputType.text,
                                        size: 300,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    LabelText(
                                        count: "1",
                                        name: "ລະຫັດເກົ່າ",
                                        color: changpassword.empty.value == "2"
                                            ? colorred
                                            : colorblack),
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Textfield(
                                        fontFamily: phetsarath,
                                        obscureText: false,
                                        bordercolor:
                                            changpassword.empty.value == "2"
                                                ? colorred
                                                : colordarkblue,
                                        focusNode:
                                            changpassword.empty.value == "2"
                                                ? changpassword.f2
                                                : changpassword.f2,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(20),
                                        ],
                                        controller: changpassword.passsword,
                                        fontWeight: FontWeight.normal,
                                        textInputType: TextInputType.number,
                                        size: 300,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    LabelText(
                                        count: "1",
                                        name: "ລະຫັດໃຫມ່",
                                        color: changpassword.empty.value == "3"
                                            ? colorred
                                            : colorblack),
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Textfield(
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(20),
                                        ],
                                        fontFamily: phetsarath,
                                        obscureText: false,
                                        bordercolor:
                                            changpassword.empty.value == "3"
                                                ? colorred
                                                : colordarkblue,
                                        focusNode:
                                            changpassword.empty.value == "3"
                                                ? changpassword.f3
                                                : changpassword.f3,
                                        controller: changpassword.confirm,
                                        fontWeight: FontWeight.normal,
                                        textInputType: TextInputType.text,
                                        size: 300,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    SizedBox(
                                      width: 300,
                                      child: Button(
                                        height: 42,
                                        title:
                                            changpassword.onTap.value == false
                                                ? "ປ່ຽນ"
                                                : "ລໍຖ້າ...",
                                        colorstype: colorwhite,
                                        fontFamily: phetsarath,
                                        fontSize: fontgeneral,
                                        onPressed: () {
                                          if (changpassword.username.text ==
                                              "") {
                                            changpassword.empty("1");
                                            FocusScope.of(context)
                                                .requestFocus(changpassword.f1);
                                          } else if (changpassword
                                                  .passsword.text ==
                                              "") {
                                            changpassword.empty("2");
                                            FocusScope.of(context)
                                                .requestFocus(changpassword.f2);
                                          } else if (changpassword
                                                  .confirm.text ==
                                              "") {
                                            changpassword.empty("3");
                                            FocusScope.of(context)
                                                .requestFocus(changpassword.f3);
                                          } else {
                                            if (changpassword.onTap.value ==
                                                false) {
                                              changpassword.onTap(true);
                                              changpassword.empty("");
                                              changpassword
                                                  .changePassword(
                                                      changpassword
                                                          .username.text,
                                                      changpassword
                                                          .passsword.text,
                                                      changpassword
                                                          .confirm.text,
                                                      changpassword
                                                          .menu.userid.value)
                                                  .then((value) {
                                                if (value == "200") {
                                                  Get.snackbar(
                                                      "Warning Messages !", "",
                                                      messageText: Text(
                                                          "ອັບເດດລະຫັດສຳເລັດແລ້ວ . . .",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  phetsarath,
                                                              color: colorblack,
                                                              fontSize:
                                                                  fontgeneral,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal)),
                                                      maxWidth: 500,
                                                      backgroundColor:
                                                          colorwhite,
                                                      snackPosition:
                                                          SnackPosition.TOP,
                                                      icon: const Icon(
                                                        Icons.message,
                                                        color: colorgreen,
                                                      ));
                                                  changpassword.clear();
                                                  FocusScope.of(context)
                                                      .requestFocus(
                                                          changpassword.f1);
                                                } else if (value == "501") {
                                                  CustomDialogs.errorDialogs(
                                                      context,
                                                      "ລະຫັດບໍ່ຖືກຕ້ອງ !");
                                                } else if (value == "403") {
                                                  CustomDialogs.errorDialogs(
                                                      context,
                                                      StatusCodeText
                                                          .statusCodeText403);
                                                } else if (value == "404") {
                                                  CustomDialogs.errorDialogs(
                                                      context,
                                                      StatusCodeText
                                                          .statusCodeText404);
                                                } else {
                                                  CustomDialogs.errorDialogs(
                                                      context,
                                                      StatusCodeText
                                                          .statusCodeText500);
                                                }
                                              }).whenComplete(() =>
                                                      changpassword
                                                          .onTap(false));
                                            }
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              :
              //////////////////////////////////////// Mobile //////////////////////////////////////
              SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      color: colorbackground,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "ປ່ຽນລະຫັດ",
                              style: TextStyle(
                                  fontFamily: phetsarath,
                                  color: colordarkblue,
                                  fontSize: fontmenu,
                                  fontWeight: FontWeight.bold),
                            ),
                            LabelText(
                                count: "1",
                                name: "ອີເມລຜູ້ໃຊ້",
                                color: changpassword.empty.value == "1"
                                    ? colorred
                                    : colorblack),
                            Textfield(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(30),
                              ],
                              fontFamily: phetsarath,
                              obscureText: false,
                              bordercolor: changpassword.empty.value == "1"
                                  ? colorred
                                  : colordarkblue,
                              focusNode: changpassword.empty.value == "1"
                                  ? changpassword.f1
                                  : changpassword.f1,
                              controller: changpassword.username,
                              fontWeight: FontWeight.normal,
                              textInputType: TextInputType.text,
                              size: double.infinity,
                            ),
                            LabelText(
                                count: "1",
                                name: "ລະຫັດເກົ່າ",
                                color: changpassword.empty.value == "2"
                                    ? colorred
                                    : colorblack),
                            Textfield(
                              fontFamily: phetsarath,
                              obscureText: false,
                              bordercolor: changpassword.empty.value == "2"
                                  ? colorred
                                  : colordarkblue,
                              focusNode: changpassword.empty.value == "2"
                                  ? changpassword.f2
                                  : changpassword.f2,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(20),
                              ],
                              controller: changpassword.passsword,
                              fontWeight: FontWeight.normal,
                              textInputType: TextInputType.number,
                              size: double.infinity,
                            ),
                            LabelText(
                                count: "1",
                                name: "ລະຫັດໃຫມ່",
                                color: changpassword.empty.value == "3"
                                    ? colorred
                                    : colorblack),
                            Textfield(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(20),
                              ],
                              fontFamily: phetsarath,
                              obscureText: false,
                              bordercolor: changpassword.empty.value == "3"
                                  ? colorred
                                  : colordarkblue,
                              focusNode: changpassword.empty.value == "3"
                                  ? changpassword.f3
                                  : changpassword.f3,
                              controller: changpassword.confirm,
                              fontWeight: FontWeight.normal,
                              textInputType: TextInputType.text,
                              size: double.infinity,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Button(
                                height: 50,
                                title: changpassword.onTap.value == false
                                    ? "ປ່ຽນ"
                                    : "ລໍຖ້າ...",
                                colorstype: colorwhite,
                                fontFamily: phetsarath,
                                fontSize: fontgeneral,
                                onPressed: () {
                                  if (changpassword.username.text == "") {
                                    changpassword.empty("1");
                                    FocusScope.of(context)
                                        .requestFocus(changpassword.f1);
                                  } else if (changpassword.passsword.text ==
                                      "") {
                                    changpassword.empty("2");
                                    FocusScope.of(context)
                                        .requestFocus(changpassword.f2);
                                  } else if (changpassword.confirm.text == "") {
                                    changpassword.empty("3");
                                    FocusScope.of(context)
                                        .requestFocus(changpassword.f3);
                                  } else {
                                    if (changpassword.onTap.value == false) {
                                      changpassword.onTap(true);
                                      changpassword.empty("");
                                      changpassword
                                          .changePassword(
                                              changpassword.username.text,
                                              changpassword.passsword.text,
                                              changpassword.confirm.text,
                                              changpassword.menu.userid.value)
                                          .then((value) {
                                        if (value == "200") {
                                          Get.snackbar("Warning Messages !", "",
                                              messageText: Text(
                                                  "ອັບເດດລະຫັດສຳເລັດແລ້ວ . . .",
                                                  style: TextStyle(
                                                      fontFamily: phetsarath,
                                                      color: colorblack,
                                                      fontSize: fontgeneral,
                                                      fontWeight:
                                                          FontWeight.normal)),
                                              maxWidth: 500,
                                              backgroundColor: colorwhite,
                                              snackPosition: SnackPosition.TOP,
                                              icon: const Icon(
                                                Icons.message,
                                                color: colorgreen,
                                              ));
                                          changpassword.clear();
                                          FocusScope.of(context)
                                              .requestFocus(changpassword.f1);
                                        } else if (value == "501") {
                                          CustomDialogs.errorDialogs(
                                              context, "ລະຫັດບໍ່ຖືກຕ້ອງ !");
                                        } else if (value == "403") {
                                          CustomDialogs.errorDialogs(context,
                                              StatusCodeText.statusCodeText403);
                                        } else if (value == "404") {
                                          CustomDialogs.errorDialogs(context,
                                              StatusCodeText.statusCodeText404);
                                        } else {
                                          CustomDialogs.errorDialogs(context,
                                              StatusCodeText.statusCodeText500);
                                        }
                                      }).whenComplete(
                                              () => changpassword.onTap(false));
                                    }
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
    );
  }
}
