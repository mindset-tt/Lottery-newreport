// ignore_for_file: annotate_overrides, file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:lotterymanagement/AlertDialogs/CustomDialog.dart';
import 'package:lotterymanagement/Colors/Colors.dart';
import 'package:lotterymanagement/Controllers/MenuCTR.dart';
import 'package:lotterymanagement/Controllers/Setting/SettingSalerCTR.dart';
import 'package:lotterymanagement/Controllers/Setting/SettingbranchCTR.dart';
import 'package:lotterymanagement/Fonts/Fonts.dart';
import 'package:lotterymanagement/Models/SellerMD.dart';
import 'package:lotterymanagement/Responsive/Responsive.dart';
import 'package:lotterymanagement/UrlRespose/StatusCodeError.dart';
import 'package:lotterymanagement/UrlRespose/Substring.dart';
import 'package:lotterymanagement/Widget/AppbarheaderMobile.dart';
import 'package:lotterymanagement/Widget/Button.dart';
import 'package:lotterymanagement/Widget/HttpError.dart';
import 'package:lotterymanagement/Widget/LabelText.dart';
import 'package:lotterymanagement/Widget/Numberformat.dart';
import 'package:lotterymanagement/Widget/PopupDialog.dart';
import 'package:lotterymanagement/Widget/ShowNullData.dart';
import 'package:lotterymanagement/Widget/Textfield.dart';
import 'package:lotterymanagement/Widget/Tooltip.dart';
import 'package:pattern_formatter/pattern_formatter.dart';

class SettingSaler extends StatefulWidget {
  const SettingSaler({Key key}) : super(key: key);
  @override
  _SettingSalerState createState() => _SettingSalerState();
}

MenuCTR menu = Get.put(MenuCTR());
SettingSalerCTR saler = Get.put(SettingSalerCTR());
SettingBranchCTR combobox = Get.put(SettingBranchCTR());

class _SettingSalerState extends State<SettingSaler> {
  @override
  void initState() {
    saler.clear();
    saler.branch = null;
    saler.selected("");
    saler.gatallseller().then((value) => saler.onloading(value));
    saler.menu.disable(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Obx(
      () => saler.statusCode.value == "error"
          ? HttpError(
              title: StatusCodeText.httpError,
            )
          : saler.statusCode.value == "500"
              ? HttpError(
                  title: StatusCodeText.httpError,
                )
              : Scaffold(
                  backgroundColor: colorbackground,
                  appBar: Responsive.isMobile(context)
                      ? HeaderMobile(
                          onChanged: (p0) {
                            saler.txtsearch(saler.search.text);
                            saler.check = false;
                          },
                          controller: saler.search,
                          onTap: () {
                            if (saler.search.text != "") {
                              for (int i = 0; i < saler.sellermd.length; i++) {
                                if (saler.sellermd[i].deviceCode.toString() ==
                                        saler.search.text ||
                                    saler.sellermd[i].unitName.toString() ==
                                        saler.search.text) {
                                  saler.check = true;
                                }
                              }
                              if (saler.check == false) {
                                CustomDialogs.invalidDialogs(
                                    context, "ບໍ່ພົບຂໍ້ມູນນີ້");
                              }
                            }
                          },
                          hintText: "ຄົ້ນຫາ ສາຂາ ຫນ່ວຍ",
                        )
                      : AppBar(
                          backgroundColor: colorbackground,
                          title: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: InfoPopup(
                              hintText: "ຄົ້ນຫາ ສາຂາ ຫນ່ວຍ",
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(50),
                              ],
                              title: "ຕັ້ງຄ່າ",
                              search: saler.search,
                              onChanged: (p0) {
                                saler.txtsearch(saler.search.text);
                                saler.check = false;
                              },
                              onTap: () {
                                if (saler.search.text != "") {
                                  for (int i = 0;
                                      i < saler.sellermd.length;
                                      i++) {
                                    if (saler.sellermd[i].deviceCode
                                                .toString() ==
                                            saler.search.text ||
                                        saler.sellermd[i].unitName.toString() ==
                                            saler.search.text) {
                                      saler.check = true;
                                    }
                                  }
                                  if (saler.check == false) {
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
                                        children: [
                                          Text(
                                            "ຕັ້ງຄ່າຄົນຂາຍ",
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
                                                  name: "ສາຂາ",
                                                  color:
                                                      saler.empty.value == "1"
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
                                                      border: Border.all()),
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                          child: DropdownButton(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    value: saler.branch,
                                                    hint: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20.0),
                                                      child: Text("ສາຂາ",
                                                          style: TextStyle(
                                                              color: colorblack,
                                                              fontSize:
                                                                  fontmenu,
                                                              fontFamily:
                                                                  phetsarath)),
                                                    ),
                                                    items:
                                                        combobox.branchmd
                                                                .isNotEmpty
                                                            ? combobox.branchmd
                                                                .map(
                                                                    (document) {
                                                                return DropdownMenuItem(
                                                                    onTap: () {
                                                                      saler.txtsearch(
                                                                          document
                                                                              .branchName);
                                                                      saler.onSaveloading(
                                                                          document
                                                                              .branchName);
                                                                    },
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
                                                                                fontSize: fontmenu,
                                                                                fontFamily: phetsarath)),
                                                                      ),
                                                                    ));
                                                              }).toList()
                                                            : saler.branch,
                                                    onChanged: (value1) {
                                                      combobox.getallbranch();

                                                      saler.branch = value1;
                                                      saler.bybranch = null;
                                                      saler
                                                          .getbybranch(value1)
                                                          .then((value) {
                                                        if (value != "200") {
                                                          saler.selected(value);
                                                        } else {
                                                          saler.selected(value);
                                                        }
                                                      });
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
                                                  name: "ຫນ່ວຍ",
                                                  color:
                                                      saler.empty.value == "2"
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
                                                      border: Border.all()),
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                          child: DropdownButton(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    value: saler.bybranch,
                                                    hint: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20.0),
                                                      child: Text("ຫນ່ວຍ",
                                                          style: TextStyle(
                                                              color: colorblack,
                                                              fontSize:
                                                                  fontmenu,
                                                              fontFamily:
                                                                  phetsarath)),
                                                    ),
                                                    items:
                                                        saler.selected.value ==
                                                                "200"
                                                            ? saler.unitmd.map(
                                                                (document) {
                                                                return DropdownMenuItem(
                                                                    value: document
                                                                        .suId
                                                                        .toString(),
                                                                    child:
                                                                        SizedBox(
                                                                      height:
                                                                          30.0,
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(left: 20.0),
                                                                        child:
                                                                            Tooltips(
                                                                          message:
                                                                              document.serviceUnitName,
                                                                          child: Text(
                                                                              ShowSubString.cutStringTextBox(document.serviceUnitName),
                                                                              style: TextStyle(color: colorblack, fontSize: fontmenu, fontFamily: phetsarath)),
                                                                        ),
                                                                      ),
                                                                    ));
                                                              }).toList()
                                                            : null,
                                                    onChanged: (value) {
                                                      saler.getbybranch(
                                                          saler.branch);
                                                      saler.bybranch = value;
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
                                                  name: "ລະຫັດເຄື່ອງຂາຍ",
                                                  color:
                                                      saler.empty.value == "3"
                                                          ? colorred
                                                          : colorblack),
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Textfield(
                                                  enabled: saler.id != ""
                                                      ? false
                                                      : true,
                                                  fontFamily: phetsarath,
                                                  obscureText: false,
                                                  bordercolor:
                                                      saler.empty.value == "3"
                                                          ? colorred
                                                          : colordarkblue,
                                                  focusNode:
                                                      saler.empty.value == "3"
                                                          ? saler.f3
                                                          : saler.f3,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .allow(
                                                            RegExp(r'[0-9,.]')),
                                                    LengthLimitingTextInputFormatter(
                                                        15),
                                                  ],
                                                  controller: saler.salename,
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
                                              LabelText(
                                                  count: "1",
                                                  name: "ຈຳນວນຂາຍໄດ້",
                                                  color:
                                                      saler.empty.value == "9"
                                                          ? colorred
                                                          : colorblack),
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Textfield(
                                                  obscureText: false,
                                                  fontFamily: phetsarath,
                                                  bordercolor:
                                                      saler.empty.value == "9"
                                                          ? colorred
                                                          : colordarkblue,
                                                  focusNode:
                                                      saler.empty.value == "9"
                                                          ? saler.f8
                                                          : saler.f8,
                                                  controller: saler.maxsale,
                                                  fontWeight: FontWeight.normal,
                                                  textInputType:
                                                      TextInputType.number,
                                                  inputFormatters: [
                                                    ThousandsFormatter(
                                                        allowFraction: true),
                                                    LengthLimitingTextInputFormatter(
                                                        15),
                                                  ],
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
                                                  name: "ລະຫັດຜ່ານ",
                                                  color:
                                                      saler.empty.value == "7"
                                                          ? colorred
                                                          : colorblack),
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Textfieldsaler(
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(
                                                        30),
                                                  ],
                                                  fontFamily: phetsarath,
                                                  obscureText:
                                                      saler.eyepass.value ==
                                                              false
                                                          ? true
                                                          : false,
                                                  bordercolor:
                                                      saler.empty.value == "7"
                                                          ? colorred
                                                          : colordarkblue,
                                                  focusNode:
                                                      saler.empty.value == "7"
                                                          ? saler.f6
                                                          : saler.f6,
                                                  controller: saler.passord,
                                                  icon: Icon(
                                                      saler.eyepass.value ==
                                                              false
                                                          ? Icons.visibility_off
                                                          : Icons.visibility),
                                                  inkWellonTap: () {
                                                    if (saler.eyepass.value ==
                                                        false) {
                                                      saler.eyepass(true);
                                                    } else {
                                                      saler.eyepass(false);
                                                    }
                                                  },
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
                                              LabelText(
                                                  count: "1",
                                                  name: "ລະຫັດຢືນຢັນ",
                                                  color:
                                                      saler.empty.value == "8"
                                                          ? colorred
                                                          : colorblack),
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Textfieldsaler(
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(
                                                        30),
                                                  ],
                                                  fontFamily: phetsarath,
                                                  obscureText:
                                                      saler.eyecon.value ==
                                                              false
                                                          ? true
                                                          : false,
                                                  bordercolor:
                                                      saler.empty.value == "8"
                                                          ? colorred
                                                          : colordarkblue,
                                                  focusNode:
                                                      saler.empty.value == "8"
                                                          ? saler.f7
                                                          : saler.f7,
                                                  controller:
                                                      saler.confirmpassord,
                                                  icon: Icon(
                                                      saler.eyecon.value ==
                                                              false
                                                          ? Icons.visibility_off
                                                          : Icons.visibility),
                                                  inkWellonTap: () {
                                                    if (saler.eyecon.value ==
                                                        false) {
                                                      saler.eyecon(true);
                                                    } else {
                                                      saler.eyecon(false);
                                                    }
                                                  },
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
                                    //c3
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
                                                  name: "ເບີໂທ",
                                                  color: colorblack),
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Textfield(
                                                  fontFamily: phetsarath,
                                                  obscureText: false,
                                                  bordercolor: colorblack,
                                                  //  focusNode: saler.f4,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .allow(
                                                            RegExp(r'[0-9,.]')),
                                                    LengthLimitingTextInputFormatter(
                                                        30),
                                                  ],
                                                  controller: saler.phone,
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
                                                "ທີ່ຢູ່",
                                                style: TextStyle(
                                                    fontFamily: phetsarath,
                                                    color: colorblack,
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
                                                    LengthLimitingTextInputFormatter(
                                                        150),
                                                  ],
                                                  fontFamily: phetsarath,
                                                  obscureText: false,
                                                  bordercolor: colordarkblue,
                                                  focusNode: saler.f5,
                                                  controller: saler.address,
                                                  fontWeight: FontWeight.normal,
                                                  textInputType:
                                                      TextInputType.text,
                                                  size: 250,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: 250,
                                          )
                                        ],
                                      ),
                                    ),
                                    //c4
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Button(
                                          height: 42,
                                          title: saler.onTap.value == false
                                              ? "ບັນທຶກ"
                                              : "ລໍຖ້າ...",
                                          colorstype: colorwhite,
                                          fontFamily: phetsarath,
                                          fontSize: fontgeneral,
                                          onPressed: () {
                                            // update
                                            if (saler.id != "") {
                                              if (saler.branch == null) {
                                                saler.empty("1");
                                              } else if (saler.bybranch ==
                                                  null) {
                                                saler.empty("2");
                                              } else if (saler.salename.text ==
                                                  "") {
                                                saler.empty("3");
                                                FocusScope.of(context)
                                                    .requestFocus(saler.f3);
                                              } else if (saler.maxsale.text ==
                                                  "") {
                                                saler.empty("9");
                                                FocusScope.of(context)
                                                    .requestFocus(saler.f8);
                                              } else {
                                                if (saler.passord.text !=
                                                    saler.confirmpassord.text) {
                                                  CustomDialogs.errorDialogs(
                                                      context,
                                                      " ລະຫັດຜ່ານບໍ່ກົງກັນ");
                                                } else {
                                                  if (saler.passord.text !=
                                                          "" &&
                                                      saler.confirmpassord
                                                              .text !=
                                                          "") {
                                                    saler.passwordupdate(
                                                        saler.passord.text);
                                                  }
                                                  saler.empty("");
                                                  if (saler.onTap.value ==
                                                      false) {
                                                    saler.onTap(true);
                                                    saler
                                                        .updateseller(
                                                            saler.id,
                                                            saler.salename.text,
                                                            saler.passwordupdate
                                                                .value,
                                                            saler.branch,
                                                            saler.bybranch,
                                                            "",
                                                            saler.phone.text,
                                                            saler.address.text,
                                                            saler.maxsale.text
                                                                .replaceAll(
                                                                    ",", ""))
                                                        .then((value) {
                                                      if (value == "200") {
                                                        saler
                                                            .gatallseller()
                                                            .then((value) =>
                                                                saler.onloading(
                                                                    value));
                                                        Get.snackbar(
                                                            "Warning Messages !",
                                                            "",
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
                                                                SnackPosition
                                                                    .TOP,
                                                            icon: const Icon(
                                                              Icons.message,
                                                              color: colorgreen,
                                                            ));
                                                        // saler.gatonlydevice(
                                                        //     saler.selected.value);
                                                        saler.clear();
                                                        FocusScope.of(context)
                                                            .requestFocus(
                                                                saler.f3);
                                                        saler.txtsearch(saler
                                                            .onSaveloading
                                                            .value);
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
                                                    }).whenComplete(() =>
                                                            saler.onTap(false));
                                                  }
                                                }
                                              }
                                            } else {
                                              if (saler.branch == null) {
                                                saler.empty("1");
                                              } else if (saler.bybranch ==
                                                  null) {
                                                saler.empty("2");
                                              } else if (saler.salename.text ==
                                                  "") {
                                                saler.empty("3");
                                                FocusScope.of(context)
                                                    .requestFocus(saler.f3);
                                              } else if (saler.maxsale.text ==
                                                  "") {
                                                FocusScope.of(context)
                                                    .requestFocus(saler.f8);
                                                saler.empty("9");
                                              } else if (saler.passord.text ==
                                                  "") {
                                                FocusScope.of(context)
                                                    .requestFocus(saler.f6);
                                                saler.empty("7");
                                              } else if (saler
                                                      .confirmpassord.text ==
                                                  "") {
                                                FocusScope.of(context)
                                                    .requestFocus(saler.f7);
                                                saler.empty("8");
                                              } else {
                                                if (saler.passord.text !=
                                                    saler.confirmpassord.text) {
                                                  CustomDialogs.errorDialogs(
                                                      context,
                                                      " ລະຫັດຜ່ານບໍ່ກົງກັນ");
                                                } else {
                                                  saler.empty("");
                                                  if (saler.onTap.value ==
                                                      false) {
                                                    saler.onTap(true);
                                                    // insert
                                                    saler
                                                        .postseller(
                                                            saler.salename.text,
                                                            saler.passord.text,
                                                            menu.userid.value,
                                                            saler.branch,
                                                            saler.bybranch,
                                                            "",
                                                            saler.phone.text,
                                                            saler.address.text,
                                                            saler.maxsale.text
                                                                .replaceAll(
                                                                    ",", ""))
                                                        .then((value) {
                                                      if (value == "201") {
                                                        saler
                                                            .gatallseller()
                                                            .then((value) =>
                                                                saler.onloading(
                                                                    value));
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
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal)),
                                                            maxWidth: 500,
                                                            backgroundColor:
                                                                colorwhite,
                                                            snackPosition:
                                                                SnackPosition
                                                                    .TOP,
                                                            icon: const Icon(
                                                              Icons.message,
                                                              color: colorgreen,
                                                            ));

                                                        saler.clear();
                                                        FocusScope.of(context)
                                                            .requestFocus(
                                                                saler.f3);
                                                        saler.txtsearch(saler
                                                            .onSaveloading
                                                            .value);
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
                                                    }).whenComplete(() =>
                                                            saler.onTap(false));
                                                  }
                                                }
                                              }
                                            }
                                          },
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: colordarkblue,
                                          ),
                                          height: 42,
                                          width: 50,
                                          child: IconButton(
                                              color: colorwhite,
                                              onPressed: () {
                                                saler.clear();
                                              },
                                              icon: const Icon(Icons.refresh)),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "ສະແດງຂໍ້ມູນຄົນຂາຍ ",
                                      style: TextStyle(
                                          fontFamily: phetsarath,
                                          color: colorblack,
                                          fontSize: fontmenu,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    saler.sellermd.isEmpty
                                        ? const ShowNullData(
                                            width: 150,
                                            height: 150,
                                          )
                                        : saler.onloading.value == "200"
                                            ? Expanded(
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        color: colorwhite,
                                                        width: double.infinity,
                                                        child:
                                                            PaginatedDataTable(
                                                          showCheckboxColumn:
                                                              false,
                                                          showFirstLastButtons:
                                                              true,
                                                          columnSpacing:
                                                              defaultPadding,
                                                          columns: [
                                                            DataColumn(
                                                                label: Text(
                                                                    "ລຳດັບ",
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
                                                                    "ລະຫັດເຄື່ອງຂາຍ",
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
                                                                    "ສາຂາ",
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
                                                                        fontWeight: FontWeight
                                                                            .bold,
                                                                        fontSize:
                                                                            fontmenu,
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
                                                                    "ຂາຍສູງສຸດ",
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
                                                                    "ທີ່ຢູ່",
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
                                                                    "ຖືກ Blocked",
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
                                                                        fontSize:
                                                                            fontgeneral,
                                                                        fontFamily:
                                                                            phetsarath))),
                                                          ],
                                                          source: MyDataTable(
                                                              reportData: saler
                                                                          .txtsearch
                                                                          .value ==
                                                                      ""
                                                                  ? saler
                                                                      .sellermd
                                                                  : saler
                                                                      .sellermd
                                                                      .where((e) =>
                                                                          e.deviceCode.toString() == saler.txtsearch.value ||
                                                                          e.unitName.toString() ==
                                                                              saler
                                                                                  .txtsearch.value ||
                                                                          e.branchName.toString() ==
                                                                              saler.txtsearch.value)
                                                                      .toList(),
                                                              context: context),
                                                          rowsPerPage: 15,
                                                          // initialFirstRowIndex: 1,
                                                        ),
                                                      )
                                                    ],
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
                              height: 1771,
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
                                      "ຕັ້ງຄ່າຄົນຂາຍ",
                                      style: TextStyle(
                                          fontFamily: phetsarath,
                                          color: colordarkblue,
                                          fontSize: fontmenu,
                                          fontWeight: FontWeight.bold),
                                    ),

                                    // c1
                                    LabelText(
                                        count: "1",
                                        name: "ສາຂາ",
                                        color: saler.empty.value == "1"
                                            ? colorred
                                            : colorblack),

                                    Container(
                                      width: double.infinity,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all()),
                                      child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                        borderRadius: BorderRadius.circular(10),
                                        value: saler.branch,
                                        hint: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20.0),
                                          child: Text("ສາຂາ",
                                              style: TextStyle(
                                                  color: colorblack,
                                                  fontSize: fontmenu,
                                                  fontFamily: phetsarath)),
                                        ),
                                        items: combobox.branchmd.isNotEmpty
                                            ? combobox.branchmd.map((document) {
                                                return DropdownMenuItem(
                                                    onTap: () {
                                                      saler.txtsearch(
                                                          document.branchName);
                                                      saler.onSaveloading(
                                                          document.branchName);
                                                    },
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
                                                                    fontmenu,
                                                                fontFamily:
                                                                    phetsarath)),
                                                      ),
                                                    ));
                                              }).toList()
                                            : saler.branch,
                                        onChanged: (value1) {
                                          combobox.getallbranch();
                                          saler.branch = value1;
                                          saler.bybranch = null;
                                          saler
                                              .getbybranch(value1)
                                              .then((value) {
                                            if (value != "200") {
                                              saler.selected(value);
                                            } else {
                                              saler.selected(value);
                                            }
                                          });
                                        },
                                      )),
                                    ),

                                    LabelText(
                                        count: "1",
                                        name: "ຫນ່ວຍ",
                                        color: saler.empty.value == "2"
                                            ? colorred
                                            : colorblack),

                                    Container(
                                      width: double.infinity,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all()),
                                      child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                        borderRadius: BorderRadius.circular(10),
                                        value: saler.bybranch,
                                        hint: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20.0),
                                          child: Text("ຫນ່ວຍ",
                                              style: TextStyle(
                                                  color: colorblack,
                                                  fontSize: fontmenu,
                                                  fontFamily: phetsarath)),
                                        ),
                                        items: saler.selected.value == "200"
                                            ? saler.unitmd.map((document) {
                                                return DropdownMenuItem(
                                                    value: document.suId
                                                        .toString(),
                                                    child: SizedBox(
                                                      height: 30.0,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 20.0),
                                                        child: Tooltips(
                                                          message: document
                                                              .serviceUnitName,
                                                          child: Text(
                                                              ShowSubString
                                                                  .cutStringTextBox(
                                                                      document
                                                                          .serviceUnitName),
                                                              style: TextStyle(
                                                                  color:
                                                                      colorblack,
                                                                  fontSize:
                                                                      fontmenu,
                                                                  fontFamily:
                                                                      phetsarath)),
                                                        ),
                                                      ),
                                                    ));
                                              }).toList()
                                            : null,
                                        onChanged: (value) {
                                          saler.getbybranch(saler.branch);
                                          saler.bybranch = value;
                                        },
                                      )),
                                    ),

                                    LabelText(
                                        count: "1",
                                        name: "ລະຫັດເຄື່ອງຂາຍ",
                                        color: saler.empty.value == "3"
                                            ? colorred
                                            : colorblack),

                                    Textfield(
                                      fontFamily: phetsarath,
                                      obscureText: false,
                                      enabled: saler.id != "" ? false : true,
                                      bordercolor: saler.empty.value == "3"
                                          ? colorred
                                          : colordarkblue,
                                      focusNode: saler.empty.value == "3"
                                          ? saler.f3
                                          : saler.f3,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9,.]')),
                                        LengthLimitingTextInputFormatter(15),
                                      ],
                                      controller: saler.salename,
                                      fontWeight: FontWeight.normal,
                                      textInputType: TextInputType.number,
                                      size: double.infinity,
                                    ),
                                    // c2

                                    LabelText(
                                        count: "1",
                                        name: "ຈຳນວນຂາຍໄດ້",
                                        color: saler.empty.value == "9"
                                            ? colorred
                                            : colorblack),

                                    Textfield(
                                      obscureText: false,
                                      fontFamily: phetsarath,
                                      bordercolor: saler.empty.value == "9"
                                          ? colorred
                                          : colordarkblue,
                                      focusNode: saler.empty.value == "9"
                                          ? saler.f8
                                          : saler.f8,
                                      controller: saler.maxsale,
                                      fontWeight: FontWeight.normal,
                                      textInputType: TextInputType.number,
                                      inputFormatters: [
                                        ThousandsFormatter(allowFraction: true),
                                        LengthLimitingTextInputFormatter(15),
                                      ],
                                      size: double.infinity,
                                    ),

                                    LabelText(
                                        count: "1",
                                        name: "ລະຫັດຜ່ານ",
                                        color: saler.empty.value == "7"
                                            ? colorred
                                            : colorblack),

                                    Textfieldsaler(
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(30),
                                      ],
                                      fontFamily: phetsarath,
                                      obscureText: saler.eyepass.value == false
                                          ? true
                                          : false,
                                      bordercolor: saler.empty.value == "7"
                                          ? colorred
                                          : colordarkblue,
                                      focusNode: saler.empty.value == "7"
                                          ? saler.f6
                                          : saler.f6,
                                      controller: saler.passord,
                                      icon: Icon(saler.eyepass.value == false
                                          ? Icons.visibility_off
                                          : Icons.visibility),
                                      inkWellonTap: () {
                                        if (saler.eyepass.value == false) {
                                          saler.eyepass(true);
                                        } else {
                                          saler.eyepass(false);
                                        }
                                      },
                                      fontWeight: FontWeight.normal,
                                      textInputType: TextInputType.number,
                                      size: double.infinity,
                                    ),

                                    LabelText(
                                        count: "1",
                                        name: "ລະຫັດຢືນຢັນ",
                                        color: saler.empty.value == "8"
                                            ? colorred
                                            : colorblack),

                                    Textfieldsaler(
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(30),
                                      ],
                                      fontFamily: phetsarath,
                                      obscureText: saler.eyecon.value == false
                                          ? true
                                          : false,
                                      bordercolor: saler.empty.value == "8"
                                          ? colorred
                                          : colordarkblue,
                                      focusNode: saler.empty.value == "8"
                                          ? saler.f7
                                          : saler.f7,
                                      controller: saler.confirmpassord,
                                      icon: Icon(saler.eyecon.value == false
                                          ? Icons.visibility_off
                                          : Icons.visibility),
                                      inkWellonTap: () {
                                        if (saler.eyecon.value == false) {
                                          saler.eyecon(true);
                                        } else {
                                          saler.eyecon(false);
                                        }
                                      },
                                      fontWeight: FontWeight.normal,
                                      textInputType: TextInputType.number,
                                      size: double.infinity,
                                    ),
                                    //c3

                                    const LabelText(
                                        name: "ເບີໂທ", color: colorblack),

                                    Textfield(
                                      fontFamily: phetsarath,
                                      obscureText: false,
                                      bordercolor: colorblack,
                                      //  focusNode: saler.f4,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9,.]')),
                                        LengthLimitingTextInputFormatter(30),
                                      ],
                                      controller: saler.phone,
                                      fontWeight: FontWeight.normal,
                                      textInputType: TextInputType.number,
                                      size: double.infinity,
                                    ),

                                    Text(
                                      "ທີ່ຢູ່",
                                      style: TextStyle(
                                          fontFamily: phetsarath,
                                          color: colorblack,
                                          fontSize: fontgeneral,
                                          fontWeight: FontWeight.normal),
                                    ),

                                    Textfield(
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(150),
                                      ],
                                      fontFamily: phetsarath,
                                      obscureText: false,
                                      bordercolor: colordarkblue,
                                      focusNode: saler.f5,
                                      controller: saler.address,
                                      fontWeight: FontWeight.normal,
                                      textInputType: TextInputType.text,
                                      size: double.infinity,
                                    ),

                                    //c4
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Button(
                                          height: 42,
                                          title: saler.onTap.value == false
                                              ? "ບັນທຶກ"
                                              : "ລໍຖ້າ...",
                                          colorstype: colorwhite,
                                          fontFamily: phetsarath,
                                          fontSize: fontgeneral,
                                          onPressed: () {
                                            // update
                                            if (saler.id != "") {
                                              if (saler.branch == null) {
                                                saler.empty("1");
                                              } else if (saler.bybranch ==
                                                  null) {
                                                saler.empty("2");
                                              } else if (saler.salename.text ==
                                                  "") {
                                                saler.empty("3");
                                                FocusScope.of(context)
                                                    .requestFocus(saler.f3);
                                              } else if (saler.maxsale.text ==
                                                  "") {
                                                saler.empty("9");
                                                FocusScope.of(context)
                                                    .requestFocus(saler.f8);
                                              } else {
                                                if (saler.passord.text !=
                                                    saler.confirmpassord.text) {
                                                  CustomDialogs.errorDialogs(
                                                      context,
                                                      " ລະຫັດຜ່ານບໍ່ກົງກັນ");
                                                } else {
                                                  if (saler.passord.text !=
                                                          "" &&
                                                      saler.confirmpassord
                                                              .text !=
                                                          "") {
                                                    saler.passwordupdate(
                                                        saler.passord.text);
                                                  }
                                                  saler.empty("");
                                                  if (saler.onTap.value ==
                                                      false) {
                                                    saler.onTap(true);
                                                    saler
                                                        .updateseller(
                                                            saler.id,
                                                            saler.salename.text,
                                                            saler.passwordupdate
                                                                .value,
                                                            saler.branch,
                                                            saler.bybranch,
                                                            "",
                                                            saler.phone.text,
                                                            saler.address.text,
                                                            saler.maxsale.text
                                                                .replaceAll(
                                                                    ",", ""))
                                                        .then((value) {
                                                      if (value == "200") {
                                                        saler
                                                            .gatallseller()
                                                            .then((value) =>
                                                                saler.onloading(
                                                                    value));
                                                        Get.snackbar(
                                                            "Warning Messages !",
                                                            "",
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
                                                                SnackPosition
                                                                    .TOP,
                                                            icon: const Icon(
                                                              Icons.message,
                                                              color: colorgreen,
                                                            ));
                                                        saler.clear();
                                                        FocusScope.of(context)
                                                            .requestFocus(
                                                                saler.f3);
                                                        saler.txtsearch(saler
                                                            .onSaveloading
                                                            .value);
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
                                                    }).whenComplete(() =>
                                                            saler.onTap(false));
                                                  }
                                                }
                                              }
                                            } else {
                                              if (saler.branch == null) {
                                                saler.empty("1");
                                              } else if (saler.bybranch ==
                                                  null) {
                                                saler.empty("2");
                                              } else if (saler.salename.text ==
                                                  "") {
                                                saler.empty("3");
                                                FocusScope.of(context)
                                                    .requestFocus(saler.f3);
                                              } else if (saler.maxsale.text ==
                                                  "") {
                                                FocusScope.of(context)
                                                    .requestFocus(saler.f8);
                                                saler.empty("9");
                                              } else if (saler.passord.text ==
                                                  "") {
                                                FocusScope.of(context)
                                                    .requestFocus(saler.f6);
                                                saler.empty("7");
                                              } else if (saler
                                                      .confirmpassord.text ==
                                                  "") {
                                                FocusScope.of(context)
                                                    .requestFocus(saler.f7);
                                                saler.empty("8");
                                              } else {
                                                if (saler.passord.text !=
                                                    saler.confirmpassord.text) {
                                                  CustomDialogs.errorDialogs(
                                                      context,
                                                      " ລະຫັດຜ່ານບໍ່ກົງກັນ");
                                                } else {
                                                  saler.empty("");
                                                  if (saler.onTap.value ==
                                                      false) {
                                                    saler.onTap(true);
                                                    // insert
                                                    saler
                                                        .postseller(
                                                            saler.salename.text,
                                                            saler.passord.text,
                                                            menu.userid.value,
                                                            saler.branch,
                                                            saler.bybranch,
                                                            "",
                                                            saler.phone.text,
                                                            saler.address.text,
                                                            saler.maxsale.text
                                                                .replaceAll(
                                                                    ",", ""))
                                                        .then((value) {
                                                      if (value == "201") {
                                                        saler
                                                            .gatallseller()
                                                            .then((value) =>
                                                                saler.onloading(
                                                                    value));
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
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal)),
                                                            maxWidth: 500,
                                                            backgroundColor:
                                                                colorwhite,
                                                            snackPosition:
                                                                SnackPosition
                                                                    .TOP,
                                                            icon: const Icon(
                                                              Icons.message,
                                                              color: colorgreen,
                                                            ));
                                                        // saler.gatonlydevice(
                                                        //     saler.selected.value);
                                                        saler.clear();
                                                        FocusScope.of(context)
                                                            .requestFocus(
                                                                saler.f3);
                                                        saler.txtsearch(saler
                                                            .onSaveloading
                                                            .value);
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
                                                    }).whenComplete(() =>
                                                            saler.onTap(false));
                                                  }
                                                }
                                              }
                                            }
                                          },
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: colordarkblue,
                                          ),
                                          height: 42,
                                          width: 50,
                                          child: IconButton(
                                              color: colorwhite,
                                              onPressed: () {
                                                saler.clear();
                                              },
                                              icon: const Icon(Icons.refresh)),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "ສະແດງຂໍ້ມູນຄົນຂາຍ ",
                                      style: TextStyle(
                                          fontFamily: phetsarath,
                                          color: colorblack,
                                          fontSize: fontmenu,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    saler.sellermd.isEmpty
                                        ? const ShowNullData(
                                            height: 100,
                                            width: 100,
                                          )
                                        : saler.onloading.value == "200"
                                            ? Container(
                                                width: double.infinity,
                                                color: colorwhite,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      color: colorwhite,
                                                      width: double.infinity,
                                                      child: PaginatedDataTable(
                                                        showCheckboxColumn:
                                                            false,
                                                        showFirstLastButtons:
                                                            true,
                                                        columnSpacing:
                                                            defaultPadding,
                                                        columns: [
                                                          DataColumn(
                                                              label: Text(
                                                                  "ລຳດັບ",
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
                                                                  "ລະຫັດເຄື່ອງຂາຍ",
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
                                                                  "ສາຂາ",
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
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          fontmenu,
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
                                                              label: Text(
                                                                  "ຂາຍສູງສຸດ",
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
                                                                  "ຖືກ Blocked",
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
                                                                      fontSize:
                                                                          fontgeneral,
                                                                      fontFamily:
                                                                          phetsarath))),
                                                        ],
                                                        source: MyDataTable(
                                                            reportData: saler
                                                                        .txtsearch
                                                                        .value ==
                                                                    ""
                                                                ? saler.sellermd
                                                                : saler.sellermd
                                                                    .where((e) =>
                                                                        e.deviceCode.toString() == saler.txtsearch.value ||
                                                                        e.unitName.toString() ==
                                                                            saler
                                                                                .txtsearch.value ||
                                                                        e.branchName.toString() ==
                                                                            saler.txtsearch.value)
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
  MyDataTable({@required List<SellerMd> reportData, BuildContext context})
      : _reportData = reportData,
        _context = context,
        assert(reportData != null);
  final List<SellerMd> _reportData;
  final BuildContext _context;
  bool get isRowCountApproximate => false;
  int get rowCount => _reportData.length;
  int get selectedRowCount => 0;
  SettingSalerCTR saler = Get.put(SettingSalerCTR());
  DataRow getRow(int index) {
    return DataRow(
        onSelectChanged: (value) {
          saler.bybranch = null;
          saler.id = _reportData[index].usid.toString();
          saler.branch = _reportData[index].branchId.toString();
          saler.getbybranch(saler.branch).then((value) {
            if (saler.statusCode.value == "200") {
              saler.bybranch = _reportData[index].unitId.toString();
            } else {
              saler.bybranch = null;
            }
          });
          saler.salename.text = _reportData[index].deviceCode.toString();
          saler.phone.text = _reportData[index].usPhone.toString();
          saler.address.text = _reportData[index].usAddress;
          saler.passwordupdate(_reportData[index].password.toString());
          saler.confirmpassord.clear();
          saler.passord.clear();
          saler.maxsale.text = Numberformated.formated
              .format(double.parse(_reportData[index].maxSell.toString()));
          saler.block(_reportData[index].usStatus.toString());
          saler.getbybranch(saler.branch).then((value) {
            if (value != "200") {
              saler.selected(value);
            } else {
              saler.selected(value);
            }
          });
        },
        cells: [
          DataCell(
            Text(_reportData[index].row ?? "ວ່າງເປົ່າ",
                style: TextStyle(
                    color: colorblack,
                    fontSize: fontgeneral,
                    fontFamily: phetsarath)),
          ),
          DataCell(Text(
              _reportData[index].deviceCode.toString() == ""
                  ? "ວ່າງເປົ່າ"
                  : _reportData[index].deviceCode.toString(),
              style: TextStyle(
                  color: colorblack,
                  fontSize: fontgeneral,
                  fontFamily: phetsarath))),
          DataCell(Text(
              _reportData[index].branchName.toString() == ""
                  ? "ວ່າງເປົ່າ"
                  : _reportData[index].branchName.toString(),
              style: TextStyle(
                  color: colorblack,
                  fontSize: fontgeneral,
                  fontFamily: phetsarath))),
          DataCell(Text(
              _reportData[index].unitName.toString() == ""
                  ? "ວ່າງເປົ່າ"
                  : _reportData[index].unitName.toString(),
              style: TextStyle(
                  color: colorblack,
                  fontSize: fontgeneral,
                  fontFamily: phetsarath))),
          DataCell(Text(
              _reportData[index].usPhone.toString() == ""
                  ? "ວ່າງເປົ່າ"
                  : _reportData[index].usPhone.toString(),
              style: TextStyle(
                  color: colorblack,
                  fontSize: fontgeneral,
                  fontFamily: phetsarath))),
          DataCell(Text(
              _reportData[index].maxSell.toString() == ""
                  ? "ວ່າງເປົ່າ"
                  : Numberformated.formated.format(
                      double.parse(_reportData[index].maxSell.toString())),
              style: TextStyle(
                  color: colorblack,
                  fontSize: fontgeneral,
                  fontFamily: phetsarath))),
          DataCell(Text(
              _reportData[index].usAddress == ""
                  ? "ວ່າງເປົ່າ"
                  : _reportData[index].usAddress,
              style: TextStyle(
                  color: colorblack,
                  fontSize: fontgeneral,
                  fontFamily: phetsarath))),
          DataCell(Text(_reportData[index].usStatus ?? "ວ່າງເປົ່າ",
              style: TextStyle(
                  color: _reportData[index].usStatus.toString() == "ໃຊ້ງານ"
                      ? colorgreen
                      : colorred,
                  fontSize: fontgeneral,
                  fontFamily: phetsarath))),
          DataCell(
            Row(
              children: [
                InkWell(
                    onTap: () async {
                      saler.bybranch = null;
                      saler.id = _reportData[index].usid.toString();

                      saler.branch = _reportData[index].branchId.toString();
                      saler.getbybranch(saler.branch).then((value) {
                        if (saler.statusCode.value == "200") {
                          saler.bybranch = _reportData[index].unitId.toString();
                        } else {
                          saler.bybranch = null;
                        }
                      });
                      saler.salename.text =
                          _reportData[index].deviceCode.toString();
                      saler.phone.text = _reportData[index].usPhone.toString();
                      saler.address.text = _reportData[index].usAddress;
                      saler.passwordupdate(
                          _reportData[index].password.toString());
                      saler.confirmpassord.clear();
                      saler.passord.clear();
                      saler.maxsale.text = Numberformated.formated.format(
                          double.parse(_reportData[index].maxSell.toString()));
                      saler.block(_reportData[index].usStatus.toString());
                      saler.getbybranch(saler.branch).then((value) {
                        if (value != "200") {
                          saler.selected(value);
                        } else {
                          saler.selected(value);
                        }
                      });
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
                                                  saler.onDeleted.value == false
                                                      ? "ລົບ"
                                                      : "ລໍຖ້າ...",
                                              onPressed: () {
                                                if (saler.onDeleted.value ==
                                                    false) {
                                                  saler.onDeleted(true);
                                                  saler
                                                      .deleteseller(
                                                          _reportData[index]
                                                              .deviceCode
                                                              .toString())
                                                      .then((value) {
                                                    if (value == "200") {
                                                      saler.gatallseller().then(
                                                          (value) =>
                                                              saler.onloading(
                                                                  value));
                                                      saler.clear();
                                                      FocusScope.of(_context)
                                                          .requestFocus(
                                                              saler.f3);
                                                      saler.txtsearch(saler
                                                          .onSaveloading.value);
                                                      saler.onDeleted(false);
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
                                                      saler.onDeleted(false);
                                                      Navigator.of(_context)
                                                          .pop();
                                                      CustomDialogs.errorDialogs(
                                                          _context,
                                                          StatusCodeText
                                                              .statusCodeText401);
                                                    } else if (value == "403") {
                                                      saler.onDeleted(false);
                                                      Navigator.of(_context)
                                                          .pop();
                                                      CustomDialogs.errorDialogs(
                                                          _context,
                                                          StatusCodeText
                                                              .statusCodeText403);
                                                    } else if (value == "404") {
                                                      saler.onDeleted(false);
                                                      Navigator.of(_context)
                                                          .pop();
                                                      CustomDialogs.errorDialogs(
                                                          _context,
                                                          StatusCodeText
                                                              .statusCodeText404);
                                                    } else {
                                                      saler.onDeleted(false);
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
                    child: _reportData[index].usStatus.toString() == "ໃຊ້ງານ"
                        ? Container()
                        : const Icon(
                            Icons.delete,
                            color: colorblack,
                          )),
              ],
            ),
          ),
        ]);
  }
}

class Textfieldsaler extends StatelessWidget {
  const Textfieldsaler({
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
    this.inkWellonTap,
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
  final Function inkWellonTap;
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
          suffixIcon: InkWell(onTap: inkWellonTap, child: icon),
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
