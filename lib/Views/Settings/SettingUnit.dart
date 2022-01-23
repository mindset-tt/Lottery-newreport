// ignore_for_file: file_names, annotate_overrides
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lotterymanagement/AlertDialogs/CustomDialog.dart';
import 'package:lotterymanagement/Colors/Colors.dart';
import 'package:lotterymanagement/Controllers/MenuCTR.dart';
import 'package:lotterymanagement/Controllers/Setting/SettingUnitCTR.dart';
import 'package:lotterymanagement/Controllers/Setting/SettingbranchCTR.dart';
import 'package:lotterymanagement/Fonts/Fonts.dart';
import 'package:lotterymanagement/Models/UnitMD.dart';
import 'package:lotterymanagement/Responsive/Responsive.dart';
import 'package:lotterymanagement/UrlRespose/StatusCodeError.dart';
import 'package:lotterymanagement/UrlRespose/Substring.dart';
import 'package:lotterymanagement/Widget/AppbarheaderMobile.dart';
import 'package:lotterymanagement/Widget/Button.dart';
import 'package:lotterymanagement/Widget/HttpError.dart';
import 'package:lotterymanagement/Widget/LabelText.dart';
import 'package:lotterymanagement/Widget/PopupDialog.dart';
import 'package:lotterymanagement/Widget/ShowNullData.dart';
import 'package:lotterymanagement/Widget/Textfield.dart';
import 'package:lotterymanagement/Widget/Tooltip.dart';

class SettingUnit extends StatefulWidget {
  const SettingUnit({Key key}) : super(key: key);
  @override
  _SettingUnitState createState() => _SettingUnitState();
}

class _SettingUnitState extends State<SettingUnit> {
  MenuCTR menu = Get.put(MenuCTR());
  SettingUnitCTR unit = Get.put(SettingUnitCTR());
  SettingBranchCTR combobox = Get.put(SettingBranchCTR());
  @override
  void initState() {
    unit.branch = null;
    unit.clear();
    unit.gatallunit().then((value) => unit.onloading(value));
    unit.menu.disable(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Obx(
      () => unit.statusCode.value == "error"
          ? HttpError(
              title: StatusCodeText.httpError,
            )
          : unit.statusCode.value == "500"
              ? HttpError(
                  title: StatusCodeText.httpError,
                )
              : Scaffold(
                  backgroundColor: colorbackground,
                  appBar: Responsive.isMobile(context)
                      ? HeaderMobile(
                          onChanged: (p0) {
                            unit.txtsearch(unit.search.text);
                            unit.check = false;
                          },
                          onTap: () {
                            if (unit.search.text != "") {
                              for (int i = 0; i < unit.unitmd.length; i++) {
                                if (unit.unitmd[i].suId.toString() ==
                                        unit.txtsearch.value ||
                                    unit.unitmd[i].serviceUnitName ==
                                        unit.txtsearch.value) {
                                  unit.check = true;
                                }
                              }
                              if (unit.check == false) {
                                CustomDialogs.invalidDialogs(
                                    context, "ບໍ່ພົບຂໍ້ມູນນີ້");
                              }
                            }
                          },
                          controller: unit.search,
                          hintText: "ຄົ້ນຫາ ລະຫັດ ຫນ່ວຍ",
                        )
                      : AppBar(
                          backgroundColor: colorbackground,
                          title: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: InfoPopup(
                              hintText: "ຄົ້ນຫາ ລະຫັດ ຫນ່ວຍ",
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(50),
                              ],
                              title: "ຕັ້ງຄ່າ",
                              search: unit.search,
                              onChanged: (val) {
                                unit.txtsearch(unit.search.text);
                                unit.check = false;
                              },
                              onTap: () {
                                if (unit.search.text != "") {
                                  for (int i = 0; i < unit.unitmd.length; i++) {
                                    if (unit.unitmd[i].suId.toString() ==
                                            unit.txtsearch.value ||
                                        unit.unitmd[i].serviceUnitName ==
                                            unit.txtsearch.value) {
                                      unit.check = true;
                                    }
                                  }
                                  if (unit.check == false) {
                                    CustomDialogs.invalidDialogs(
                                        context, "ບໍ່ພົບຂໍ້ມູນນີ້");
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                  body: !Responsive.isMobile(context)
                      ? SafeArea(
                          child: SingleChildScrollView(
                            child: Container(
                              width: double.infinity,
                              height: width,
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
                                            "ຕັ້ງຄ່າຫນ່ວຍຂາຍ",
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
                                              LabelText(
                                                  count: "1",
                                                  name: "ຊື່ສາຂາ",
                                                  color: unit.empty.value == "1"
                                                      ? colorred
                                                      : colorblack),
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Container(
                                                  width: 250,
                                                  height: 42,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(),
                                                  ),
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                          child: DropdownButton(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    value: unit.branch,
                                                    hint: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20.0),
                                                      child: Text("ຊື່ສາຂາ",
                                                          style: TextStyle(
                                                              color: colorblack,
                                                              fontSize:
                                                                  fontmenu,
                                                              fontFamily:
                                                                  phetsarath)),
                                                    ),
                                                    items:
                                                        combobox.branchmd
                                                                    .length !=
                                                                null
                                                            ? combobox.branchmd
                                                                .map(
                                                                    (document) {
                                                                return DropdownMenuItem(
                                                                    value: document
                                                                        .branchId
                                                                        .toString(),
                                                                    child:
                                                                        SizedBox(
                                                                      height:
                                                                          30.0,
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(left: 20.0),
                                                                        child: Text(
                                                                            document
                                                                                .branchName,
                                                                            style: TextStyle(
                                                                                color: colorblack,
                                                                                fontSize: fontgeneral,
                                                                                fontFamily: phetsarath)),
                                                                      ),
                                                                    ));
                                                              }).toList()
                                                            : unit.branch,
                                                    onChanged: (value) {
                                                      combobox.getallbranch();
                                                      unit.branch = value;
                                                    },
                                                  )),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              LabelText(
                                                  count: "1",
                                                  name: "ຊື່ຫນ່ວຍ",
                                                  color: unit.empty.value == "3"
                                                      ? colorred
                                                      : colorblack),
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Textfield(
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(
                                                        30),
                                                  ],
                                                  fontFamily: phetsarath,
                                                  focusNode:
                                                      unit.empty.value == "3"
                                                          ? unit.f3
                                                          : unit.f3,
                                                  obscureText: false,
                                                  bordercolor:
                                                      unit.empty.value == "3"
                                                          ? colorred
                                                          : colordarkblue,
                                                  controller: unit.unitname,
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
                                              LabelText(
                                                  count: "1",
                                                  name: "ເບີໂທ",
                                                  color: unit.empty.value == "2"
                                                      ? colorred
                                                      : colorblack),
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Textfield(
                                                  fontFamily: phetsarath,
                                                  focusNode:
                                                      unit.empty.value == "2"
                                                          ? unit.f4
                                                          : unit.f4,
                                                  obscureText: false,
                                                  bordercolor:
                                                      unit.empty.value == "2"
                                                          ? colorred
                                                          : colordarkblue,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .allow(
                                                            RegExp(r'[0-9,.]')),
                                                    LengthLimitingTextInputFormatter(
                                                        35),
                                                  ],
                                                  controller: unit.phone,
                                                  fontWeight: FontWeight.normal,
                                                  textInputType:
                                                      TextInputType.number,
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
                                              const LabelText(
                                                  name: "ເປີເຊັນຂາຍ",
                                                  color: colorblack),
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Textfield(
                                                  fontFamily: phetsarath,
                                                  focusNode: unit.f2,
                                                  obscureText: false,
                                                  bordercolor: colordarkblue,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                    LengthLimitingTextInputFormatter(
                                                        3),
                                                  ],
                                                  controller: unit.percent,
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
                                              const LabelText(
                                                  name: "ທີ່ຢູ່",
                                                  color: colorblack),
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Textfield(
                                                  fontFamily: phetsarath,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(
                                                        80),
                                                  ],
                                                  focusNode: unit.f5,
                                                  obscureText: false,
                                                  bordercolor: colordarkblue,
                                                  controller: unit.address,
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
                                              const LabelText(
                                                  name: "ອີເມລ",
                                                  color: colorblack),
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Textfield(
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(
                                                        30),
                                                  ],
                                                  fontFamily: phetsarath,
                                                  focusNode: unit.f6,
                                                  obscureText: false,
                                                  bordercolor: colordarkblue,
                                                  controller: unit.email,
                                                  fontWeight: FontWeight.normal,
                                                  textInputType: TextInputType
                                                      .emailAddress,
                                                  size: 250,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    //c3
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Button(
                                      height: 42,
                                      title: unit.onTap.value == false
                                          ? "ບັນທຶກ"
                                          : "ລໍຖ້າ...",
                                      colorstype: colorwhite,
                                      fontFamily: phetsarath,
                                      fontSize: fontgeneral,
                                      onPressed: () {
                                        if (unit.branch == null) {
                                          unit.empty("1");
                                        }
                                        // else if (unit.percent.text == "") {
                                        //   unit.empty("2");
                                        //   FocusScope.of(context)
                                        //       .requestFocus(unit.f2);
                                        // }
                                        else if (unit.unitname.text == "") {
                                          unit.empty("3");
                                          FocusScope.of(context)
                                              .requestFocus(unit.f3);
                                        } else if (unit.phone.text == "") {
                                          unit.empty("2");
                                          FocusScope.of(context)
                                              .requestFocus(unit.f4);
                                        } else {
                                          unit.empty("");
                                          if (unit.percent.text != "") {
                                            unit.defaultpercent(
                                                unit.percent.text);
                                          }
                                          if (unit.onTap.value == false) {
                                            unit.onTap(true);
                                            if (unit.id != "") {
                                              //update
                                              unit
                                                  .updateunit(
                                                      unit.id,
                                                      unit.branch,
                                                      unit.unitname.text,
                                                      unit.address.text,
                                                      menu.userid.value,
                                                      unit.phone.text,
                                                      unit.defaultpercent.value,
                                                      unit.email.text)
                                                  .then((value) {
                                                if (value == "200") {
                                                  unit.gatallunit().then(
                                                      (value) => unit
                                                          .onloading(value));
                                                  Get.snackbar(
                                                      "Warning Messages !", "",
                                                      messageText: Text(
                                                          StatusCodeText
                                                              .statusCodeText200,
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
                                                  unit.clear();
                                                  FocusScope.of(context)
                                                      .requestFocus(unit.f3);
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
                                              }).whenComplete(
                                                      () => unit.onTap(false));
                                            } else {
                                              // insert
                                              unit
                                                  .postunit(
                                                      unit.branch,
                                                      unit.unitname.text,
                                                      unit.address.text,
                                                      menu.userid.value,
                                                      unit.phone.text,
                                                      unit.defaultpercent.value,
                                                      unit.email.text)
                                                  .then((value) {
                                                if (value == "201") {
                                                  unit.gatallunit().then(
                                                      (value) => unit
                                                          .onloading(value));
                                                  Get.snackbar(
                                                      "Warning Messages !", "",
                                                      messageText: Text(
                                                          StatusCodeText
                                                              .statusCodeText201,
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
                                                  unit.clear();
                                                  FocusScope.of(context)
                                                      .requestFocus(unit.f3);
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
                                              }).whenComplete(
                                                      () => unit.onTap(false));
                                            }
                                          }
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "ສະແດງຂໍ້ມູນຫນ່ວຍຂາຍ",
                                      style: TextStyle(
                                          fontFamily: phetsarath,
                                          color: colorblack,
                                          fontSize: fontmenu,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    unit.unitmd.isEmpty
                                        ? const ShowNullData(
                                            height: 150,
                                            width: 150,
                                          )
                                        : unit.onloading.value == "200"
                                            ? Expanded(
                                                child: SingleChildScrollView(
                                                  child: Container(
                                                    width: double.infinity,
                                                    color: colorwhite,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          width:
                                                              double.infinity,
                                                          child:
                                                              PaginatedDataTable(
                                                            columnSpacing:
                                                                defaultPadding,
                                                            showCheckboxColumn:
                                                                false,
                                                            showFirstLastButtons:
                                                                true,
                                                            columns: [
                                                              DataColumn(
                                                                  label: Text(
                                                                      "ລຳດັບ",
                                                                      style: TextStyle(
                                                                          color:
                                                                              colorblack,
                                                                          fontSize:
                                                                              fontmenu,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontFamily:
                                                                              phetsarath))),
                                                              DataColumn(
                                                                  label: Text(
                                                                      "ຊື່ສາຂາ",
                                                                      style: TextStyle(
                                                                          color:
                                                                              colorblack,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              fontmenu,
                                                                          fontFamily:
                                                                              phetsarath))),
                                                              DataColumn(
                                                                  label: Text(
                                                                      "ເປີເຊັນຂາຍ",
                                                                      style: TextStyle(
                                                                          color:
                                                                              colorblack,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              fontmenu,
                                                                          fontFamily:
                                                                              phetsarath))),
                                                              DataColumn(
                                                                  label: Text(
                                                                      "ຫນ່ວຍ",
                                                                      style: TextStyle(
                                                                          color:
                                                                              colorblack,
                                                                          fontSize:
                                                                              fontmenu,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontFamily:
                                                                              phetsarath))),
                                                              DataColumn(
                                                                  label: Text(
                                                                      "ເບີໂທ",
                                                                      style: TextStyle(
                                                                          color:
                                                                              colorblack,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              fontmenu,
                                                                          fontFamily:
                                                                              phetsarath))),
                                                              DataColumn(
                                                                  label: Text(
                                                                      "ທີ່ຢູ່",
                                                                      style: TextStyle(
                                                                          color:
                                                                              colorblack,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              fontmenu,
                                                                          fontFamily:
                                                                              phetsarath))),
                                                              DataColumn(
                                                                  label: Text(
                                                                      "ອີເມລ",
                                                                      style: TextStyle(
                                                                          color:
                                                                              colorblack,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              fontmenu,
                                                                          fontFamily:
                                                                              phetsarath))),
                                                              DataColumn(
                                                                  label: Text(
                                                                      "",
                                                                      style: TextStyle(
                                                                          color:
                                                                              colorblack,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              fontmenu,
                                                                          fontFamily:
                                                                              phetsarath))),
                                                            ],
                                                            source: MyDataTable(
                                                                reportData: unit
                                                                            .txtsearch
                                                                            .value ==
                                                                        ""
                                                                    ? unit
                                                                        .unitmd
                                                                    : unit
                                                                        .unitmd
                                                                        .where((e) =>
                                                                            e.suId.toString() == unit.txtsearch.value ||
                                                                            e.serviceUnitName ==
                                                                                unit.txtsearch.value)
                                                                        .toList(),
                                                                context: context),
                                                            rowsPerPage: 15,
                                                            // initialFirstRowIndex: 1,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : const ShowNullData(
                                                height: 150,
                                                width: 150,
                                              )
                                  ],
                                ),
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
                              height: 1577,
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
                                      "ຕັ້ງຄ່າຫນ່ວຍຂາຍ",
                                      style: TextStyle(
                                          fontFamily: phetsarath,
                                          color: colordarkblue,
                                          fontSize: fontmenu,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    // c1

                                    LabelText(
                                        count: "1",
                                        name: "ຊື່ສາຂາ",
                                        color: unit.empty.value == "1"
                                            ? colorred
                                            : colorblack),

                                    Container(
                                      width: double.infinity,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                        borderRadius: BorderRadius.circular(10),
                                        value: unit.branch,
                                        hint: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20.0),
                                          child: Text("ຊື່ສາຂາ",
                                              style: TextStyle(
                                                  color: colorblack,
                                                  fontSize: fontmenu,
                                                  fontFamily: phetsarath)),
                                        ),
                                        items: combobox.branchmd.length != null
                                            ? combobox.branchmd.map((document) {
                                                return DropdownMenuItem(
                                                    value: document.branchId
                                                        .toString(),
                                                    child: SizedBox(
                                                      height: 30.0,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 20.0),
                                                        child: Text(
                                                            document.branchName,
                                                            style: TextStyle(
                                                                color:
                                                                    colorblack,
                                                                fontSize:
                                                                    fontgeneral,
                                                                fontFamily:
                                                                    phetsarath)),
                                                      ),
                                                    ));
                                              }).toList()
                                            : unit.branch,
                                        onChanged: (value) {
                                          combobox.getallbranch();
                                          unit.branch = value;
                                        },
                                      )),
                                    ),

                                    LabelText(
                                        count: "1",
                                        name: "ຫນ່ວຍ",
                                        color: unit.empty.value == "3"
                                            ? colorred
                                            : colorblack),

                                    Textfield(
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(30),
                                      ],
                                      fontFamily: phetsarath,
                                      focusNode: unit.empty.value == "3"
                                          ? unit.f3
                                          : unit.f3,
                                      obscureText: false,
                                      bordercolor: unit.empty.value == "3"
                                          ? colorred
                                          : colordarkblue,
                                      controller: unit.unitname,
                                      fontWeight: FontWeight.normal,
                                      textInputType: TextInputType.text,
                                      size: double.infinity,
                                    ),

                                    LabelText(
                                        count: "1",
                                        name: "ເບີໂທ",
                                        color: unit.empty.value == "2"
                                            ? colorred
                                            : colorblack),

                                    Textfield(
                                      fontFamily: phetsarath,
                                      focusNode: unit.empty.value == "2"
                                          ? unit.f4
                                          : unit.f4,
                                      obscureText: false,
                                      bordercolor: unit.empty.value == "2"
                                          ? colorred
                                          : colordarkblue,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9,.]')),
                                        LengthLimitingTextInputFormatter(35),
                                      ],
                                      controller: unit.phone,
                                      fontWeight: FontWeight.normal,
                                      textInputType: TextInputType.number,
                                      size: double.infinity,
                                    ),
                                    // c2

                                    const LabelText(
                                        name: "ເປີເຊັນຂາຍ", color: colorblack),

                                    Textfield(
                                      fontFamily: phetsarath,
                                      focusNode: unit.f2,
                                      obscureText: false,
                                      bordercolor: colordarkblue,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(3),
                                      ],
                                      controller: unit.percent,
                                      fontWeight: FontWeight.normal,
                                      textInputType: TextInputType.number,
                                      size: double.infinity,
                                    ),

                                    const LabelText(
                                        name: "ທີ່ຢູ່", color: colorblack),

                                    Textfield(
                                      fontFamily: phetsarath,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(80),
                                      ],
                                      focusNode: unit.f5,
                                      obscureText: false,
                                      bordercolor: colordarkblue,
                                      controller: unit.address,
                                      fontWeight: FontWeight.normal,
                                      textInputType: TextInputType.text,
                                      size: double.infinity,
                                    ),

                                    const LabelText(
                                        name: "ອີເມລ", color: colorblack),

                                    Textfield(
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(30),
                                      ],
                                      fontFamily: phetsarath,
                                      focusNode: unit.f6,
                                      obscureText: false,
                                      bordercolor: colordarkblue,
                                      controller: unit.email,
                                      fontWeight: FontWeight.normal,
                                      textInputType: TextInputType.emailAddress,
                                      size: double.infinity,
                                    ),
                                    //c3

                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Button(
                                      height: 42,
                                      title: unit.onTap.value == false
                                          ? "ບັນທຶກ"
                                          : "ລໍຖ້າ...",
                                      colorstype: colorwhite,
                                      fontFamily: phetsarath,
                                      fontSize: fontgeneral,
                                      onPressed: () {
                                        if (unit.branch == null) {
                                          unit.empty("1");
                                        }
                                        // else if (unit.percent.text == "") {
                                        //   unit.empty("2");
                                        //   FocusScope.of(context)
                                        //       .requestFocus(unit.f2);
                                        // }
                                        else if (unit.unitname.text == "") {
                                          unit.empty("3");
                                          FocusScope.of(context)
                                              .requestFocus(unit.f3);
                                        } else if (unit.phone.text == "") {
                                          unit.empty("2");
                                          FocusScope.of(context)
                                              .requestFocus(unit.f4);
                                        } else {
                                          unit.empty("");
                                          if (unit.percent.text != "") {
                                            unit.defaultpercent(
                                                unit.percent.text);
                                          }
                                          if (unit.onTap.value == false) {
                                            unit.onTap(true);
                                            if (unit.id != "") {
                                              //update
                                              unit
                                                  .updateunit(
                                                      unit.id,
                                                      unit.branch,
                                                      unit.unitname.text,
                                                      unit.address.text,
                                                      menu.userid.value,
                                                      unit.phone.text,
                                                      unit.defaultpercent.value,
                                                      unit.email.text)
                                                  .then((value) {
                                                if (value == "200") {
                                                  unit.gatallunit().then(
                                                      (value) => unit
                                                          .onloading(value));
                                                  Get.snackbar(
                                                      "Warning Messages !", "",
                                                      messageText: Text(
                                                          StatusCodeText
                                                              .statusCodeText200,
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
                                                  unit.clear();
                                                  FocusScope.of(context)
                                                      .requestFocus(unit.f3);
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
                                              }).whenComplete(
                                                      () => unit.onTap(false));
                                            } else {
                                              // insert
                                              unit
                                                  .postunit(
                                                      unit.branch,
                                                      unit.unitname.text,
                                                      unit.address.text,
                                                      menu.userid.value,
                                                      unit.phone.text,
                                                      unit.defaultpercent.value,
                                                      unit.email.text)
                                                  .then((value) {
                                                if (value == "201") {
                                                  unit.gatallunit().then(
                                                      (value) => unit
                                                          .onloading(value));
                                                  Get.snackbar(
                                                      "Warning Messages !", "",
                                                      messageText: Text(
                                                          StatusCodeText
                                                              .statusCodeText201,
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
                                                  unit.clear();
                                                  FocusScope.of(context)
                                                      .requestFocus(unit.f3);
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
                                              }).whenComplete(
                                                      () => unit.onTap(false));
                                            }
                                          }
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "ສະແດງຂໍ້ມູນຫນ່ວຍຂາຍ",
                                      style: TextStyle(
                                          fontFamily: phetsarath,
                                          color: colorblack,
                                          fontSize: fontmenu,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    unit.unitmd.isEmpty
                                        ? const ShowNullData(
                                            height: 100,
                                            width: 100,
                                          )
                                        : unit.onloading.value == "200"
                                            ? Container(
                                                width: double.infinity,
                                                color: colorwhite,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: double.infinity,
                                                      child: PaginatedDataTable(
                                                        columnSpacing:
                                                            defaultPadding,
                                                        showCheckboxColumn:
                                                            false,
                                                        showFirstLastButtons:
                                                            true,
                                                        columns: [
                                                          DataColumn(
                                                              label: Text(
                                                                  "ລຳດັບ",
                                                                  style: TextStyle(
                                                                      color:
                                                                          colorblack,
                                                                      fontSize:
                                                                          fontmenu,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          phetsarath))),
                                                          DataColumn(
                                                              label: Text(
                                                                  "ຊື່ສາຂາ",
                                                                  style: TextStyle(
                                                                      color:
                                                                          colorblack,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          fontmenu,
                                                                      fontFamily:
                                                                          phetsarath))),
                                                          DataColumn(
                                                              label: Text(
                                                                  "ເປີເຊັນຂາຍ",
                                                                  style: TextStyle(
                                                                      color:
                                                                          colorblack,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          fontmenu,
                                                                      fontFamily:
                                                                          phetsarath))),
                                                          DataColumn(
                                                              label: Text(
                                                                  "ຫນ່ວຍ",
                                                                  style: TextStyle(
                                                                      color:
                                                                          colorblack,
                                                                      fontSize:
                                                                          fontmenu,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          phetsarath))),
                                                          DataColumn(
                                                              label: Text(
                                                                  "ເບີໂທ",
                                                                  style: TextStyle(
                                                                      color:
                                                                          colorblack,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          fontmenu,
                                                                      fontFamily:
                                                                          phetsarath))),
                                                          DataColumn(
                                                              label: Text("ທີ່ຢູ່",
                                                                  style: TextStyle(
                                                                      color:
                                                                          colorblack,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          fontmenu,
                                                                      fontFamily:
                                                                          phetsarath))),
                                                          DataColumn(
                                                              label: Text(
                                                                  "ອີເມລ",
                                                                  style: TextStyle(
                                                                      color:
                                                                          colorblack,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          fontmenu,
                                                                      fontFamily:
                                                                          phetsarath))),
                                                          DataColumn(
                                                              label: Text("",
                                                                  style: TextStyle(
                                                                      color:
                                                                          colorblack,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          fontmenu,
                                                                      fontFamily:
                                                                          phetsarath))),
                                                        ],
                                                        source: MyDataTable(
                                                            reportData: unit
                                                                        .txtsearch
                                                                        .value ==
                                                                    ""
                                                                ? unit.unitmd
                                                                : unit.unitmd
                                                                    .where((e) =>
                                                                        e.suId.toString() ==
                                                                            unit
                                                                                .txtsearch.value ||
                                                                        e.serviceUnitName ==
                                                                            unit.txtsearch.value)
                                                                    .toList(),
                                                            context: context),
                                                        rowsPerPage: 15,
                                                        // initialFirstRowIndex: 1,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            : const ShowNullData(
                                                height: 100,
                                                width: 100,
                                              )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
    );
  }
}

class MyDataTable extends DataTableSource {
  MyDataTable({@required List<UnitMd> reportData, BuildContext context})
      : _reportData = reportData,
        _context = context,
        assert(reportData != null);
  final List<UnitMd> _reportData;
  final BuildContext _context;
  bool get isRowCountApproximate => false;
  int get rowCount => _reportData.length;
  int get selectedRowCount => 0;
  SettingUnitCTR unit = Get.put(SettingUnitCTR());
  SettingBranchCTR combobox = Get.put(SettingBranchCTR());
  DataRow getRow(int index) {
    return DataRow(
        onSelectChanged: (value) {
          unit.id = _reportData[index].suId.toString();
          unit.branch = _reportData[index].branchId.toString();
          unit.percent.text = _reportData[index].suPercent.toString();
          unit.unitname.text = _reportData[index].serviceUnitName;
          unit.phone.text = _reportData[index].tel1.toString();
          unit.address.text = _reportData[index].villageName;
          unit.email.text = _reportData[index].suEmail;
          combobox.getallbranch();
        },
        cells: [
          DataCell(Text(_reportData[index].row ?? "ວ່າງເປົ່າ",
              style: TextStyle(
                  color: colorblack,
                  fontSize: fontgeneral,
                  fontFamily: phetsarath))),
          DataCell(Text(
              _reportData[index].branchName == ""
                  ? "ວ່າງເປົ່າ"
                  : _reportData[index].branchName,
              style: TextStyle(
                  color: colorblack,
                  fontSize: fontgeneral,
                  fontFamily: phetsarath))),
          DataCell(Text(
              _reportData[index].suPercent.toString() == ""
                  ? "0"
                  : _reportData[index].suPercent.toString(),
              style: TextStyle(
                  color: colorblack,
                  fontSize: fontgeneral,
                  fontFamily: phetsarath))),
          DataCell(Tooltips(
            message: _reportData[index].serviceUnitName,
            child: Text(
                _reportData[index].serviceUnitName == ""
                    ? "ວ່າງເປົ່າ"
                    : ShowSubString.cutStringPhone(
                        _reportData[index].serviceUnitName),
                style: TextStyle(
                    color: colorblack,
                    fontSize: fontgeneral,
                    fontFamily: phetsarath)),
          )),
          DataCell(Tooltips(
            message: _reportData[index].tel1.toString(),
            child: Text(
                _reportData[index].tel1.toString() == ""
                    ? "ວ່າງເປົ່າ"
                    : ShowSubString.cutStringPhone(
                        _reportData[index].tel1.toString()),
                style: TextStyle(
                    color: colorblack,
                    fontSize: fontgeneral,
                    fontFamily: phetsarath)),
          )),
          DataCell(Tooltips(
            message: _reportData[index].villageName,
            child: Text(
                _reportData[index].villageName == ""
                    ? "ວ່າງເປົ່າ"
                    : ShowSubString.cutStringAddress(
                        _reportData[index].villageName),
                style: TextStyle(
                    color: colorblack,
                    fontSize: fontgeneral,
                    fontFamily: phetsarath)),
          )),
          DataCell(Text(
              _reportData[index].suEmail == ""
                  ? "ວ່າງເປົ່າ"
                  : _reportData[index].suEmail,
              style: TextStyle(
                  color: colorblack,
                  fontSize: fontgeneral,
                  fontFamily: phetsarath))),
          DataCell(
            Row(
              children: [
                InkWell(
                    onTap: () async {
                      unit.id = _reportData[index].suId.toString();
                      unit.branch = _reportData[index].branchId.toString();
                      unit.percent.text =
                          _reportData[index].suPercent.toString();
                      unit.unitname.text = _reportData[index].serviceUnitName;
                      unit.phone.text = _reportData[index].tel1.toString();
                      unit.address.text = _reportData[index].villageName;
                      unit.email.text = _reportData[index].suEmail;
                      combobox.getallbranch();
                    },
                    child: const Icon(
                      Icons.edit,
                      color: colordarkblue,
                    )),
                const SizedBox(
                  width: 15,
                ),
                InkWell(
                    onTap: () async {
                      return showDialog(
                          barrierDismissible: false,
                          context: _context,
                          builder: (context) {
                            return Obx(
                              () => AlertDialog(
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                content: SizedBox(
                                  width: 250,
                                  height: 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 350,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.delete,
                                              size: 100,
                                              color: colorred,
                                            ),
                                            Text("ທ່ານຕ້ອງການລົບແທ້ບໍ່ ?",
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                              text:
                                                  unit.onDeleted.value == false
                                                      ? "ລົບ"
                                                      : "ລໍຖ້າ...",
                                              onPressed: () {
                                                if (unit.onDeleted.value ==
                                                    false) {
                                                  unit.onDeleted(true);
                                                  unit
                                                      .deleteunit(
                                                          _reportData[index]
                                                              .suId
                                                              .toString())
                                                      .then((value) {
                                                    if (value == "200") {
                                                      unit.gatallunit().then(
                                                          (value) =>
                                                              unit.onloading(
                                                                  value));
                                                      unit.clear();
                                                      FocusScope.of(_context)
                                                          .requestFocus(
                                                              unit.f3);
                                                      unit.onDeleted(false);
                                                      Navigator.of(_context)
                                                          .pop();
                                                      Get.snackbar(
                                                          "Warning Messages !", "",
                                                          messageText: Text(
                                                              StatusCodeText
                                                                  .statusCodeText200Delete,
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
                                                    } else if (value == "401") {
                                                      unit.onDeleted(false);
                                                      Navigator.of(_context)
                                                          .pop();
                                                      CustomDialogs.errorDialogs(
                                                          _context,
                                                          StatusCodeText
                                                              .statusCodeText401);
                                                    } else if (value == "403") {
                                                      unit.onDeleted(false);
                                                      Navigator.of(_context)
                                                          .pop();
                                                      CustomDialogs.errorDialogs(
                                                          _context,
                                                          StatusCodeText
                                                              .statusCodeText403);
                                                    } else if (value == "404") {
                                                      unit.onDeleted(false);
                                                      Navigator.of(_context)
                                                          .pop();
                                                      CustomDialogs.errorDialogs(
                                                          _context,
                                                          StatusCodeText
                                                              .statusCodeText404);
                                                    } else {
                                                      unit.onDeleted(false);
                                                      Navigator.of(_context)
                                                          .pop();
                                                      CustomDialogs.errorDialogs(
                                                          _context,
                                                          StatusCodeText
                                                              .statusCodeText500);
                                                    }
                                                  });
                                                }
                                              },
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: const Icon(
                      Icons.delete,
                      color: colorblack,
                    )),
              ],
            ),
          ),
        ]);
  }
}
