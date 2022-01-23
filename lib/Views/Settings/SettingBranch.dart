// ignore_for_file: file_names, avoid_print, annotate_overrides, unused_field
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lotterymanagement/AlertDialogs/CustomDialog.dart';
import 'package:lotterymanagement/Colors/Colors.dart';
import 'package:lotterymanagement/Controllers/MenuCTR.dart';
import 'package:lotterymanagement/Controllers/Setting/SettingbranchCTR.dart';
import 'package:lotterymanagement/Fonts/Fonts.dart';
import 'package:lotterymanagement/Models/BranchMD.dart';
import 'package:lotterymanagement/Responsive/Responsive.dart';
import 'package:lotterymanagement/UrlRespose/StatusCodeError.dart';
import 'package:lotterymanagement/Widget/AppbarheaderMobile.dart';
import 'package:lotterymanagement/Widget/Button.dart';
import 'package:lotterymanagement/Widget/HttpError.dart';
import 'package:lotterymanagement/Widget/LabelText.dart';
import 'package:lotterymanagement/Widget/PopupDialog.dart';
import 'package:lotterymanagement/Widget/ShowNullData.dart';
import 'package:lotterymanagement/Widget/Textfield.dart';

class SettingBranch extends StatefulWidget {
  const SettingBranch({Key key}) : super(key: key);
  @override
  _SettingBranchState createState() => _SettingBranchState();
}

class _SettingBranchState extends State<SettingBranch> {
  SettingBranchCTR branch = Get.put(SettingBranchCTR());
  MenuCTR menu = Get.put(MenuCTR());
  @override
  void initState() {
    branch.clear();
    branch.getallbranch().then((value) => branch.onloading(value));
    // branch.getProvine();
    branch.menu.disable(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => branch.statusCode.value == "error"
        ? HttpError(
            title: StatusCodeText.httpError,
          )
        : branch.statusCode.value == "500"
            ? HttpError(
                title: StatusCodeText.httpError,
              )
            : Scaffold(
                backgroundColor: colorbackground,
                appBar: Responsive.isMobile(context)
                    ? HeaderMobile(
                        onChanged: (p0) {
                          branch.txtsearch(branch.search.text);
                          branch.check = false;
                        },
                        controller: branch.search,
                        onTap: () {
                          if (branch.search.text != "") {
                            for (int i = 0; i < branch.branchmd.length; i++) {
                              if (branch.branchmd[i].branchId.toString() ==
                                      branch.search.text ||
                                  branch.branchmd[i].branchName ==
                                      branch.search.text) {
                                branch.check = true;
                              }
                            }
                            if (branch.check == false) {
                              CustomDialogs.invalidDialogs(
                                  context, "ບໍ່ພົບຂໍ້ມູນນີ້");
                            }
                          }
                        },
                        hintText: "ຄົ້ນຫາ ລະຫັດ ຊື່່ສາຂາ",
                      )
                    : AppBar(
                        backgroundColor: colorbackground,
                        title: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: InfoPopup(
                            hintText: "ຄົ້ນຫາ ລະຫັດ ຊື່່ສາຂາ",
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(50),
                            ],
                            title: "ຕັ້ງຄ່າ",
                            search: branch.search,
                            onChanged: (val) {
                              branch.txtsearch(branch.search.text);
                              branch.check = false;
                            },
                            onTap: () {
                              if (branch.search.text != "") {
                                for (int i = 0;
                                    i < branch.branchmd.length;
                                    i++) {
                                  if (branch.branchmd[i].branchId.toString() ==
                                          branch.search.text ||
                                      branch.branchmd[i].branchName ==
                                          branch.search.text) {
                                    branch.check = true;
                                  }
                                }
                                if (branch.check == false) {
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
                            height: MediaQuery.of(context).size.width,
                            color: colorbackground,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 50, left: 50, top: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "ຕັ້ງຄ່າສາຂາ",
                                          style: TextStyle(
                                              fontFamily: phetsarath,
                                              color: colordarkblue,
                                              fontSize: fontmenu,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
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
                                                color: branch.empty.value == "1"
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
                                                obscureText: false,
                                                bordercolor:
                                                    branch.empty.value == "1"
                                                        ? colorred
                                                        : colorblack,
                                                focusNode:
                                                    branch.empty.value == "1"
                                                        ? branch.f1
                                                        : branch.f1,
                                                controller: branch.provincename,
                                                fontWeight: FontWeight.normal,
                                                textInputType:
                                                    TextInputType.text,
                                                size: 250,
                                              ),
                                            ),
                                            // Card(
                                            //   shape: RoundedRectangleBorder(
                                            //     borderRadius:
                                            //         BorderRadius.circular(10),
                                            //   ),
                                            //   child: Container(
                                            //     width: 250,
                                            //     height: 42,
                                            //     decoration: BoxDecoration(
                                            //       borderRadius:
                                            //           BorderRadius.circular(10),
                                            //       border: Border.all(),
                                            //     ),
                                            //     child:
                                            //         DropdownButtonHideUnderline(
                                            //             child: DropdownButton(
                                            //       borderRadius:
                                            //           BorderRadius.circular(10),
                                            //       value: branch.province,
                                            //       hint: Padding(
                                            //         padding:
                                            //             const EdgeInsets.only(
                                            //                 left: 20.0),
                                            //         child: Text("ຊື່ສາຂາ",
                                            //             style: TextStyle(
                                            //                 color: colorblack,
                                            //                 fontSize: fontmenu,
                                            //                 fontFamily:
                                            //                     phetsarath)),
                                            //       ),
                                            //       items: branch.provincemd
                                            //                   .length !=
                                            //               null
                                            //           ? branch.provincemd
                                            //               .map((document) {
                                            //               return DropdownMenuItem(
                                            //                   value: document
                                            //                       .proviceId
                                            //                       .toString(),
                                            //                   child: SizedBox(
                                            //                     height: 30.0,
                                            //                     child: Padding(
                                            //                       padding: const EdgeInsets
                                            //                               .only(
                                            //                           left:
                                            //                               20.0),
                                            //                       child: Text(
                                            //                           document
                                            //                               .provinceName,
                                            //                           style: TextStyle(
                                            //                               color:
                                            //                                   colorblack,
                                            //                               fontSize:
                                            //                                   fontgeneral,
                                            //                               fontFamily:
                                            //                                   phetsarath)),
                                            //                     ),
                                            //                   ));
                                            //             }).toList()
                                            //           : branch.province,
                                            //       onChanged: (value) {
                                            //         branch.getProvine();
                                            //         branch.province = value;
                                            //       },
                                            //     )),
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            LabelText(
                                                count: "1",
                                                name: "ເລກສາຂາ",
                                                color: branch.empty.value == "2"
                                                    ? colorred
                                                    : colorblack),
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Textfield(
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                  LengthLimitingTextInputFormatter(
                                                      5),
                                                ],
                                                fontFamily: phetsarath,
                                                obscureText: false,
                                                bordercolor:
                                                    branch.empty.value == "2"
                                                        ? colorred
                                                        : colorblack,
                                                focusNode:
                                                    branch.empty.value == "2"
                                                        ? branch.f2
                                                        : branch.f2,
                                                controller: branch.name,
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
                                                color: branch.empty.value == "3"
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
                                                    branch.empty.value == "3"
                                                        ? colorred
                                                        : colordarkblue,
                                                focusNode:
                                                    branch.empty.value == "3"
                                                        ? branch.f3
                                                        : branch.f3,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(
                                                          RegExp(r'[0-9,.]')),
                                                  LengthLimitingTextInputFormatter(
                                                      35),
                                                ],
                                                controller: branch.phone,
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
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Button(
                                    height: 42,
                                    title: branch.onTap.value == false
                                        ? "ບັນທຶກ"
                                        : "ລໍຖ້າ...",
                                    colorstype: colorwhite,
                                    fontFamily: phetsarath,
                                    fontSize: fontgeneral,
                                    onPressed: () {
                                      if (branch.provincename.text == "") {
                                        branch.empty("1");
                                        FocusScope.of(context)
                                            .requestFocus(branch.f1);
                                      } else if (branch.name.text == "") {
                                        FocusScope.of(context)
                                            .requestFocus(branch.f2);
                                        branch.empty("2");
                                      } else if (branch.phone.text == "") {
                                        FocusScope.of(context)
                                            .requestFocus(branch.f3);
                                        branch.empty("3");
                                      } else {
                                        branch.empty("");
                                        if (branch.onTap.value == false) {
                                          branch.onTap(true);
                                          if (branch.id != "") {
                                            branch
                                                .updatebranch(
                                                    branch.id,
                                                    branch.name.text,
                                                    "0",
                                                    branch.phone.text,
                                                    branch.provincename.text)
                                                .then((value) {
                                              if (value == "200") {
                                                branch.getallbranch().then(
                                                    (value) => branch
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
                                                    backgroundColor: colorwhite,
                                                    snackPosition:
                                                        SnackPosition.TOP,
                                                    icon: const Icon(
                                                      Icons.message,
                                                      color: colorgreen,
                                                    ));
                                                branch.clear();
                                                FocusScope.of(context)
                                                    .requestFocus(branch.f1);
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
                                                    () => branch.onTap(false));
                                          } else {
                                            branch
                                                .postbranch(
                                                    branch.name.text,
                                                    "0",
                                                    menu.userid.value,
                                                    branch.phone.text,
                                                    branch.provincename.text)
                                                .then((value) {
                                              if (value == "201") {
                                                branch.getallbranch().then(
                                                    (value) => branch
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
                                                    backgroundColor: colorwhite,
                                                    snackPosition:
                                                        SnackPosition.TOP,
                                                    icon: const Icon(
                                                      Icons.message,
                                                      color: colorgreen,
                                                    ));
                                                branch.clear();
                                                FocusScope.of(context)
                                                    .requestFocus(branch.f1);
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
                                                    () => branch.onTap(false));
                                          }
                                        }
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "ສະແດງຂໍ້ມູນສາຂາ",
                                    style: TextStyle(
                                        fontFamily: phetsarath,
                                        color: colorblack,
                                        fontSize: fontmenu,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  branch.branchmd.isEmpty
                                      ? const ShowNullData(
                                          height: 150,
                                          width: 150,
                                        )
                                      : branch.onloading.value == "200"
                                          ? Expanded(
                                              child: SingleChildScrollView(
                                                child: Container(
                                                  color: colorwhite,
                                                  width: double.infinity,
                                                  child: PaginatedDataTable(
                                                    showCheckboxColumn: false,
                                                    showFirstLastButtons: true,
                                                    columnSpacing:
                                                        defaultPadding,
                                                    columns: [
                                                      DataColumn(
                                                          label: Text("ລຳດັບ",
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
                                                          label: Text("ຊື່ສາຂາ",
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
                                                          label: Text("ເບີໂທ",
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
                                                          label: Text("",
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
                                                    ],
                                                    source: MyDataTable(
                                                        reportData: branch
                                                                    .txtsearch
                                                                    .value ==
                                                                ""
                                                            ? branch.branchmd
                                                            : branch.branchmd
                                                                .where((e) =>
                                                                    e.branchId
                                                                            .toString() ==
                                                                        branch
                                                                            .txtsearch
                                                                            .value ||
                                                                    e.branchName ==
                                                                        branch
                                                                            .txtsearch
                                                                            .value)
                                                                .toList(),
                                                        context: context),
                                                    rowsPerPage: 15,
                                                    //  initialFirstRowIndex: 1,
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
                            )),
                      ))
                    :
                    //////////////////////////////////////// Mobile //////////////////////////////////////
                    SafeArea(
                        child: SingleChildScrollView(
                        child: Container(
                            width: double.infinity,
                            height: 1287,
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
                                    "ຕັ້ງຄ່າສາຂາ",
                                    style: TextStyle(
                                        fontFamily: phetsarath,
                                        color: colordarkblue,
                                        fontSize: fontmenu,
                                        fontWeight: FontWeight.bold),
                                  ),

                                  LabelText(
                                      count: "1",
                                      name: "ຊື່ສາຂາ",
                                      color: branch.empty.value == "1"
                                          ? colorred
                                          : colorblack),

                                  Textfield(
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(30),
                                    ],
                                    fontFamily: phetsarath,
                                    obscureText: false,
                                    bordercolor: branch.empty.value == "1"
                                        ? colorred
                                        : colorblack,
                                    focusNode: branch.empty.value == "1"
                                        ? branch.f1
                                        : branch.f1,
                                    controller: branch.provincename,
                                    fontWeight: FontWeight.normal,
                                    textInputType: TextInputType.text,
                                    size: double.infinity,
                                  ),
                                  // Container(
                                  //   width: double.infinity,
                                  //   height: 50,
                                  //   decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.circular(10),
                                  //     border: Border.all(),
                                  //   ),
                                  //   child: DropdownButtonHideUnderline(
                                  //       child: DropdownButton(
                                  //     borderRadius: BorderRadius.circular(10),
                                  //     value: branch.province,
                                  //     hint: Padding(
                                  //       padding:
                                  //           const EdgeInsets.only(left: 20.0),
                                  //       child: Text("ຊື່ສາຂາ",
                                  //           style: TextStyle(
                                  //               color: colorblack,
                                  //               fontSize: fontmenu,
                                  //               fontFamily: phetsarath)),
                                  //     ),
                                  //     items: branch.provincemd.length != null
                                  //         ? branch.provincemd.map((document) {
                                  //             return DropdownMenuItem(
                                  //                 value: document.proviceId
                                  //                     .toString(),
                                  //                 child: SizedBox(
                                  //                   height: 30.0,
                                  //                   child: Padding(
                                  //                     padding:
                                  //                         const EdgeInsets.only(
                                  //                             left: 20.0),
                                  //                     child: Text(
                                  //                         document.provinceName,
                                  //                         style: TextStyle(
                                  //                             color: colorblack,
                                  //                             fontSize:
                                  //                                 fontgeneral,
                                  //                             fontFamily:
                                  //                                 phetsarath)),
                                  //                   ),
                                  //                 ));
                                  //           }).toList()
                                  //         : branch.province,
                                  //     onChanged: (value) {
                                  //       branch.getProvine();
                                  //       branch.province = value;
                                  //     },
                                  //   )),
                                  // ),

                                  LabelText(
                                      count: "1",
                                      name: "ເລກສາຂາ",
                                      color: branch.empty.value == "2"
                                          ? colorred
                                          : colorblack),

                                  Textfield(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(5),
                                    ],
                                    fontFamily: phetsarath,
                                    obscureText: false,
                                    bordercolor: branch.empty.value == "2"
                                        ? colorred
                                        : colorblack,
                                    focusNode: branch.empty.value == "2"
                                        ? branch.f2
                                        : branch.f2,
                                    controller: branch.name,
                                    fontWeight: FontWeight.normal,
                                    textInputType: TextInputType.number,
                                    size: double.infinity,
                                  ),

                                  LabelText(
                                      count: "1",
                                      name: "ເບີໂທ",
                                      color: branch.empty.value == "3"
                                          ? colorred
                                          : colorblack),

                                  Textfield(
                                    obscureText: false,
                                    fontFamily: phetsarath,
                                    bordercolor: branch.empty.value == "3"
                                        ? colorred
                                        : colordarkblue,
                                    focusNode: branch.empty.value == "3"
                                        ? branch.f3
                                        : branch.f3,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9,.]')),
                                      LengthLimitingTextInputFormatter(35),
                                    ],
                                    controller: branch.phone,
                                    fontWeight: FontWeight.normal,
                                    textInputType: TextInputType.number,
                                    size: double.infinity,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Button(
                                    height: 42,
                                    title: branch.onTap.value == false
                                        ? "ບັນທຶກ"
                                        : "ລໍຖ້າ...",
                                    colorstype: colorwhite,
                                    fontFamily: phetsarath,
                                    fontSize: fontgeneral,
                                    onPressed: () {
                                      if (branch.provincename.text == "") {
                                        branch.empty("1");
                                        FocusScope.of(context)
                                            .requestFocus(branch.f1);
                                      } else if (branch.name.text == "") {
                                        FocusScope.of(context)
                                            .requestFocus(branch.f2);
                                        branch.empty("2");
                                      } else if (branch.phone.text == "") {
                                        FocusScope.of(context)
                                            .requestFocus(branch.f3);
                                        branch.empty("3");
                                      } else {
                                        branch.empty("");
                                        if (branch.onTap.value == false) {
                                          branch.onTap(true);
                                          if (branch.id != "") {
                                            branch
                                                .updatebranch(
                                                    branch.id,
                                                    branch.name.text,
                                                    "0",
                                                    branch.phone.text,
                                                    branch.provincename.text)
                                                .then((value) {
                                              if (value == "200") {
                                                branch.getallbranch().then(
                                                    (value) => branch
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
                                                    backgroundColor: colorwhite,
                                                    snackPosition:
                                                        SnackPosition.TOP,
                                                    icon: const Icon(
                                                      Icons.message,
                                                      color: colorgreen,
                                                    ));
                                                branch.clear();
                                                FocusScope.of(context)
                                                    .requestFocus(branch.f1);
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
                                                    () => branch.onTap(false));
                                          } else {
                                            branch
                                                .postbranch(
                                                    branch.name.text,
                                                    "0",
                                                    menu.userid.value,
                                                    branch.phone.text,
                                                    branch.provincename.text)
                                                .then((value) {
                                              if (value == "201") {
                                                branch.getallbranch().then(
                                                    (value) => branch
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
                                                    // maxWidth: 500,
                                                    backgroundColor: colorwhite,
                                                    snackPosition:
                                                        SnackPosition.TOP,
                                                    icon: const Icon(
                                                      Icons.message,
                                                      color: colorgreen,
                                                    ));
                                                branch.clear();
                                                FocusScope.of(context)
                                                    .requestFocus(branch.f1);
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
                                                    () => branch.onTap(false));
                                          }
                                        }
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "ສະແດງຂໍ້ມູນສາຂາ",
                                    style: TextStyle(
                                        fontFamily: phetsarath,
                                        color: colorblack,
                                        fontSize: fontmenu,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  branch.branchmd.isEmpty
                                      ? const ShowNullData(
                                          height: 100,
                                          width: 100,
                                        )
                                      : branch.onloading.value == "200"
                                          ? Container(
                                              color: colorwhite,
                                              width: double.infinity,
                                              // height: 900,
                                              child: PaginatedDataTable(
                                                showCheckboxColumn: false,
                                                showFirstLastButtons: true,
                                                columnSpacing: defaultPadding,
                                                columns: [
                                                  DataColumn(
                                                      label: Text("ລຳດັບ",
                                                          style: TextStyle(
                                                              color: colorblack,
                                                              fontSize:
                                                                  fontmenu,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  phetsarath))),
                                                  DataColumn(
                                                      label: Text("ຊື່ສາຂາ",
                                                          style: TextStyle(
                                                              color: colorblack,
                                                              fontSize:
                                                                  fontmenu,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  phetsarath))),
                                                  DataColumn(
                                                      label: Text("ເບີໂທ",
                                                          style: TextStyle(
                                                              color: colorblack,
                                                              fontSize:
                                                                  fontmenu,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  phetsarath))),
                                                  DataColumn(
                                                      label: Text("",
                                                          style: TextStyle(
                                                              color: colorblack,
                                                              fontSize:
                                                                  fontmenu,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  phetsarath))),
                                                ],
                                                source: MyDataTable(
                                                    reportData: branch.txtsearch
                                                                .value ==
                                                            ""
                                                        ? branch.branchmd
                                                        : branch.branchmd
                                                            .where((e) =>
                                                                e.branchId
                                                                        .toString() ==
                                                                    branch
                                                                        .txtsearch
                                                                        .value ||
                                                                e.branchName ==
                                                                    branch
                                                                        .txtsearch
                                                                        .value)
                                                            .toList(),
                                                    context: context),
                                                rowsPerPage: 15,
                                                // initialFirstRowIndex: 1,
                                              ),
                                            )
                                          : const ShowNullData(
                                              height: 100,
                                              width: 100,
                                            )
                                ],
                              ),
                            )),
                      ))));
  }
}

class MyDataTable extends DataTableSource {
  MyDataTable({@required List<BranchMd> reportData, BuildContext context})
      : _reportData = reportData,
        _context = context,
        assert(reportData != null);
  final List<BranchMd> _reportData;
  final BuildContext _context;
  bool get isRowCountApproximate => false;
  int get rowCount => _reportData.length;
  int get selectedRowCount => 0;
  SettingBranchCTR branch = Get.put(SettingBranchCTR());
  DataRow getRow(int index) {
    return DataRow(
        onSelectChanged: (value) {
          branch.id = _reportData[index].branchId.toString();
          branch.provincename.text = _reportData[index].branchname.toString();
          branch.name.text = _reportData[index].branchCode;
          branch.phone.text = _reportData[index].phone.toString();
          // branch.getProvine();
        },
        cells: [
          DataCell(
            Text(_reportData[index].row ?? "ວ່າງເປົ່າ",
                style: TextStyle(
                    color: colorblack,
                    fontSize: fontgeneral,
                    fontFamily: phetsarath)),
          ),
          DataCell(Text(_reportData[index].branchName ?? "ວ່າງເປົ່າ",
              style: TextStyle(
                  color: colorblack,
                  fontSize: fontgeneral,
                  fontFamily: phetsarath))),
          DataCell(Text(_reportData[index].phone.toString() ?? "ວ່າງເປົ່າ",
              style: TextStyle(
                  color: colorblack,
                  fontSize: fontgeneral,
                  fontFamily: phetsarath))),
          DataCell(
            Row(
              children: [
                InkWell(
                    onTap: () async {
                      branch.id = _reportData[index].branchId.toString();
                      branch.provincename.text =
                          _reportData[index].branchname.toString();
                      branch.name.text = _reportData[index].branchCode;
                      branch.phone.text = _reportData[index].phone.toString();
                      // branch.getProvine();
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
                                              text: branch.onDeleted.value ==
                                                      false
                                                  ? "ລົບ"
                                                  : "ລໍຖ້າ...",
                                              onPressed: () {
                                                if (branch.onDeleted.value ==
                                                    false) {
                                                  branch.onDeleted(true);
                                                  branch
                                                      .deletebranch(
                                                          _reportData[index]
                                                              .branchId
                                                              .toString())
                                                      .then((value) {
                                                    if (value == "200") {
                                                      branch
                                                          .getallbranch()
                                                          .then((value) =>
                                                              branch.onloading(
                                                                  value));
                                                      branch.clear();
                                                      FocusScope.of(_context)
                                                          .requestFocus(
                                                              branch.f1);
                                                      branch.onDeleted(false);
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
                                                      branch.onDeleted(false);
                                                      Navigator.of(_context)
                                                          .pop();
                                                      CustomDialogs.errorDialogs(
                                                          _context,
                                                          StatusCodeText
                                                              .statusCodeText401);
                                                    } else if (value == "403") {
                                                      branch.onDeleted(false);
                                                      Navigator.of(_context)
                                                          .pop();
                                                      CustomDialogs.errorDialogs(
                                                          _context,
                                                          StatusCodeText
                                                              .statusCodeText403);
                                                    } else if (value == "404") {
                                                      branch.onDeleted(false);
                                                      Navigator.of(_context)
                                                          .pop();
                                                      CustomDialogs.errorDialogs(
                                                          _context,
                                                          StatusCodeText
                                                              .statusCodeText404);
                                                    } else {
                                                      branch.onDeleted(false);
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
          )
        ]);
  }
}
