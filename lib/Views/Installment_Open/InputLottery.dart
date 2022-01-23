// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lotterymanagement/AlertDialogs/CustomDialog.dart';
import 'package:lotterymanagement/Colors/Colors.dart';
import 'package:lotterymanagement/Controllers/Install_Open/InputNumberCTR.dart';
import 'package:lotterymanagement/Fonts/Fonts.dart';
import 'package:lotterymanagement/Responsive/Responsive.dart';
import 'package:lotterymanagement/UrlRespose/StatusCodeError.dart';
import 'package:lotterymanagement/Widget/AppbarheaderMobile.dart';
import 'package:lotterymanagement/Widget/HttpError.dart';
import 'package:lotterymanagement/Widget/Numberformat.dart';
import 'package:lotterymanagement/Widget/PopupDialog.dart';
import 'package:lotterymanagement/Widget/Textfield.dart';

class InputLotttery extends StatefulWidget {
  const InputLotttery({Key key}) : super(key: key);
  @override
  _InputLottteryState createState() => _InputLottteryState();
}

class _InputLottteryState extends State<InputLotttery> {
  InputNumberCTR inputnum = Get.put(InputNumberCTR());
  @override
  void initState() {
    inputnum.getNumber().then((value) => inputnum.onloading(value));
    inputnum.closeSelling();
    inputnum.menu.disable(true);
    inputnum.number.clear();
    inputnum.empty("");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => inputnum.statusCode.value == "error"
          ? HttpError(
              title: StatusCodeText.httpError,
            )
          : inputnum.statusCode.value == "500"
              ? HttpError(
                  title: StatusCodeText.httpError,
                )
              : Scaffold(
                  backgroundColor: colorbackground,
                  appBar: Responsive.isMobile(context)
                      ? HeaderMobile(
                          controller: inputnum.search,
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
                              title: "ການຕັ້ງຄ່າ ແລະ ເປີດ",
                              search: inputnum.search,
                              onTap: () {},
                            ),
                          ),
                        ),
                  body: !Responsive.isMobile(context)
                      ? SafeArea(
                          child: Container(
                              width: double.infinity,
                              color: colorbackground,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 50, left: 50, top: 30),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "ປ້ອນເລກອອກ",
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
                                      height: 15,
                                    ),
                                    SizedBox(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          //c1
                                          Row(
                                            children: [
                                              Text(
                                                "ງວດ",
                                                style: TextStyle(
                                                    fontFamily: phetsarath,
                                                    color: colorblack,
                                                    fontSize: fontgeneral,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                inputnum.onloading.value !=
                                                        "200"
                                                    ? "ວ່າງເປົ່າ"
                                                    : inputnum.currentperiod[0]
                                                        .periodNumber
                                                        .toString(),
                                                style: TextStyle(
                                                    fontFamily: phetsarath,
                                                    color: colorblack,
                                                    fontSize: fontgeneral,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 50,
                                          ),
                                          //c2
                                          Row(
                                            children: [
                                              Text(
                                                "ວັນທີ",
                                                style: TextStyle(
                                                    fontFamily: phetsarath,
                                                    color: colorblack,
                                                    fontSize: fontgeneral,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                DateFormat("dd/MM/yyyy")
                                                    .format(DateTime.now()),
                                                style: TextStyle(
                                                    fontFamily: phetsarath,
                                                    color: colorblack,
                                                    fontSize: fontgeneral,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 50,
                                          ),
                                          //c3
                                          Row(
                                            children: [
                                              Text(
                                                "ສະຖານະ",
                                                style: TextStyle(
                                                    fontFamily: phetsarath,
                                                    color: colorblack,
                                                    fontSize: fontgeneral,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                inputnum.onloading.value !=
                                                        "200"
                                                    ? inputnum.online("ປິດ")
                                                    : inputnum.currentperiod[0]
                                                        .onlineStatus,
                                                style: TextStyle(
                                                    fontFamily: phetsarath,
                                                    color: inputnum.onloading
                                                                .value !=
                                                            "200"
                                                        ? colorred
                                                        : inputnum
                                                                    .currentperiod[
                                                                        0]
                                                                    .onlineStatus ==
                                                                inputnum.online(
                                                                    "ເປີດ")
                                                            ? colorgreen
                                                            : colorred,
                                                    fontSize: fontgeneral,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          // const SizedBox(
                                          //   width: 10,
                                          // ),
                                          // //c4
                                          // inputnum.onloading.value != "200"
                                          //     ? SizedBox(
                                          //         width: 50,
                                          //         height: 50,
                                          //         child: Image.asset(
                                          //             "assets/icons/offdisable.png"))
                                          //     : SizedBox(
                                          //         width: 50,
                                          //         height: 50,
                                          //         child: InkWell(
                                          //           onTap: () {
                                          //             inputnum
                                          //                 .updatecloseperiod(inputnum
                                          //                     .currentperiod[0]
                                          //                     .onlineId
                                          //                     .toString())
                                          //                 .then((value) {
                                          //               if (value == "200") {
                                          //                 Get.snackbar(
                                          //                     "Warning Messages !", "",
                                          //                     messageText: Text(
                                          //                         StatusCodeText
                                          //                             .statusCodeText200,
                                          //                         style: TextStyle(
                                          //                             fontFamily:
                                          //                                 phetsarath,
                                          //                             color:
                                          //                                 colorblack,
                                          //                             fontSize:
                                          //                                 fontgeneral,
                                          //                             fontWeight:
                                          //                                 FontWeight
                                          //                                     .normal)),
                                          //                     maxWidth: 500,
                                          //                     backgroundColor:
                                          //                         colorwhite,
                                          //                     snackPosition:
                                          //                         SnackPosition.TOP,
                                          //                     icon: const Icon(
                                          //                       Icons.message,
                                          //                       color: colorgreen,
                                          //                     ));
                                          //                 inputnum.getNumber().then(
                                          //                     (value) => inputnum
                                          //                         .onloading(value));
                                          //               } else if (value == "401") {
                                          //                 CustomDialogs.errorDialogs(
                                          //                     context,
                                          //                     StatusCodeText
                                          //                         .statusCodeText401);
                                          //               } else if (value == "403") {
                                          //                 CustomDialogs.errorDialogs(
                                          //                     context,
                                          //                     StatusCodeText
                                          //                         .statusCodeText403);
                                          //               } else if (value == "404") {
                                          //                 CustomDialogs.errorDialogs(
                                          //                     context,
                                          //                     StatusCodeText
                                          //                         .statusCodeText404);
                                          //               } else {
                                          //                 CustomDialogs.errorDialogs(
                                          //                     context,
                                          //                     StatusCodeText
                                          //                         .statusCodeText500);
                                          //               }
                                          //             });
                                          //           },
                                          //           child: Image.asset(
                                          //               "assets/icons/offbutton.png"),
                                          //         ))
                                          // Button(
                                          //   height: 42,
                                          //   title: inputnum.onClosed.value == false
                                          //       ? "ປິດການຂາຍ"
                                          //       : "ລໍຖ້າ...",
                                          //   colorstype: colorwhite,
                                          //   fontFamily: phetsarath,
                                          //   fontSize: fontgeneral,
                                          //   onPressed: () {
                                          //     if (inputnum.onClosed.value == false) {
                                          //       inputnum.onClosed(true);
                                          //       if (inputnum.currentperiod[0].onlineId
                                          //               .toString() !=
                                          //           null) {
                                          //         inputnum
                                          //             .updatecloseperiod(inputnum
                                          //                 .currentperiod[0].onlineId
                                          //                 .toString())
                                          //             .then((value) {
                                          //           if (value == "200") {
                                          //             Get.snackbar(
                                          //                 StatusCodeText.messages,
                                          //                 StatusCodeText
                                          //                     .statusCodeText200,
                                          //                 maxWidth: 500,
                                          //                 backgroundColor: colorwhite,
                                          //                 snackPosition:
                                          //                     SnackPosition.TOP,
                                          //                 icon: const Icon(
                                          //                   Icons.message,
                                          //                   color: colorgreen,
                                          //                 ));
                                          //             inputnum.getNumber().then(
                                          //                 (value) => inputnum
                                          //                     .onloading(value));
                                          //           } else if (value == "401") {
                                          //             CustomDialogs.errorDialogs(
                                          //                 context,
                                          //                 StatusCodeText
                                          //                     .statusCodeText401);
                                          //           } else if (value == "403") {
                                          //             CustomDialogs.errorDialogs(
                                          //                 context,
                                          //                 StatusCodeText
                                          //                     .statusCodeText403);
                                          //           } else if (value == "404") {
                                          //             CustomDialogs.errorDialogs(
                                          //                 context,
                                          //                 StatusCodeText
                                          //                     .statusCodeText404);
                                          //           } else {
                                          //             CustomDialogs.errorDialogs(
                                          //                 context,
                                          //                 StatusCodeText
                                          //                     .statusCodeText500);
                                          //           }
                                          //         }).whenComplete(() =>
                                          //                 inputnum.onClosed(false));
                                          //       }
                                          //     }
                                          //   },
                                          // )
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "ເລກ 6 ໂຕ",
                                          style: TextStyle(
                                              fontFamily: phetsarath,
                                              color: inputnum.empty.value == "1"
                                                  ? colorred
                                                  : colorblack,
                                              fontSize: fontgeneral,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 400,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Textfield(
                                                  inputFormatters: [
                                                    Numberformated
                                                        .maskFormatter,
                                                  ],
                                                  fontFamily: phetsarath,
                                                  focusNode: inputnum.f1,
                                                  obscureText: false,
                                                  bordercolor:
                                                      inputnum.empty.value ==
                                                              "1"
                                                          ? colorred
                                                          : colordarkblue,
                                                  controller: inputnum.number,
                                                  fontWeight: FontWeight.normal,
                                                  textInputType:
                                                      TextInputType.text,
                                                  size: 250,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 40,
                                            ),
                                            ButtonInput(
                                              height: 42,
                                              title: "ອັບເດດເລກອອກ",
                                              colorstype: colorwhite,
                                              fontFamily: phetsarath,
                                              fontSize: fontgeneral,
                                              onPressed: () {
                                                if (inputnum.online.value ==
                                                    "ປິດ") {
                                                  CustomDialogs.errorDialogs(
                                                      context,
                                                      " ງວດນີ້ຖືກປິດແລ້ວ");
                                                  inputnum.number.clear();
                                                  FocusScope.of(context)
                                                      .requestFocus(
                                                          inputnum.f1);
                                                } else {
                                                  if (inputnum.number.text ==
                                                      "") {
                                                    inputnum.empty("1");
                                                    FocusScope.of(context)
                                                        .requestFocus(
                                                            inputnum.f1);
                                                  } else if (inputnum
                                                          .number.text.length <
                                                      6) {
                                                    CustomDialogs.errorDialogs(
                                                        context,
                                                        " ກະລຸນາປ້ອນໃຫ້ຄົບ 6 ຕົວເລກ");
                                                    inputnum.empty("1");
                                                    FocusScope.of(context)
                                                        .requestFocus(
                                                            inputnum.f1);
                                                  } else {
                                                    CustomDialogs
                                                        .confirmDialogs(context,
                                                            () {
                                                      if (inputnum.onUpdates
                                                              .value ==
                                                          false) {
                                                        inputnum
                                                            .onUpdates(true);
                                                        inputnum.empty("");
                                                        inputnum
                                                            .postInputNumber(
                                                                inputnum.number
                                                                    .text,
                                                                inputnum
                                                                    .currentperiod[
                                                                        0]
                                                                    .periodNumber
                                                                    .toString(),
                                                                inputnum
                                                                    .menu
                                                                    .userid
                                                                    .value)
                                                            .then((value) {
                                                          if (value == "201") {
                                                            // calculatsale_win
                                                            inputnum.postcalculateWin(
                                                                inputnum.number
                                                                    .text,
                                                                inputnum
                                                                    .currentperiod[
                                                                        0]
                                                                    .periodNumber
                                                                    .toString());
                                                            // calculatsale_win
                                                            // calculatsale
                                                            inputnum.postcalculatesale(
                                                                inputnum
                                                                    .currentperiod[
                                                                        0]
                                                                    .periodNumber
                                                                    .toString());
                                                            // calculatsale
                                                            Get.snackbar(
                                                                "Warning Messages !",
                                                                "",
                                                                messageText: Text(
                                                                    StatusCodeText
                                                                        .statusCodeText201,
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            phetsarath,
                                                                        color:
                                                                            colorblack,
                                                                        fontSize:
                                                                            fontgeneral,
                                                                        fontWeight: FontWeight
                                                                            .normal)),
                                                                maxWidth: 500,
                                                                backgroundColor:
                                                                    colorwhite,
                                                                snackPosition:
                                                                    SnackPosition
                                                                        .TOP,
                                                                icon:
                                                                    const Icon(
                                                                  Icons.message,
                                                                  color:
                                                                      colorgreen,
                                                                ));
                                                            inputnum.number
                                                                .text = "";
                                                            FocusScope.of(
                                                                    context)
                                                                .requestFocus(
                                                                    inputnum
                                                                        .f1);
                                                            Navigator.pop(
                                                                context);
                                                            // update period
                                                            inputnum
                                                                .updatecloseperiod(inputnum
                                                                    .currentperiod[
                                                                        0]
                                                                    .onlineId
                                                                    .toString())
                                                                .then((value) {
                                                              if (value ==
                                                                  "200") {
                                                                inputnum
                                                                    .getNumber()
                                                                    .then((value) =>
                                                                        inputnum
                                                                            .onloading(value));
                                                              } else if (value ==
                                                                  "401") {
                                                                CustomDialogs
                                                                    .errorDialogs(
                                                                        context,
                                                                        StatusCodeText
                                                                            .statusCodeText401);
                                                              } else if (value ==
                                                                  "403") {
                                                                CustomDialogs
                                                                    .errorDialogs(
                                                                        context,
                                                                        StatusCodeText
                                                                            .statusCodeText403);
                                                              } else if (value ==
                                                                  "404") {
                                                                CustomDialogs
                                                                    .errorDialogs(
                                                                        context,
                                                                        StatusCodeText
                                                                            .statusCodeText404);
                                                              } else {
                                                                CustomDialogs
                                                                    .errorDialogs(
                                                                        context,
                                                                        StatusCodeText
                                                                            .statusCodeText500);
                                                              }
                                                            });
                                                            // update peroid

                                                          } else if (value ==
                                                              "401") {
                                                            CustomDialogs
                                                                .errorDialogs(
                                                                    context,
                                                                    StatusCodeText
                                                                        .statusCodeText401);
                                                          } else if (value ==
                                                              "403") {
                                                            CustomDialogs
                                                                .errorDialogs(
                                                                    context,
                                                                    StatusCodeText
                                                                        .statusCodeText403);
                                                          } else if (value ==
                                                              "404") {
                                                            CustomDialogs
                                                                .errorDialogs(
                                                                    context,
                                                                    StatusCodeText
                                                                        .statusCodeText404);
                                                          } else {
                                                            CustomDialogs
                                                                .errorDialogs(
                                                                    context,
                                                                    StatusCodeText
                                                                        .statusCodeText500);
                                                          }
                                                        });
                                                      }
                                                    }, "ທ່ານຕ້ອງການຢືນຢັນແທ້ບໍ່ ?",
                                                            "ຢືນຢັ້ນ");
                                                  }
                                                }
                                              },
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        )
                      :
                      //////////////////////////////////////// Mobile //////////////////////////////////////
                      SafeArea(
                          child: Container(
                              width: double.infinity,
                              color: colorbackground,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "ປ້ອນເລກອອກ",
                                      style: TextStyle(
                                          fontFamily: phetsarath,
                                          color: colordarkblue,
                                          fontSize: fontmenu,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        //c1
                                        Row(
                                          children: [
                                            Text(
                                              "ງວດ",
                                              style: TextStyle(
                                                  fontFamily: phetsarath,
                                                  color: colorblack,
                                                  fontSize: fontgeneral,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              inputnum.onloading.value != "200"
                                                  ? "ວ່າງເປົ່າ"
                                                  : inputnum.currentperiod[0]
                                                      .periodNumber
                                                      .toString(),
                                              style: TextStyle(
                                                  fontFamily: phetsarath,
                                                  color: colorblack,
                                                  fontSize: fontgeneral,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        //c2
                                        Row(
                                          children: [
                                            Text(
                                              "ວັນທີ",
                                              style: TextStyle(
                                                  fontFamily: phetsarath,
                                                  color: colorblack,
                                                  fontSize: fontgeneral,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              DateFormat("dd/MM/yyyy")
                                                  .format(DateTime.now()),
                                              style: TextStyle(
                                                  fontFamily: phetsarath,
                                                  color: colorblack,
                                                  fontSize: fontgeneral,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        //c3
                                        Row(
                                          children: [
                                            Text(
                                              "ສະຖານະ",
                                              style: TextStyle(
                                                  fontFamily: phetsarath,
                                                  color: colorblack,
                                                  fontSize: fontgeneral,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              inputnum.onloading.value != "200"
                                                  ? inputnum.online("ປິດ")
                                                  : inputnum.currentperiod[0]
                                                      .onlineStatus,
                                              style: TextStyle(
                                                  fontFamily: phetsarath,
                                                  color: inputnum.onloading
                                                              .value !=
                                                          "200"
                                                      ? colorred
                                                      : inputnum
                                                                  .currentperiod[
                                                                      0]
                                                                  .onlineStatus ==
                                                              inputnum.online(
                                                                  "ເປີດ")
                                                          ? colorgreen
                                                          : colorred,
                                                  fontSize: fontgeneral,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        // const SizedBox(
                                        //   width: 10,
                                        // ),
                                        // //c4
                                        // inputnum.onloading.value != "200"
                                        //     ? SizedBox(
                                        //         width: 50,
                                        //         height: 50,
                                        //         child: Image.asset(
                                        //             "assets/icons/offdisable.png"))
                                        //     : SizedBox(
                                        //         width: 50,
                                        //         height: 50,
                                        //         child: InkWell(
                                        //           onTap: () {
                                        //             inputnum
                                        //                 .updatecloseperiod(inputnum
                                        //                     .currentperiod[0]
                                        //                     .onlineId
                                        //                     .toString())
                                        //                 .then((value) {
                                        //               if (value == "200") {
                                        //                 Get.snackbar(
                                        //                     "Warning Messages !", "",
                                        //                     messageText: Text(
                                        //                         StatusCodeText
                                        //                             .statusCodeText200,
                                        //                         style: TextStyle(
                                        //                             fontFamily:
                                        //                                 phetsarath,
                                        //                             color:
                                        //                                 colorblack,
                                        //                             fontSize:
                                        //                                 fontgeneral,
                                        //                             fontWeight:
                                        //                                 FontWeight
                                        //                                     .normal)),
                                        //                     maxWidth: 500,
                                        //                     backgroundColor:
                                        //                         colorwhite,
                                        //                     snackPosition:
                                        //                         SnackPosition.TOP,
                                        //                     icon: const Icon(
                                        //                       Icons.message,
                                        //                       color: colorgreen,
                                        //                     ));
                                        //                 inputnum.getNumber().then(
                                        //                     (value) => inputnum
                                        //                         .onloading(value));
                                        //               } else if (value == "401") {
                                        //                 CustomDialogs.errorDialogs(
                                        //                     context,
                                        //                     StatusCodeText
                                        //                         .statusCodeText401);
                                        //               } else if (value == "403") {
                                        //                 CustomDialogs.errorDialogs(
                                        //                     context,
                                        //                     StatusCodeText
                                        //                         .statusCodeText403);
                                        //               } else if (value == "404") {
                                        //                 CustomDialogs.errorDialogs(
                                        //                     context,
                                        //                     StatusCodeText
                                        //                         .statusCodeText404);
                                        //               } else {
                                        //                 CustomDialogs.errorDialogs(
                                        //                     context,
                                        //                     StatusCodeText
                                        //                         .statusCodeText500);
                                        //               }
                                        //             });
                                        //           },
                                        //           child: Image.asset(
                                        //               "assets/icons/offbutton.png"),
                                        //         ))
                                        // Button(
                                        //   height: 42,
                                        //   title: inputnum.onClosed.value == false
                                        //       ? "ປິດການຂາຍ"
                                        //       : "ລໍຖ້າ...",
                                        //   colorstype: colorwhite,
                                        //   fontFamily: phetsarath,
                                        //   fontSize: fontgeneral,
                                        //   onPressed: () {
                                        //     if (inputnum.onClosed.value == false) {
                                        //       inputnum.onClosed(true);
                                        //       if (inputnum.currentperiod[0].onlineId
                                        //               .toString() !=
                                        //           null) {
                                        //         inputnum
                                        //             .updatecloseperiod(inputnum
                                        //                 .currentperiod[0].onlineId
                                        //                 .toString())
                                        //             .then((value) {
                                        //           if (value == "200") {
                                        //             Get.snackbar(
                                        //                 StatusCodeText.messages,
                                        //                 StatusCodeText
                                        //                     .statusCodeText200,
                                        //                 maxWidth: 500,
                                        //                 backgroundColor: colorwhite,
                                        //                 snackPosition:
                                        //                     SnackPosition.TOP,
                                        //                 icon: const Icon(
                                        //                   Icons.message,
                                        //                   color: colorgreen,
                                        //                 ));
                                        //             inputnum.getNumber().then(
                                        //                 (value) => inputnum
                                        //                     .onloading(value));
                                        //           } else if (value == "401") {
                                        //             CustomDialogs.errorDialogs(
                                        //                 context,
                                        //                 StatusCodeText
                                        //                     .statusCodeText401);
                                        //           } else if (value == "403") {
                                        //             CustomDialogs.errorDialogs(
                                        //                 context,
                                        //                 StatusCodeText
                                        //                     .statusCodeText403);
                                        //           } else if (value == "404") {
                                        //             CustomDialogs.errorDialogs(
                                        //                 context,
                                        //                 StatusCodeText
                                        //                     .statusCodeText404);
                                        //           } else {
                                        //             CustomDialogs.errorDialogs(
                                        //                 context,
                                        //                 StatusCodeText
                                        //                     .statusCodeText500);
                                        //           }
                                        //         }).whenComplete(() =>
                                        //                 inputnum.onClosed(false));
                                        //       }
                                        //     }
                                        //   },
                                        // )
                                      ],
                                    ),
                                    Text(
                                      "ເລກ 6 ໂຕ",
                                      style: TextStyle(
                                          fontFamily: phetsarath,
                                          color: inputnum.empty.value == "1"
                                              ? colorred
                                              : colorblack,
                                          fontSize: fontgeneral,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    Textfield(
                                      inputFormatters: [
                                        Numberformated.maskFormatter,
                                      ],
                                      fontFamily: phetsarath,
                                      focusNode: inputnum.f1,
                                      obscureText: false,
                                      bordercolor: inputnum.empty.value == "1"
                                          ? colorred
                                          : colordarkblue,
                                      controller: inputnum.number,
                                      fontWeight: FontWeight.normal,
                                      textInputType: TextInputType.text,
                                      size: double.infinity,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    ButtonInput(
                                      height: 42,
                                      title: "ອັບເດດເລກອອກ",
                                      colorstype: colorwhite,
                                      fontFamily: phetsarath,
                                      fontSize: fontgeneral,
                                      onPressed: () {
                                        if (inputnum.online.value == "ປິດ") {
                                          CustomDialogs.errorDialogs(
                                              context, " ງວດນີ້ຖືກປິດແລ້ວ");
                                          inputnum.number.clear();
                                          FocusScope.of(context)
                                              .requestFocus(inputnum.f1);
                                        } else {
                                          if (inputnum.number.text == "") {
                                            inputnum.empty("1");
                                            FocusScope.of(context)
                                                .requestFocus(inputnum.f1);
                                          } else if (inputnum
                                                  .number.text.length <
                                              6) {
                                            CustomDialogs.errorDialogs(context,
                                                " ກະລຸນາປ້ອນໃຫ້ຄົບ 6 ຕົວເລກ");
                                            inputnum.empty("1");
                                            FocusScope.of(context)
                                                .requestFocus(inputnum.f1);
                                          } else {
                                            CustomDialogs.confirmDialogs(
                                                context, () {
                                              if (inputnum.onUpdates.value ==
                                                  false) {
                                                inputnum.onUpdates(true);
                                                inputnum.empty("");
                                                inputnum
                                                    .postInputNumber(
                                                        inputnum.number.text,
                                                        inputnum
                                                            .currentperiod[0]
                                                            .periodNumber
                                                            .toString(),
                                                        inputnum
                                                            .menu.userid.value)
                                                    .then((value) {
                                                  if (value == "201") {
                                                    // calculatsale
                                                    inputnum.postcalculatesale(
                                                        inputnum
                                                            .currentperiod[0]
                                                            .periodNumber
                                                            .toString());
                                                    // calculatsale
                                                    // calculatsale_win
                                                    inputnum.postcalculateWin(
                                                        inputnum.number.text,
                                                        inputnum
                                                            .currentperiod[0]
                                                            .periodNumber
                                                            .toString());
                                                    // calculatsale_win
                                                    Get.snackbar(
                                                        "Warning Messages !", "",
                                                        messageText: Text(
                                                            StatusCodeText
                                                                .statusCodeText201,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    phetsarath,
                                                                color:
                                                                    colorblack,
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
                                                    inputnum.number.text = "";
                                                    FocusScope.of(context)
                                                        .requestFocus(
                                                            inputnum.f1);
                                                    Navigator.pop(context);
                                                    // update period
                                                    inputnum
                                                        .updatecloseperiod(
                                                            inputnum
                                                                .currentperiod[
                                                                    0]
                                                                .onlineId
                                                                .toString())
                                                        .then((value) {
                                                      if (value == "200") {
                                                        inputnum
                                                            .getNumber()
                                                            .then((value) =>
                                                                inputnum
                                                                    .onloading(
                                                                        value));
                                                      } else if (value ==
                                                          "401") {
                                                        CustomDialogs.errorDialogs(
                                                            context,
                                                            StatusCodeText
                                                                .statusCodeText401);
                                                      } else if (value ==
                                                          "403") {
                                                        CustomDialogs.errorDialogs(
                                                            context,
                                                            StatusCodeText
                                                                .statusCodeText403);
                                                      } else if (value ==
                                                          "404") {
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
                                                    });
                                                    // update peroid

                                                  } else if (value == "401") {
                                                    CustomDialogs.errorDialogs(
                                                        context,
                                                        StatusCodeText
                                                            .statusCodeText401);
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
                                                }).whenComplete(() => inputnum
                                                        .onUpdates(false));
                                              }
                                            }, "ທ່ານຕ້ອງການຢືນຢັນແທ້ບໍ່ ?",
                                                "ຢືນຢັ້ນ");
                                          }
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              )),
                        )),
    );
  }
}

class ButtonInput extends StatelessWidget {
  final double fontSize;
  final String fontFamily;
  final Function onPressed;
  final Color colorstype;
  final String title;
  final double height;
  const ButtonInput(
      {Key key,
      this.fontSize,
      this.fontFamily,
      this.onPressed,
      this.colorstype,
      this.title,
      this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: height,
      child: RaisedButton(
        color: colordarkblue,
        textColor: colorwhite,
        padding: const EdgeInsets.all(10),
        child: Text(
          title,
          style: TextStyle(
              color: colorstype,
              fontSize: fontSize,
              fontFamily: fontFamily,
              fontWeight: FontWeight.bold),
        ),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
