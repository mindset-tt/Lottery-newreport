// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lotterymanagement/AlertDialogs/CustomDialog.dart';
import 'package:lotterymanagement/Colors/Colors.dart';
import 'package:lotterymanagement/Controllers/Install_Open/QuotaCTR.dart';
import 'package:lotterymanagement/Fonts/Fonts.dart';
import 'package:lotterymanagement/Responsive/Responsive.dart';
import 'package:lotterymanagement/UrlRespose/StatusCodeError.dart';
import 'package:lotterymanagement/Widget/AppbarheaderMobile.dart';
import 'package:lotterymanagement/Widget/Button.dart';
import 'package:lotterymanagement/Widget/HttpError.dart';
import 'package:lotterymanagement/Widget/Numberformat.dart';
import 'package:lotterymanagement/Widget/PopupDialog.dart';
import 'package:lotterymanagement/Widget/ShowNullData.dart';
import 'package:lotterymanagement/Widget/Textfield.dart';
import 'package:pattern_formatter/pattern_formatter.dart';

class Quota extends StatefulWidget {
  const Quota({Key key}) : super(key: key);
  @override
  _QuotaState createState() => _QuotaState();
}

class _QuotaState extends State<Quota> {
  QuotaCTR quota = Get.put(QuotaCTR());
  @override
  void initState() {
    quota.getallquota();
    quota.menu.disable(true);
    quota.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => quota.statusCode.value == "error"
          ? HttpError(
              title: StatusCodeText.httpError,
            )
          : quota.statusCode.value == "500"
              ? HttpError(
                  title: StatusCodeText.httpError,
                )
              : Scaffold(
                  backgroundColor: colorbackground,
                  appBar: Responsive.isMobile(context)
                      ? HeaderMobile(
                          controller: quota.search,
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
                              search: quota.search,
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
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "ກຳນົດໂຄຕ້າການຂາຍ",
                                          style: TextStyle(
                                              fontFamily: phetsarath,
                                              color: colordarkblue,
                                              fontSize: fontmenu,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // c1
                                  SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "ເລກ 1 ໂຕ",
                                              style: TextStyle(
                                                  fontFamily: phetsarath,
                                                  color:
                                                      quota.empty.value == "1"
                                                          ? colorred
                                                          : colorblack,
                                                  fontSize: fontgeneral,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Textfield(
                                                fontFamily: phetsarath,
                                                focusNode:
                                                    quota.empty.value == "1"
                                                        ? quota.f1
                                                        : quota.f1,
                                                obscureText: false,
                                                bordercolor:
                                                    quota.empty.value == "1"
                                                        ? colorred
                                                        : colordarkblue,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                  ThousandsFormatter(
                                                      allowFraction: true),
                                                  LengthLimitingTextInputFormatter(
                                                      15),
                                                ],
                                                controller: quota.dt1,
                                                fontWeight: FontWeight.normal,
                                                textInputType:
                                                    TextInputType.number,
                                                size: 250,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "ເລກ 2 ໂຕ",
                                              style: TextStyle(
                                                  fontFamily: phetsarath,
                                                  color:
                                                      quota.empty.value == "2"
                                                          ? colorred
                                                          : colorblack,
                                                  fontSize: fontgeneral,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Textfield(
                                                fontFamily: phetsarath,
                                                focusNode:
                                                    quota.empty.value == "2"
                                                        ? quota.f2
                                                        : quota.f2,
                                                obscureText: false,
                                                bordercolor:
                                                    quota.empty.value == "2"
                                                        ? colorred
                                                        : colordarkblue,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                  ThousandsFormatter(
                                                      allowFraction: true),
                                                  LengthLimitingTextInputFormatter(
                                                      15),
                                                ],
                                                controller: quota.dt2,
                                                fontWeight: FontWeight.normal,
                                                textInputType:
                                                    TextInputType.number,
                                                size: 250,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "ເລກ 3 ໂຕ",
                                              style: TextStyle(
                                                  fontFamily: phetsarath,
                                                  color:
                                                      quota.empty.value == "3"
                                                          ? colorred
                                                          : colorblack,
                                                  fontSize: fontgeneral,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Textfield(
                                                inputFormatters: [
                                                  ThousandsFormatter(
                                                      allowFraction: true),
                                                  LengthLimitingTextInputFormatter(
                                                      15),
                                                ],
                                                fontFamily: phetsarath,
                                                focusNode:
                                                    quota.empty.value == "3"
                                                        ? quota.f3
                                                        : quota.f3,
                                                obscureText: false,
                                                bordercolor:
                                                    quota.empty.value == "3"
                                                        ? colorred
                                                        : colordarkblue,
                                                controller: quota.dt3,
                                                fontWeight: FontWeight.normal,
                                                textInputType:
                                                    TextInputType.text,
                                                size: 250,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  // c2
                                  SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "ເລກ 4 ໂຕ",
                                              style: TextStyle(
                                                  fontFamily: phetsarath,
                                                  color:
                                                      quota.empty.value == "4"
                                                          ? colorred
                                                          : colorblack,
                                                  fontSize: fontgeneral,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Textfield(
                                                fontFamily: phetsarath,
                                                focusNode:
                                                    quota.empty.value == "4"
                                                        ? quota.f4
                                                        : quota.f4,
                                                obscureText: false,
                                                bordercolor:
                                                    quota.empty.value == "4"
                                                        ? colorred
                                                        : colordarkblue,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                  ThousandsFormatter(
                                                      allowFraction: true),
                                                  LengthLimitingTextInputFormatter(
                                                      15),
                                                ],
                                                controller: quota.dt4,
                                                fontWeight: FontWeight.normal,
                                                textInputType:
                                                    TextInputType.number,
                                                size: 250,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "ເລກ 5 ໂຕ",
                                              style: TextStyle(
                                                  fontFamily: phetsarath,
                                                  color:
                                                      quota.empty.value == "5"
                                                          ? colorred
                                                          : colorblack,
                                                  fontSize: fontgeneral,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Textfield(
                                                inputFormatters: [
                                                  ThousandsFormatter(
                                                      allowFraction: true),
                                                  LengthLimitingTextInputFormatter(
                                                      15),
                                                ],
                                                fontFamily: phetsarath,
                                                focusNode:
                                                    quota.empty.value == "5"
                                                        ? quota.f5
                                                        : quota.f5,
                                                obscureText: false,
                                                bordercolor:
                                                    quota.empty.value == "5"
                                                        ? colorred
                                                        : colordarkblue,
                                                controller: quota.dt5,
                                                fontWeight: FontWeight.normal,
                                                textInputType:
                                                    TextInputType.text,
                                                size: 250,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "ເລກ 6 ໂຕ",
                                              style: TextStyle(
                                                  fontFamily: phetsarath,
                                                  color:
                                                      quota.empty.value == "6"
                                                          ? colorred
                                                          : colorblack,
                                                  fontSize: fontgeneral,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Textfield(
                                                inputFormatters: [
                                                  ThousandsFormatter(
                                                      allowFraction: true),
                                                  LengthLimitingTextInputFormatter(
                                                      15),
                                                ],
                                                fontFamily: phetsarath,
                                                focusNode:
                                                    quota.empty.value == "6"
                                                        ? quota.f6
                                                        : quota.f6,
                                                obscureText: false,
                                                bordercolor:
                                                    quota.empty.value == "6"
                                                        ? colorred
                                                        : colordarkblue,
                                                controller: quota.dt6,
                                                fontWeight: FontWeight.normal,
                                                textInputType:
                                                    TextInputType.emailAddress,
                                                size: 250,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                    width: 250,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Button(
                                          height: 42,
                                          title: quota.onTap.value == false
                                              ? "ບັນທຶກ"
                                              : "ລໍຖ້າ...",
                                          colorstype: colorwhite,
                                          fontFamily: phetsarath,
                                          fontSize: fontgeneral,
                                          onPressed: () {
                                            if (quota.dt1.text == "") {
                                              quota.empty("1");
                                              FocusScope.of(context)
                                                  .requestFocus(quota.f1);
                                            } else if (quota.dt2.text == "") {
                                              quota.empty("2");
                                              FocusScope.of(context)
                                                  .requestFocus(quota.f2);
                                            } else if (quota.dt3.text == "") {
                                              quota.empty("3");
                                              FocusScope.of(context)
                                                  .requestFocus(quota.f3);
                                            } else if (quota.dt4.text == "") {
                                              quota.empty("4");
                                              FocusScope.of(context)
                                                  .requestFocus(quota.f4);
                                            } else if (quota.dt5.text == "") {
                                              quota.empty("5");
                                              FocusScope.of(context)
                                                  .requestFocus(quota.f5);
                                            } else if (quota.dt6.text == "") {
                                              quota.empty("6");
                                              FocusScope.of(context)
                                                  .requestFocus(quota.f6);
                                            } else {
                                              if (quota.onTap.value == false) {
                                                quota.onTap(true);
                                                quota.empty("");
                                                quota
                                                    .quotaupdate(
                                                  quota.dt1.text
                                                      .replaceAll(",", ""),
                                                  quota.dt2.text
                                                      .replaceAll(",", ""),
                                                  quota.dt3.text
                                                      .replaceAll(",", ""),
                                                  quota.dt4.text
                                                      .replaceAll(",", ""),
                                                  quota.dt5.text
                                                      .replaceAll(",", ""),
                                                  quota.dt6.text
                                                      .replaceAll(",", ""),
                                                )
                                                    .then((value) {
                                                  if (value == "200") {
                                                    quota.getallquota();
                                                    Get.snackbar(
                                                        "Warning Messages !", "",
                                                        messageText: Text(
                                                            StatusCodeText
                                                                .statusCodeText200,
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
                                                    quota.clear();
                                                    FocusScope.of(context)
                                                        .requestFocus(quota.f1);
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
                                                }).whenComplete(() =>
                                                        quota.onTap(false));
                                              }
                                            }
                                          },
                                        ),
                                        ButtonQuota(
                                          title: "ເລືອກທັງຫມົດ",
                                          colorstype: colordarkblue,
                                          fontFamily: phetsarath,
                                          fontSize: fontgeneral,
                                          onPressed: () {
                                            quota.dt1.text = Numberformated
                                                .formated
                                                .format(double.parse(quota
                                                    .quotamd[0].maxValues));
                                            quota.dt2.text = Numberformated
                                                .formated
                                                .format(double.parse(quota
                                                    .quotamd[1].maxValues));
                                            quota.dt3.text = Numberformated
                                                .formated
                                                .format(double.parse(quota
                                                    .quotamd[2].maxValues));
                                            quota.dt4.text = Numberformated
                                                .formated
                                                .format(double.parse(quota
                                                    .quotamd[3].maxValues));
                                            quota.dt5.text = Numberformated
                                                .formated
                                                .format(double.parse(quota
                                                    .quotamd[4].maxValues));
                                            quota.dt6.text = Numberformated
                                                .formated
                                                .format(double.parse(quota
                                                    .quotamd[5].maxValues));
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  quota.quotamd.isEmpty
                                      ? const ShowNullData(
                                          width: 150,
                                          height: 150,
                                        )
                                      : Expanded(
                                          child: SizedBox(
                                          width: 350,
                                          child: ListView.builder(
                                            itemCount: quota.quotamd.length,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ListNumber(
                                                    name:
                                                        "ເລກ ${quota.quotamd[index].digitLenght} ໂຕ:",
                                                    number:
                                                        "${Numberformated.formated.format(double.parse(quota.quotamd[index].maxValues))} ກີບ",
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ))
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
                              height: 1050,
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
                                      "ກຳນົດໂຄຕ້າການຂາຍ",
                                      style: TextStyle(
                                          fontFamily: phetsarath,
                                          color: colordarkblue,
                                          fontSize: fontmenu,
                                          fontWeight: FontWeight.bold),
                                    ),

                                    // c1
                                    Text(
                                      "ເລກ 1 ໂຕ",
                                      style: TextStyle(
                                          fontFamily: phetsarath,
                                          color: quota.empty.value == "1"
                                              ? colorred
                                              : colorblack,
                                          fontSize: fontgeneral,
                                          fontWeight: FontWeight.normal),
                                    ),

                                    Textfield(
                                      fontFamily: phetsarath,
                                      focusNode: quota.empty.value == "1"
                                          ? quota.f1
                                          : quota.f1,
                                      obscureText: false,
                                      bordercolor: quota.empty.value == "1"
                                          ? colorred
                                          : colordarkblue,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        ThousandsFormatter(allowFraction: true),
                                        LengthLimitingTextInputFormatter(15),
                                      ],
                                      controller: quota.dt1,
                                      fontWeight: FontWeight.normal,
                                      textInputType: TextInputType.number,
                                      size: double.infinity,
                                    ),

                                    Text(
                                      "ເລກ 2 ໂຕ",
                                      style: TextStyle(
                                          fontFamily: phetsarath,
                                          color: quota.empty.value == "2"
                                              ? colorred
                                              : colorblack,
                                          fontSize: fontgeneral,
                                          fontWeight: FontWeight.normal),
                                    ),

                                    Textfield(
                                      fontFamily: phetsarath,
                                      focusNode: quota.empty.value == "2"
                                          ? quota.f2
                                          : quota.f2,
                                      obscureText: false,
                                      bordercolor: quota.empty.value == "2"
                                          ? colorred
                                          : colordarkblue,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        ThousandsFormatter(allowFraction: true),
                                        LengthLimitingTextInputFormatter(15),
                                      ],
                                      controller: quota.dt2,
                                      fontWeight: FontWeight.normal,
                                      textInputType: TextInputType.number,
                                      size: double.infinity,
                                    ),

                                    Text(
                                      "ເລກ 3 ໂຕ",
                                      style: TextStyle(
                                          fontFamily: phetsarath,
                                          color: quota.empty.value == "3"
                                              ? colorred
                                              : colorblack,
                                          fontSize: fontgeneral,
                                          fontWeight: FontWeight.normal),
                                    ),

                                    Textfield(
                                      inputFormatters: [
                                        ThousandsFormatter(allowFraction: true),
                                        LengthLimitingTextInputFormatter(15),
                                      ],
                                      fontFamily: phetsarath,
                                      focusNode: quota.empty.value == "3"
                                          ? quota.f3
                                          : quota.f3,
                                      obscureText: false,
                                      bordercolor: quota.empty.value == "3"
                                          ? colorred
                                          : colordarkblue,
                                      controller: quota.dt3,
                                      fontWeight: FontWeight.normal,
                                      textInputType: TextInputType.text,
                                      size: double.infinity,
                                    ),

                                    // c2
                                    Text(
                                      "ເລກ 4 ໂຕ",
                                      style: TextStyle(
                                          fontFamily: phetsarath,
                                          color: quota.empty.value == "4"
                                              ? colorred
                                              : colorblack,
                                          fontSize: fontgeneral,
                                          fontWeight: FontWeight.normal),
                                    ),

                                    Textfield(
                                      fontFamily: phetsarath,
                                      focusNode: quota.empty.value == "4"
                                          ? quota.f4
                                          : quota.f4,
                                      obscureText: false,
                                      bordercolor: quota.empty.value == "4"
                                          ? colorred
                                          : colordarkblue,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        ThousandsFormatter(allowFraction: true),
                                        LengthLimitingTextInputFormatter(15),
                                      ],
                                      controller: quota.dt4,
                                      fontWeight: FontWeight.normal,
                                      textInputType: TextInputType.number,
                                      size: double.infinity,
                                    ),

                                    Text(
                                      "ເລກ 5 ໂຕ",
                                      style: TextStyle(
                                          fontFamily: phetsarath,
                                          color: quota.empty.value == "5"
                                              ? colorred
                                              : colorblack,
                                          fontSize: fontgeneral,
                                          fontWeight: FontWeight.normal),
                                    ),

                                    Textfield(
                                      inputFormatters: [
                                        ThousandsFormatter(allowFraction: true),
                                        LengthLimitingTextInputFormatter(15),
                                      ],
                                      fontFamily: phetsarath,
                                      focusNode: quota.empty.value == "5"
                                          ? quota.f5
                                          : quota.f5,
                                      obscureText: false,
                                      bordercolor: quota.empty.value == "5"
                                          ? colorred
                                          : colordarkblue,
                                      controller: quota.dt5,
                                      fontWeight: FontWeight.normal,
                                      textInputType: TextInputType.text,
                                      size: double.infinity,
                                    ),

                                    Text(
                                      "ເລກ 6 ໂຕ",
                                      style: TextStyle(
                                          fontFamily: phetsarath,
                                          color: quota.empty.value == "6"
                                              ? colorred
                                              : colorblack,
                                          fontSize: fontgeneral,
                                          fontWeight: FontWeight.normal),
                                    ),

                                    Textfield(
                                      inputFormatters: [
                                        ThousandsFormatter(allowFraction: true),
                                        LengthLimitingTextInputFormatter(15),
                                      ],
                                      fontFamily: phetsarath,
                                      focusNode: quota.empty.value == "6"
                                          ? quota.f6
                                          : quota.f6,
                                      obscureText: false,
                                      bordercolor: quota.empty.value == "6"
                                          ? colorred
                                          : colordarkblue,
                                      controller: quota.dt6,
                                      fontWeight: FontWeight.normal,
                                      textInputType: TextInputType.emailAddress,
                                      size: double.infinity,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: Button(
                                            height: 50,
                                            title: quota.onTap.value == false
                                                ? "ບັນທຶກ"
                                                : "ລໍຖ້າ...",
                                            colorstype: colorwhite,
                                            fontFamily: phetsarath,
                                            fontSize: fontgeneral,
                                            onPressed: () {
                                              if (quota.dt1.text == "") {
                                                quota.empty("1");
                                                FocusScope.of(context)
                                                    .requestFocus(quota.f1);
                                              } else if (quota.dt2.text == "") {
                                                quota.empty("2");
                                                FocusScope.of(context)
                                                    .requestFocus(quota.f2);
                                              } else if (quota.dt3.text == "") {
                                                quota.empty("3");
                                                FocusScope.of(context)
                                                    .requestFocus(quota.f3);
                                              } else if (quota.dt4.text == "") {
                                                quota.empty("4");
                                                FocusScope.of(context)
                                                    .requestFocus(quota.f4);
                                              } else if (quota.dt5.text == "") {
                                                quota.empty("5");
                                                FocusScope.of(context)
                                                    .requestFocus(quota.f5);
                                              } else if (quota.dt6.text == "") {
                                                quota.empty("6");
                                                FocusScope.of(context)
                                                    .requestFocus(quota.f6);
                                              } else {
                                                if (quota.onTap.value ==
                                                    false) {
                                                  quota.onTap(true);
                                                  quota.empty("");
                                                  quota
                                                      .quotaupdate(
                                                    quota.dt1.text
                                                        .replaceAll(",", ""),
                                                    quota.dt2.text
                                                        .replaceAll(",", ""),
                                                    quota.dt3.text
                                                        .replaceAll(",", ""),
                                                    quota.dt4.text
                                                        .replaceAll(",", ""),
                                                    quota.dt5.text
                                                        .replaceAll(",", ""),
                                                    quota.dt6.text
                                                        .replaceAll(",", ""),
                                                  )
                                                      .then((value) {
                                                    if (value == "200") {
                                                      quota.getallquota();
                                                      Get.snackbar(
                                                          "Warning Messages !", "",
                                                          messageText: Text(
                                                              StatusCodeText
                                                                  .statusCodeText200,
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
                                                      quota.clear();
                                                      FocusScope.of(context)
                                                          .requestFocus(
                                                              quota.f1);
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
                                                  }).whenComplete(() =>
                                                          quota.onTap(false));
                                                }
                                              }
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: ButtonQuota(
                                            title: "ເລືອກທັງຫມົດ",
                                            colorstype: colordarkblue,
                                            fontFamily: phetsarath,
                                            fontSize: fontgeneral,
                                            onPressed: () {
                                              quota.dt1.text = Numberformated
                                                  .formated
                                                  .format(double.parse(quota
                                                      .quotamd[0].maxValues));
                                              quota.dt2.text = Numberformated
                                                  .formated
                                                  .format(double.parse(quota
                                                      .quotamd[1].maxValues));
                                              quota.dt3.text = Numberformated
                                                  .formated
                                                  .format(double.parse(quota
                                                      .quotamd[2].maxValues));
                                              quota.dt4.text = Numberformated
                                                  .formated
                                                  .format(double.parse(quota
                                                      .quotamd[3].maxValues));
                                              quota.dt5.text = Numberformated
                                                  .formated
                                                  .format(double.parse(quota
                                                      .quotamd[4].maxValues));
                                              quota.dt6.text = Numberformated
                                                  .formated
                                                  .format(double.parse(quota
                                                      .quotamd[5].maxValues));
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    quota.quotamd.isEmpty
                                        ? const ShowNullData(
                                            width: 150,
                                            height: 150,
                                          )
                                        : Expanded(
                                            child: SizedBox(
                                            width: double.infinity,
                                            child: ListView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount: quota.quotamd.length,
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ListNumber(
                                                      name:
                                                          "ເລກ ${quota.quotamd[index].digitLenght} ໂຕ:",
                                                      number:
                                                          "${Numberformated.formated.format(double.parse(quota.quotamd[index].maxValues))} ກີບ",
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
    );
  }
}

class ListNumber extends StatelessWidget {
  const ListNumber({
    Key key,
    this.name,
    this.number,
  }) : super(key: key);
  final String name, number;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: TextStyle(
                  fontFamily: phetsarath,
                  color: colorblack,
                  fontSize: fontmiddle,
                  fontWeight: FontWeight.normal),
            ),
            Text(
              number,
              style: TextStyle(
                  fontFamily: phetsarath,
                  color: colorblack,
                  fontSize: fontmiddle,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
        Container(
          height: 2,
          color: colorblack,
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

class ButtonQuota extends StatelessWidget {
  final double fontSize;
  final String fontFamily;
  final Function onPressed;
  final Color colorstype;
  final String title;
  const ButtonQuota(
      {Key key,
      this.fontSize,
      this.fontFamily,
      this.onPressed,
      this.colorstype,
      this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: Responsive.isMobile(context) ? 50 : 42,
      child: RaisedButton(
        color: colorwhite,
        textColor: colordarkblue,
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
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: colordarkblue)),
      ),
    );
  }
}
