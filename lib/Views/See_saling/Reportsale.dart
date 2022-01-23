// ignore_for_file: file_names, annotate_overrides, unused_field
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:lotterymanagement/AlertDialogs/CustomDialog.dart';
import 'package:lotterymanagement/Colors/Colors.dart';
import 'package:lotterymanagement/Controllers/Install_Open/InputNumberCTR.dart';
import 'package:lotterymanagement/Controllers/See_saling/ReportSaleCTR.dart';
import 'package:lotterymanagement/Fonts/Fonts.dart';
import 'package:lotterymanagement/Models/BillnumberSellerMD.dart';
import 'package:lotterymanagement/Models/CancelbillNumberMD.dart';
import 'package:lotterymanagement/Models/ListOfBillMD.dart';
import 'package:lotterymanagement/Models/ListOfBillcancelMD.dart';
import 'package:lotterymanagement/UrlRespose/StatusCodeError.dart';
import 'package:lotterymanagement/Widget/Button.dart';
import 'package:lotterymanagement/Widget/HttpError.dart';
import 'package:lotterymanagement/Widget/LabelText.dart';
import 'package:lotterymanagement/Widget/Numberformat.dart';
import 'package:lotterymanagement/Widget/PopupDialog.dart';
import 'package:get/get.dart';
import 'package:lotterymanagement/Widget/ShowNullData.dart';
import 'package:lotterymanagement/Widget/Textfield.dart';

class ReportSale extends StatefulWidget {
  const ReportSale({Key key}) : super(key: key);
  @override
  _ReportSaleState createState() => _ReportSaleState();
}

class _ReportSaleState extends State<ReportSale>
    with SingleTickerProviderStateMixin {
  ReportSaleCTR reportsale = Get.put(ReportSaleCTR());
  InputNumberCTR inputnum = Get.put(InputNumberCTR());
  @override
  void initState() {
    inputnum.getNumber().then((value) {
      reportsale.statusCode(value);
      if (value != "200") {
        reportsale.period(value);
        CustomDialogs.errorDialogs(context, " ບໍພົບງວດຂາຍ !");
      } else {
        reportsale.period(inputnum.currentperiod[0].periodNumber.toString());
      }
    });
    reportsale.menu.disable(true);
    reportsale.clear();
    super.initState();
    // reportsale.controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => reportsale.statusCode.value == "error"
          ? HttpError(
              title: StatusCodeText.httpError,
            )
          : reportsale.statusCode.value == "500"
              ? HttpError(
                  title: StatusCodeText.httpError,
                )
              : Scaffold(
                  backgroundColor: colorbackground,
                  appBar: AppBar(
                    backgroundColor: colorbackground,
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: InfoPopup(
                        title: "ເບີ່ງຂໍ້ມູນຂາຍ",
                        search: reportsale.search,
                        onChanged: (val) {
                          // reportsale.txtsearch(reportsale.search.text);
                          // reportsale.check = false;
                        },
                        onTap: () {
                          // if (reportsale.search.text != "") {
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
                  body: SafeArea(
                    child: SingleChildScrollView(
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.width,
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
                                      "ຍົກເລີກບິນຂາຍ",
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
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  LabelText(
                                      name: "ເລກບິນ",
                                      color: reportsale.empty.value == "1"
                                          ? colorred
                                          : colorblack),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Textfield(
                                              bordercolor:
                                                  reportsale.empty.value == "1"
                                                      ? colorred
                                                      : colordarkblue,
                                              focusNode:
                                                  reportsale.empty.value == "1"
                                                      ? reportsale.f1
                                                      : reportsale.f1,
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly,
                                                LengthLimitingTextInputFormatter(
                                                    40),
                                              ],
                                              fontFamily: phetsarath,
                                              obscureText: false,
                                              controller: reportsale.txtbill,
                                              fontWeight: FontWeight.normal,
                                              textInputType:
                                                  TextInputType.number,
                                              size: 250,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 40,
                                      ),
                                      Button(
                                        height: 42,
                                        title: reportsale.onSave.value == false
                                            ? "ຍົກເລີກ"
                                            : "ລໍຖ້າ...",
                                        colorstype: colorwhite,
                                        fontFamily: phetsarath,
                                        fontSize: fontgeneral,
                                        onPressed: () {
                                          if (reportsale.txtbill.text == "") {
                                            reportsale.empty("1");
                                            FocusScope.of(context)
                                                .requestFocus(reportsale.f1);
                                          } else if (reportsale.period.value ==
                                              "") {
                                            FocusScope.of(context)
                                                .requestFocus(reportsale.f1);
                                            CustomDialogs.errorDialogs(
                                                context, " ບໍ່ພົບງວດລ່າສຸດ");
                                          } else {
                                            CustomDialogs.cancelBillDialogs(
                                                context, () {
                                              reportsale.empty("");
                                              if (reportsale.onSave.value ==
                                                  false) {
                                                reportsale.onSave(true);
                                                reportsale
                                                    .cancelbill(
                                                        reportsale.txtbill.text,
                                                        "1")
                                                    .then((value) {
                                                  if (value == "200") {
                                                    Navigator.of(context).pop();
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
                                                    reportsale
                                                        .getbillnumberseller(
                                                            reportsale
                                                                .secondsearch
                                                                .text,
                                                            reportsale
                                                                .period.value)
                                                        .then((value) => reportsale
                                                            .onloadingListbill(
                                                                value));
                                                    reportsale
                                                        .getcancelbillnumbersaler(
                                                            reportsale
                                                                .secondsearch
                                                                .text,
                                                            reportsale
                                                                .period.value)
                                                        .then((value) =>
                                                            reportsale
                                                                .cancelonloading(
                                                                    value));
                                                    reportsale
                                                        .onloadingListbillDetail(
                                                            "");
                                                    reportsale
                                                        .onloadingcancel("");
                                                    reportsale.txtbill.clear();
                                                    FocusScope.of(context)
                                                        .requestFocus(
                                                            reportsale.f1);
                                                  } else if (value == "401") {
                                                    Navigator.of(context).pop();
                                                    CustomDialogs.errorDialogs(
                                                        context,
                                                        StatusCodeText
                                                            .statusCodeText401);
                                                  } else if (value == "403") {
                                                    Navigator.of(context).pop();
                                                    CustomDialogs.errorDialogs(
                                                        context,
                                                        StatusCodeText
                                                            .statusCodeText403);
                                                  } else if (value == "404") {
                                                    Navigator.of(context).pop();
                                                    CustomDialogs.errorDialogs(
                                                        context,
                                                        "ລະຫັດເລກບິນບໍ່ຖືກຕ້ອງ !");
                                                    reportsale.txtbill.text =
                                                        "";
                                                    FocusScope.of(context)
                                                        .requestFocus(
                                                            reportsale.f1);
                                                  } else {
                                                    Navigator.of(context).pop();
                                                    CustomDialogs.errorDialogs(
                                                        context,
                                                        StatusCodeText
                                                            .statusCodeText500);
                                                  }
                                                }).whenComplete(() => reportsale
                                                        .onSave(false));
                                              }
                                            });
                                          }
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const LabelText(
                                      name: "ບິນທັງຫມົດ", color: colorblack),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 10,
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: SizedBox(
                                            width: double.infinity,
                                            height: 42,
                                            child: TextFormField(
                                              focusNode: reportsale.f2,
                                              controller:
                                                  reportsale.secondsearch,
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly,
                                                LengthLimitingTextInputFormatter(
                                                    30),
                                              ],
                                              onChanged: (value) {
                                                reportsale.txtbill.clear();
                                                // setState(() {
                                                //   reportsale.bill ??= "ເລກບິນ";
                                                // });
                                                if (reportsale.period.value ==
                                                    "") {
                                                  CustomDialogs.errorDialogs(
                                                      context,
                                                      " ບໍ່ພົບງວດລ່າສຸດ !");
                                                  reportsale.secondsearch
                                                      .clear();
                                                  FocusScope.of(context)
                                                      .requestFocus(
                                                          reportsale.f2);
                                                } else {
                                                  // if (reportsale.onTap.value ==
                                                  //     "0") {

                                                  if (reportsale
                                                          .secondsearch.text !=
                                                      "") {
                                                    //ເລກບິນ
                                                    // if (reportsale.bill ==
                                                    //     "ເລກບິນ") {
                                                    // reportsale
                                                    //     .getbillnumber(
                                                    //         value,
                                                    //         reportsale
                                                    //             .period.value)
                                                    //     .then((value) =>
                                                    //         reportsale
                                                    //             .onloading(
                                                    //                 value));
                                                    // } else {
                                                    //   //ຄົນຂາຍ
                                                    reportsale
                                                        .getbillnumberseller(
                                                            value,
                                                            reportsale
                                                                .period.value)
                                                        .then((value) => reportsale
                                                            .onloadingListbill(
                                                                value));
                                                    // ຍົກເລີກຄົນຂາຍ
                                                    reportsale
                                                        .getcancelbillnumbersaler(
                                                            value,
                                                            reportsale
                                                                .period.value)
                                                        .then((value) =>
                                                            reportsale
                                                                .cancelonloading(
                                                                    value));
                                                    //}
                                                  } else {
                                                    reportsale.clear();
                                                  }
                                                  ////////////////ຄົນຂາຍ/////////
                                                  // } else {
                                                  //   if (reportsale.secondsearch
                                                  //           .text !=
                                                  //       "") {
                                                  //     //ຍົກເລີກເລກບິນ
                                                  //     if (reportsale.bill ==
                                                  //         "ເລກບິນ") {
                                                  //       reportsale
                                                  //           .getcancelbillnumber(
                                                  //               value,
                                                  //               reportsale
                                                  //                   .period
                                                  //                   .value)
                                                  //           .then((value) =>
                                                  //               reportsale
                                                  //                   .onloading(
                                                  //                       value));
                                                  //     } else {
                                                  //       //ຍົກເລີກຄົນຂາຍ
                                                  //       reportsale
                                                  //           .getcancelbillnumbersaler(
                                                  //               value,
                                                  //               reportsale
                                                  //                   .period
                                                  //                   .value)
                                                  //           .then((value) =>
                                                  //               reportsale
                                                  //                   .onloading(
                                                  //                       value));
                                                  //     }
                                                  //   } else {
                                                  //     reportsale.clear();
                                                  //   }
                                                  // }
                                                }
                                              },
                                              keyboardType:
                                                  TextInputType.number,
                                              style: TextStyle(
                                                  color: colorblack,
                                                  fontSize: fontmenu,
                                                  fontFamily: phetsarath,
                                                  fontWeight:
                                                      FontWeight.normal),
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    borderSide:
                                                        const BorderSide(
                                                            color: colorblack)),
                                                suffixIcon: InkWell(
                                                    onTap: () {},
                                                    child: const Icon(
                                                      Icons.search,
                                                      color: colorblack,
                                                    )),
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 25),
                                                hintText: "ປ້ອນລະຫັດຄົນຂາຍ",
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: colorblack),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Card(
                                      //   shape: RoundedRectangleBorder(
                                      //     borderRadius:
                                      //         BorderRadius.circular(1),
                                      //   ),
                                      //   child: Container(
                                      //     height: 42,
                                      //     decoration: BoxDecoration(
                                      //       borderRadius:
                                      //           BorderRadius.circular(1),
                                      //       color: colordarkblue,
                                      //     ),
                                      //     child: DropdownButtonHideUnderline(
                                      //         child: DropdownButton(
                                      //       iconEnabledColor: colorwhite,
                                      //       dropdownColor: colordarkblue,
                                      //       borderRadius:
                                      //           BorderRadius.circular(1),
                                      //       value: reportsale.bill,
                                      //       hint: Padding(
                                      //         padding: const EdgeInsets.only(
                                      //             left: 10),
                                      //         child: Text("ເລກບິນ",
                                      //             style: TextStyle(
                                      //                 color: colorwhite,
                                      //                 fontSize: fontmenu,
                                      //                 fontFamily: phetsarath)),
                                      //       ),
                                      //       items: [
                                      //         DropdownMenuItem(
                                      //           child: Padding(
                                      //             padding:
                                      //                 const EdgeInsets.only(
                                      //                     left: 10),
                                      //             child: Text("ເລກບິນ",
                                      //                 style: TextStyle(
                                      //                     color: colorwhite,
                                      //                     fontSize: fontmenu,
                                      //                     fontFamily:
                                      //                         phetsarath)),
                                      //           ),
                                      //           value: "ເລກບິນ",
                                      //         ),
                                      //         DropdownMenuItem(
                                      //           child: Padding(
                                      //             padding:
                                      //                 const EdgeInsets.only(
                                      //                     left: 10),
                                      //             child: Text("ລະຫັດຄົນຂາຍ",
                                      //                 style: TextStyle(
                                      //                     color: colorwhite,
                                      //                     fontSize: fontmenu,
                                      //                     fontFamily:
                                      //                         phetsarath)),
                                      //           ),
                                      //           value: "ລະຫັດຄົນຂາຍ",
                                      //         ),
                                      //       ].toList(),
                                      //       onChanged: (value) {
                                      //         setState(() {
                                      //           reportsale.bill = value;
                                      //         });
                                      //         FocusScope.of(context)
                                      //             .requestFocus(reportsale.f2);
                                      //         reportsale.clear();
                                      //       },
                                      //     )),
                                      //   ),
                                      // )
                                    ],
                                  ),
                                ],
                              ),
                              // ລາຍການບິນ //////////////////////
                              reportsale.onloadingListbill.value != "200"
                                  ? Container()
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              color: colorwhite,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 460,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  // SizedBox(
                                                  //   width: 400,
                                                  //   child: TabBar(
                                                  //     onTap: (value) {
                                                  //       reportsale
                                                  //           .onTap(value.toString());
                                                  //       reportsale.clear();
                                                  //       FocusScope.of(context)
                                                  //           .requestFocus(
                                                  //               reportsale.f2);
                                                  //     },
                                                  //     controller:
                                                  //         reportsale.controller,
                                                  //     tabs: [
                                                  //       Tab(
                                                  //         child: Text("ລາຍການບິນ",
                                                  //             style: TextStyle(
                                                  //                 color:
                                                  //                     colordarkblue,
                                                  //                 fontSize: fontmenu,
                                                  //                 fontFamily:
                                                  //                     phetsarath)),
                                                  //       ),
                                                  //       Tab(
                                                  //         child: Text(
                                                  //             "ລາຍການບິນຍົກເລີກ",
                                                  //             style: TextStyle(
                                                  //                 color:
                                                  //                     colordarkblue,
                                                  //                 fontSize: fontmenu,
                                                  //                 fontFamily:
                                                  //                     phetsarath)),
                                                  //       ),
                                                  //     ],
                                                  //   ),
                                                  // ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text("ລາຍການບິນ",
                                                      style: TextStyle(
                                                          color: colordarkblue,
                                                          fontSize: fontmenu,
                                                          fontFamily:
                                                              phetsarath)),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  ///////////////// ລາຍການບິນ //////////
                                                  // reportsale.onTap.value == "0"
                                                  //     //ເລກບິນ
                                                  //     ? reportsale.bill == "ເລກບິນ"
                                                  //       ?
                                                  // reportsale.billnumbermd.isEmpty
                                                  //     ? Center(
                                                  //         child: Text(
                                                  //             "ຂໍ້ມູນວ່າງເປົ່າ. . .",
                                                  //             style: TextStyle(
                                                  //                 color: colorred,
                                                  //                 fontWeight:
                                                  //                     FontWeight.bold,
                                                  //                 fontSize: fontmenu,
                                                  //                 fontFamily:
                                                  //                     phetsarath)),
                                                  //       )
                                                  //     :
                                                  // reportsale.onloading.value == "200"
                                                  //     ? Expanded(
                                                  //         child: Container(
                                                  //         color: colorwhite,
                                                  //         width: double.infinity,
                                                  //         child: PaginatedDataTable(
                                                  //             showCheckboxColumn:
                                                  //                 false,
                                                  //             showFirstLastButtons:
                                                  //                 true,
                                                  //             columnSpacing:
                                                  //                 defaultPadding,
                                                  //             columns: [
                                                  //               DataColumn(
                                                  //                   label: Text(
                                                  //                       "ລຳດັບ",
                                                  //                       style: TextStyle(
                                                  //                           color:
                                                  //                               colorblack,
                                                  //                           fontSize:
                                                  //                               fontmenu,
                                                  //                           fontWeight:
                                                  //                               FontWeight
                                                  //                                   .bold,
                                                  //                           fontFamily:
                                                  //                               phetsarath))),
                                                  //               DataColumn(
                                                  //                   label: Text(
                                                  //                       "ເລກທີບິນ",
                                                  //                       style: TextStyle(
                                                  //                           color:
                                                  //                               colorblack,
                                                  //                           fontSize:
                                                  //                               fontmenu,
                                                  //                           fontWeight:
                                                  //                               FontWeight
                                                  //                                   .bold,
                                                  //                           fontFamily:
                                                  //                               phetsarath))),
                                                  //               DataColumn(
                                                  //                   label: Text(
                                                  //                       "ວັນທີຂາຍ",
                                                  //                       style: TextStyle(
                                                  //                           color:
                                                  //                               colorblack,
                                                  //                           fontSize:
                                                  //                               fontmenu,
                                                  //                           fontWeight:
                                                  //                               FontWeight
                                                  //                                   .bold,
                                                  //                           fontFamily:
                                                  //                               phetsarath))),
                                                  //               DataColumn(
                                                  //                   label: Text(
                                                  //                       "ລະຫັດຄົນຂາຍ",
                                                  //                       style: TextStyle(
                                                  //                           color:
                                                  //                               colorblack,
                                                  //                           fontSize:
                                                  //                               fontmenu,
                                                  //                           fontWeight:
                                                  //                               FontWeight
                                                  //                                   .bold,
                                                  //                           fontFamily:
                                                  //                               phetsarath))),
                                                  //               DataColumn(
                                                  //                   label: Text(
                                                  //                       "ລະຫັດເຄື່ອງ",
                                                  //                       style: TextStyle(
                                                  //                           color:
                                                  //                               colorblack,
                                                  //                           fontSize:
                                                  //                               fontmenu,
                                                  //                           fontWeight:
                                                  //                               FontWeight
                                                  //                                   .bold,
                                                  //                           fontFamily:
                                                  //                               phetsarath))),
                                                  //               DataColumn(
                                                  //                   label: Text(
                                                  //                       "ຈຳນວນ",
                                                  //                       style: TextStyle(
                                                  //                           color:
                                                  //                               colorblack,
                                                  //                           fontSize:
                                                  //                               fontmenu,
                                                  //                           fontWeight:
                                                  //                               FontWeight
                                                  //                                   .bold,
                                                  //                           fontFamily:
                                                  //                               phetsarath))),
                                                  //             ],
                                                  //             rowsPerPage: 9,
                                                  //             source: BillNumber(
                                                  //                 reportData: reportsale
                                                  //                     .billnumbermd,
                                                  //                 context: context)),
                                                  //       ))
                                                  //     : Center(
                                                  //         child: Text(
                                                  //             "ຂໍ້ມູນວ່າງເປົ່າ. . .",
                                                  //             style: TextStyle(
                                                  //                 color: colorred,
                                                  //                 fontWeight:
                                                  //                     FontWeight.bold,
                                                  //                 fontSize: fontmenu,
                                                  //                 fontFamily:
                                                  //                     phetsarath)),
                                                  //       )
                                                  //ຄົນຂາຍ
                                                  // :
                                                  reportsale.billnumberselermd
                                                          .isEmpty
                                                      ? const SizedBox(
                                                          width:
                                                              double.infinity,
                                                          height: 415,
                                                          child: ShowNullData(
                                                            height: 150,
                                                            width: 150,
                                                          ),
                                                        )
                                                      : reportsale.onloadingListbill
                                                                  .value ==
                                                              "200"
                                                          ? Expanded(
                                                              child: Container(
                                                              color: colorwhite,
                                                              width: double
                                                                  .infinity,
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
                                                                            label:
                                                                                Text("ລຳດັບ", style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                                        DataColumn(
                                                                            label:
                                                                                Text("ເລກທີບິນ", style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                                        DataColumn(
                                                                            label:
                                                                                Text("ວັນທີຂາຍ", style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                                        DataColumn(
                                                                            label:
                                                                                Text("ລະຫັດຄົນຂາຍ", style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                                        DataColumn(
                                                                            label:
                                                                                Text("ລະຫັດເຄື່ອງ", style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                                        DataColumn(
                                                                            label:
                                                                                Text("ຈຳນວນ", style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                                      ],
                                                                      rowsPerPage:
                                                                          6,
                                                                      // initialFirstRowIndex: 1,
                                                                      source: BillNumberseller(
                                                                          reportData: reportsale
                                                                              .billnumberselermd,
                                                                          context:
                                                                              context)),
                                                            ))
                                                          : const SizedBox(
                                                              width: double
                                                                  .infinity,
                                                              height: 415,
                                                              child:
                                                                  ShowNullData(
                                                                height: 150,
                                                                width: 150,
                                                              ),
                                                            )
                                                  ///////////////////// ລາຍການບິນຍົກເລີກ /////////////////
                                                  // : reportsale.bill == "ເລກບິນ"
                                                  //     ? reportsale
                                                  //             .cancelbillnumbermd
                                                  //             .isEmpty
                                                  //         ? Center(
                                                  //             child: Text(
                                                  //                 "ຂໍ້ມູນວ່າງເປົ່າ. . .",
                                                  //                 style: TextStyle(
                                                  //                     color:
                                                  //                         colorred,
                                                  //                     fontWeight:
                                                  //                         FontWeight
                                                  //                             .bold,
                                                  //                     fontSize:
                                                  //                         fontmenu,
                                                  //                     fontFamily:
                                                  //                         phetsarath)),
                                                  //           )
                                                  //         : reportsale.onloading
                                                  //                     .value ==
                                                  //                 "200"
                                                  //             ? Expanded(
                                                  //                 child:
                                                  //                     Container(
                                                  //                         color:
                                                  //                             colorwhite,
                                                  //                         width: double
                                                  //                             .infinity,
                                                  //                         child:
                                                  //                             PaginatedDataTable(
                                                  //                           showCheckboxColumn:
                                                  //                               false,
                                                  //                           showFirstLastButtons:
                                                  //                               true,
                                                  //                           columnSpacing:
                                                  //                               defaultPadding,
                                                  //                           columns: [
                                                  //                             DataColumn(label: Text("ເລກທີບິນ", style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                  //                             DataColumn(label: Text("ວັນທີຂາຍ", style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                  //                             DataColumn(label: Text("ລະຫັດຄົນຂາຍ", style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                  //                             DataColumn(label: Text("ລະຫັດເຄື່ອງ", style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                  //                             DataColumn(label: Text("ຈຳນວນ", style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                  //                             DataColumn(label: Text("ວັນທີຍົກເລີກ", style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                  //                             DataColumn(label: Text("ຜູ້ຍົກເລີກ", style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                  //                           ],
                                                  //                           rowsPerPage:
                                                  //                               9,
                                                  //                           source: CancelBillNumber(
                                                  //                               reportData: reportsale.cancelbillnumbermd,
                                                  //                               context: context),
                                                  //                         )))
                                                  //             : Center(
                                                  //                 child: Text(
                                                  //                     "ຂໍ້ມູນວ່າງເປົ່າ. . .",
                                                  //                     style: TextStyle(
                                                  //                         color:
                                                  //                             colorred,
                                                  //                         fontWeight:
                                                  //                             FontWeight
                                                  //                                 .bold,
                                                  //                         fontSize:
                                                  //                             fontmenu,
                                                  //                         fontFamily:
                                                  //                             phetsarath)),
                                                  //               )
                                                  //ຄົນຂາຍ
                                                  // : reportsale
                                                  //         .cancelbillnumberselermd
                                                  //         .isEmpty
                                                  //     ? Center(
                                                  //         child: Text(
                                                  //             "ຂໍ້ມູນວ່າງເປົ່າ. . .",
                                                  //             style: TextStyle(
                                                  //                 color:
                                                  //                     colorred,
                                                  //                 fontWeight:
                                                  //                     FontWeight
                                                  //                         .bold,
                                                  //                 fontSize:
                                                  //                     fontmenu,
                                                  //                 fontFamily:
                                                  //                     phetsarath)),
                                                  //       )
                                                  //     : reportsale.onloading
                                                  //                 .value ==
                                                  //             "200"
                                                  //         ? Expanded(
                                                  //             child: Container(
                                                  //                 color: colorwhite,
                                                  //                 width: double.infinity,
                                                  //                 child: PaginatedDataTable(
                                                  //                   showCheckboxColumn:
                                                  //                       false,
                                                  //                   showFirstLastButtons:
                                                  //                       true,
                                                  //                   columnSpacing:
                                                  //                       defaultPadding,
                                                  //                   columns: [
                                                  //                     DataColumn(
                                                  //                         label:
                                                  //                             Text("ເລກທີບິນ", style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                  //                     DataColumn(
                                                  //                         label:
                                                  //                             Text("ວັນທີຂາຍ", style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                  //                     DataColumn(
                                                  //                         label:
                                                  //                             Text("ລະຫັດຄົນຂາຍ", style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                  //                     DataColumn(
                                                  //                         label:
                                                  //                             Text("ລະຫັດເຄື່ອງ", style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                  //                     DataColumn(
                                                  //                         label:
                                                  //                             Text("ຈຳນວນ", style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                  //                     DataColumn(
                                                  //                         label:
                                                  //                             Text("ວັນທີຍົກເລີກ", style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                  //                     DataColumn(
                                                  //                         label:
                                                  //                             Text("ຜູ້ຍົກເລີກ", style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                  //                   ],
                                                  //                   rowsPerPage:
                                                  //                       9,
                                                  //                   source: CancelBillNumber(
                                                  //                       reportData: reportsale
                                                  //                           .cancelbillnumberselermd,
                                                  //                       context:
                                                  //                           context),
                                                  //                 )))
                                                  //         : Center(
                                                  //             child: Text(
                                                  //                 "ຂໍ້ມູນວ່າງເປົ່າ. . .",
                                                  //                 style: TextStyle(
                                                  //                     color:
                                                  //                         colorred,
                                                  //                     fontWeight:
                                                  //                         FontWeight
                                                  //                             .bold,
                                                  //                     fontSize:
                                                  //                         fontmenu,
                                                  //                     fontFamily:
                                                  //                         phetsarath)),
                                                  //           )
                                                  ///////////////////// ຍົກເລີກບິນ /////////////////
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            color: colorwhite,
                                            width: double.infinity,
                                            height: 460,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text("ລາຍການຂາຍ",
                                                    style: TextStyle(
                                                        color: colordarkblue,
                                                        fontSize: fontmenu,
                                                        fontFamily:
                                                            phetsarath)),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                reportsale.onloadingListbillDetail
                                                            .value ==
                                                        "200"
                                                    ? Expanded(
                                                        child: Container(
                                                          color: colorwhite,
                                                          width:
                                                              double.infinity,
                                                          height: 460,
                                                          child:
                                                              PaginatedDataTable(
                                                            showCheckboxColumn:
                                                                false,
                                                            columnSpacing:
                                                                defaultPadding,
                                                            columns: [
                                                              DataColumn(
                                                                  label: Text(
                                                                      "ເລກ",
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
                                                                      "ຈຳນວນ",
                                                                      style: TextStyle(
                                                                          color:
                                                                              colorblack,
                                                                          fontSize:
                                                                              fontmenu,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontFamily:
                                                                              phetsarath))),
                                                            ],
                                                            rowsPerPage: 6,
                                                            // initialFirstRowIndex: 1,
                                                            source: ListOfBill(
                                                                reportData:
                                                                    reportsale
                                                                        .listofbillmd,
                                                                context:
                                                                    context),
                                                          ),
                                                        ),
                                                      )
                                                    : const Expanded(
                                                        child: SizedBox(
                                                          width:
                                                              double.infinity,
                                                          height: 415,
                                                          child: ShowNullData(
                                                            width: 100,
                                                            height: 100,
                                                          ),
                                                        ),
                                                      ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                              // ລາຍການຍົກເລີກບິນ //////////////////////
                              reportsale.cancelonloading.value != "200"
                                  ? Container()
                                  : Row(
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              color: colorwhite,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 460,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text("ລາຍການບິນຍົກເລີກ",
                                                      style: TextStyle(
                                                          color: colordarkblue,
                                                          fontSize: fontmenu,
                                                          fontFamily:
                                                              phetsarath)),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  // SizedBox(
                                                  //   width: 400,
                                                  //   child: TabBar(
                                                  //     onTap: (value) {
                                                  //       reportsale
                                                  //           .onTap(value.toString());
                                                  //       reportsale.clear();
                                                  //       FocusScope.of(context)
                                                  //           .requestFocus(
                                                  //               reportsale.f2);
                                                  //     },
                                                  //     controller:
                                                  //         reportsale.controller,
                                                  //     tabs: [
                                                  //       Tab(
                                                  //         child: Text("ລາຍການບິນ",
                                                  //             style: TextStyle(
                                                  //                 color:
                                                  //                     colordarkblue,
                                                  //                 fontSize: fontmenu,
                                                  //                 fontFamily:
                                                  //                     phetsarath)),
                                                  //       ),
                                                  //       Tab(
                                                  //         child: Text(
                                                  //             "ລາຍການບິນຍົກເລີກ",
                                                  //             style: TextStyle(
                                                  //                 color:
                                                  //                     colordarkblue,
                                                  //                 fontSize: fontmenu,
                                                  //                 fontFamily:
                                                  //                     phetsarath)),
                                                  //       ),
                                                  //     ],
                                                  //   ),
                                                  // ),
                                                  ///////////////// ລາຍການບິນ //////////
                                                  // reportsale.onTap.value == "0"
                                                  //     //ເລກບິນ
                                                  //     ? reportsale.bill == "ເລກບິນ"
                                                  //         ? reportsale.billnumbermd
                                                  //                 .isEmpty
                                                  //             ? Center(
                                                  //                 child: Text(
                                                  //                     "ຂໍ້ມູນວ່າງເປົ່າ. . .",
                                                  //                     style: TextStyle(
                                                  //                         color:
                                                  //                             colorred,
                                                  //                         fontWeight:
                                                  //                             FontWeight
                                                  //                                 .bold,
                                                  //                         fontSize:
                                                  //                             fontmenu,
                                                  //                         fontFamily:
                                                  //                             phetsarath)),
                                                  //               )
                                                  //             : reportsale.onloading.value ==
                                                  //                     "200"
                                                  //                 ? Expanded(
                                                  //                     child:
                                                  //                         Container(
                                                  //                     color:
                                                  //                         colorwhite,
                                                  //                     width: double
                                                  //                         .infinity,
                                                  //                     child:
                                                  //                         PaginatedDataTable(
                                                  //                             showCheckboxColumn:
                                                  //                                 false,
                                                  //                             showFirstLastButtons:
                                                  //                                 true,
                                                  //                             columnSpacing:
                                                  //                                 defaultPadding,
                                                  //                             columns: [
                                                  //                               DataColumn(
                                                  //                                   label: Text("ລຳດັບ", style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                  //                               DataColumn(
                                                  //                                   label: Text("ເລກທີບິນ", style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                  //                               DataColumn(
                                                  //                                   label: Text("ວັນທີຂາຍ", style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                  //                               DataColumn(
                                                  //                                   label: Text("ລະຫັດຄົນຂາຍ", style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                  //                               DataColumn(
                                                  //                                   label: Text("ລະຫັດເຄື່ອງ", style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                  //                               DataColumn(
                                                  //                                   label: Text("ຈຳນວນ", style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                  //                             ],
                                                  //                             rowsPerPage:
                                                  //                                 9,
                                                  //                             source: BillNumber(
                                                  //                                 reportData:
                                                  //                                     reportsale.billnumbermd,
                                                  //                                 context: context)),
                                                  //                   ))
                                                  //                 : Center(
                                                  //                     child: Text(
                                                  //                         "ຂໍ້ມູນວ່າງເປົ່າ. . .",
                                                  //                         style: TextStyle(
                                                  //                             color:
                                                  //                                 colorred,
                                                  //                             fontWeight:
                                                  //                                 FontWeight
                                                  //                                     .bold,
                                                  //                             fontSize:
                                                  //                                 fontmenu,
                                                  //                             fontFamily:
                                                  //                                 phetsarath)),
                                                  //                   )
                                                  //         //ຄົນຂາຍ
                                                  //         :
                                                  //      reportsale
                                                  //             .billnumberselermd
                                                  //             .isEmpty
                                                  //         ? Center(
                                                  //             child: Text(
                                                  //                 "ຂໍ້ມູນວ່າງເປົ່າ. . .",
                                                  //                 style: TextStyle(
                                                  //                     color:
                                                  //                         colorred,
                                                  //                     fontWeight:
                                                  //                         FontWeight
                                                  //                             .bold,
                                                  //                     fontSize:
                                                  //                         fontmenu,
                                                  //                     fontFamily:
                                                  //                         phetsarath)),
                                                  //           )
                                                  //         : reportsale.onloading.value ==
                                                  //                 "200"
                                                  //             ? Expanded(
                                                  //                 child:
                                                  //                     Container(
                                                  //                 color:
                                                  //                     colorwhite,
                                                  //                 width: double
                                                  //                     .infinity,
                                                  //                 child:
                                                  //                     PaginatedDataTable(
                                                  //                         showCheckboxColumn:
                                                  //                             false,
                                                  //                         showFirstLastButtons:
                                                  //                             true,
                                                  //                         columnSpacing:
                                                  //                             defaultPadding,
                                                  //                         columns: [
                                                  //                           DataColumn(
                                                  //                               label: Text("ລຳດັບ", style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                  //                           DataColumn(
                                                  //                               label: Text("ເລກທີບິນ", style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                  //                           DataColumn(
                                                  //                               label: Text("ວັນທີຂາຍ", style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                  //                           DataColumn(
                                                  //                               label: Text("ລະຫັດຄົນຂາຍ", style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                  //                           DataColumn(
                                                  //                               label: Text("ລະຫັດເຄື່ອງ", style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                  //                           DataColumn(
                                                  //                               label: Text("ຈຳນວນ", style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                  //                         ],
                                                  //                         rowsPerPage:
                                                  //                             9,
                                                  //                         source: BillNumberseller(
                                                  //                             reportData:
                                                  //                                 reportsale.billnumberselermd,
                                                  //                             context: context)),
                                                  //               ))
                                                  //             : Center(
                                                  //                 child: Text(
                                                  //                     "ຂໍ້ມູນວ່າງເປົ່າ. . .",
                                                  //                     style: TextStyle(
                                                  //                         color:
                                                  //                             colorred,
                                                  //                         fontWeight:
                                                  //                             FontWeight
                                                  //                                 .bold,
                                                  //                         fontSize:
                                                  //                             fontmenu,
                                                  //                         fontFamily:
                                                  //                             phetsarath)),
                                                  //               )
                                                  // ///////////////////// ລາຍການບິນຍົກເລີກ /////////////////
                                                  // : reportsale.bill == "ເລກບິນ"
                                                  //     ?
                                                  // reportsale
                                                  //         .cancelbillnumbermd.isEmpty
                                                  //     ? Center(
                                                  //         child: Text(
                                                  //             "ຂໍ້ມູນວ່າງເປົ່າ. . .",
                                                  //             style: TextStyle(
                                                  //                 color: colorred,
                                                  //                 fontWeight:
                                                  //                     FontWeight.bold,
                                                  //                 fontSize: fontmenu,
                                                  //                 fontFamily:
                                                  //                     phetsarath)),
                                                  //       )
                                                  //     :
                                                  // reportsale.onloading.value == "200"
                                                  //     ? Expanded(
                                                  //         child: Container(
                                                  //             color: colorwhite,
                                                  //             width: double.infinity,
                                                  //             child:
                                                  //                 PaginatedDataTable(
                                                  //               showCheckboxColumn:
                                                  //                   false,
                                                  //               showFirstLastButtons:
                                                  //                   true,
                                                  //               columnSpacing:
                                                  //                   defaultPadding,
                                                  //               columns: [
                                                  //                 DataColumn(
                                                  //                     label: Text(
                                                  //                         "ເລກທີບິນ",
                                                  //                         style: TextStyle(
                                                  //                             color:
                                                  //                                 colorblack,
                                                  //                             fontSize:
                                                  //                                 fontmenu,
                                                  //                             fontWeight:
                                                  //                                 FontWeight
                                                  //                                     .bold,
                                                  //                             fontFamily:
                                                  //                                 phetsarath))),
                                                  //                 DataColumn(
                                                  //                     label: Text(
                                                  //                         "ວັນທີຂາຍ",
                                                  //                         style: TextStyle(
                                                  //                             color:
                                                  //                                 colorblack,
                                                  //                             fontSize:
                                                  //                                 fontmenu,
                                                  //                             fontWeight:
                                                  //                                 FontWeight
                                                  //                                     .bold,
                                                  //                             fontFamily:
                                                  //                                 phetsarath))),
                                                  //                 DataColumn(
                                                  //                     label: Text(
                                                  //                         "ລະຫັດຄົນຂາຍ",
                                                  //                         style: TextStyle(
                                                  //                             color:
                                                  //                                 colorblack,
                                                  //                             fontSize:
                                                  //                                 fontmenu,
                                                  //                             fontWeight:
                                                  //                                 FontWeight
                                                  //                                     .bold,
                                                  //                             fontFamily:
                                                  //                                 phetsarath))),
                                                  //                 DataColumn(
                                                  //                     label: Text(
                                                  //                         "ລະຫັດເຄື່ອງ",
                                                  //                         style: TextStyle(
                                                  //                             color:
                                                  //                                 colorblack,
                                                  //                             fontSize:
                                                  //                                 fontmenu,
                                                  //                             fontWeight:
                                                  //                                 FontWeight
                                                  //                                     .bold,
                                                  //                             fontFamily:
                                                  //                                 phetsarath))),
                                                  //                 DataColumn(
                                                  //                     label: Text(
                                                  //                         "ຈຳນວນ",
                                                  //                         style: TextStyle(
                                                  //                             color:
                                                  //                                 colorblack,
                                                  //                             fontSize:
                                                  //                                 fontmenu,
                                                  //                             fontWeight:
                                                  //                                 FontWeight
                                                  //                                     .bold,
                                                  //                             fontFamily:
                                                  //                                 phetsarath))),
                                                  //                 DataColumn(
                                                  //                     label: Text(
                                                  //                         "ວັນທີຍົກເລີກ",
                                                  //                         style: TextStyle(
                                                  //                             color:
                                                  //                                 colorblack,
                                                  //                             fontSize:
                                                  //                                 fontmenu,
                                                  //                             fontWeight:
                                                  //                                 FontWeight
                                                  //                                     .bold,
                                                  //                             fontFamily:
                                                  //                                 phetsarath))),
                                                  //                 DataColumn(
                                                  //                     label: Text(
                                                  //                         "ຜູ້ຍົກເລີກ",
                                                  //                         style: TextStyle(
                                                  //                             color:
                                                  //                                 colorblack,
                                                  //                             fontSize:
                                                  //                                 fontmenu,
                                                  //                             fontWeight:
                                                  //                                 FontWeight
                                                  //                                     .bold,
                                                  //                             fontFamily:
                                                  //                                 phetsarath))),
                                                  //               ],
                                                  //               rowsPerPage: 7,
                                                  //               source: CancelBillNumber(
                                                  //                   reportData: reportsale
                                                  //                       .cancelbillnumbermd,
                                                  //                   context: context),
                                                  //             )))
                                                  //     : Center(
                                                  //         child: Text(
                                                  //             "ຂໍ້ມູນວ່າງເປົ່າ. . .",
                                                  //             style: TextStyle(
                                                  //                 color: colorred,
                                                  //                 fontWeight:
                                                  //                     FontWeight.bold,
                                                  //                 fontSize: fontmenu,
                                                  //                 fontFamily:
                                                  //                     phetsarath)),
                                                  //       )
                                                  //ຄົນຂາຍ
                                                  // :
                                                  reportsale
                                                          .cancelbillnumberselermd
                                                          .isEmpty
                                                      ? const SizedBox(
                                                          width:
                                                              double.infinity,
                                                          height: 415,
                                                          child: ShowNullData(
                                                            width: 150,
                                                            height: 150,
                                                          ),
                                                        )
                                                      : reportsale.cancelonloading
                                                                  .value ==
                                                              "200"
                                                          ? Expanded(
                                                              child: Container(
                                                                  color:
                                                                      colorwhite,
                                                                  width: double
                                                                      .infinity,
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
                                                                              style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                                      DataColumn(
                                                                          label: Text(
                                                                              "ເລກທີບິນ",
                                                                              style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                                      DataColumn(
                                                                          label: Text(
                                                                              "ວັນທີຂາຍ",
                                                                              style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                                      DataColumn(
                                                                          label: Text(
                                                                              "ລະຫັດຄົນຂາຍ",
                                                                              style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                                      DataColumn(
                                                                          label: Text(
                                                                              "ລະຫັດເຄື່ອງ",
                                                                              style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                                      DataColumn(
                                                                          label: Text(
                                                                              "ຈຳນວນ",
                                                                              style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                                      DataColumn(
                                                                          label: Text(
                                                                              "ວັນທີຍົກເລີກ",
                                                                              style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                                      DataColumn(
                                                                          label: Text(
                                                                              "ຜູ້ຍົກເລີກ",
                                                                              style: TextStyle(color: colorblack, fontSize: fontmenu, fontWeight: FontWeight.bold, fontFamily: phetsarath))),
                                                                    ],
                                                                    rowsPerPage:
                                                                        6,
                                                                    // initialFirstRowIndex: 1,
                                                                    source: CancelBillNumber(
                                                                        reportData:
                                                                            reportsale
                                                                                .cancelbillnumberselermd,
                                                                        context:
                                                                            context),
                                                                  )))
                                                          : const SizedBox(
                                                              width: double
                                                                  .infinity,
                                                              height: 415,
                                                              child:
                                                                  ShowNullData(
                                                                width: 150,
                                                                height: 150,
                                                              ),
                                                            )
                                                  ///////////////////// ຍົກເລີກບິນ /////////////////
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            color: colorwhite,
                                            width: double.infinity,
                                            height: 460,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text("ລາຍການຂາຍ",
                                                    style: TextStyle(
                                                        color: colordarkblue,
                                                        fontSize: fontmenu,
                                                        fontFamily:
                                                            phetsarath)),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                reportsale.onloadingcancel
                                                            .value ==
                                                        "200"
                                                    ? Expanded(
                                                        child: Container(
                                                          color: colorwhite,
                                                          width:
                                                              double.infinity,
                                                          height: 460,
                                                          child:
                                                              PaginatedDataTable(
                                                            showCheckboxColumn:
                                                                false,
                                                            columnSpacing:
                                                                defaultPadding,
                                                            columns: [
                                                              DataColumn(
                                                                  label: Text(
                                                                      "ເລກ",
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
                                                                      "ຈຳນວນ",
                                                                      style: TextStyle(
                                                                          color:
                                                                              colorblack,
                                                                          fontSize:
                                                                              fontmenu,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontFamily:
                                                                              phetsarath))),
                                                            ],
                                                            rowsPerPage: 6,
                                                            // initialFirstRowIndex: 1,
                                                            source: ListOfBillcancel(
                                                                reportData:
                                                                    reportsale
                                                                        .listofbillcancelbillmd,
                                                                context:
                                                                    context),
                                                          ),
                                                        ),
                                                      )
                                                    : const Expanded(
                                                        child: SizedBox(
                                                          width:
                                                              double.infinity,
                                                          height: 415,
                                                          child: ShowNullData(
                                                            width: 100,
                                                            height: 100,
                                                          ),
                                                        ),
                                                      ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
    );
  }
}

class CancelBillNumber extends DataTableSource {
  CancelBillNumber(
      {@required List<CancelbillNumberMd> reportData, BuildContext context})
      : _reportData = reportData,
        _context = context,
        assert(reportData != null);
  final List<CancelbillNumberMd> _reportData;
  final BuildContext _context;
  bool get isRowCountApproximate => false;
  int get rowCount => _reportData.length;
  int get selectedRowCount => 0;
  ReportSaleCTR report = Get.put(ReportSaleCTR());
  DataRow getRow(int index) {
    return DataRow(
        onSelectChanged: (value) {
          if (_reportData[index].billNumber.toString() != "") {
            report.txtbill.clear();
            report
                .getlcancelistofbill(_reportData[index].billNumber.toString(),
                    report.period.value)
                .then((value) => report.onloadingcancel(value));
            report.onloadingcancel("");
          }
        },
        cells: [
          DataCell(
            Text(_reportData[index].row ?? "ວ່າງເປົ່າ",
                style: TextStyle(
                    color: colorblack,
                    fontSize: fontgeneral,
                    fontFamily: phetsarath)),
          ),
          DataCell(
            Text(
                _reportData[index].billNumber == ""
                    ? "ວ່າງເປົ່າ"
                    : _reportData[index].billNumber,
                style: TextStyle(
                    color: colorblack,
                    fontSize: fontgeneral,
                    fontFamily: phetsarath)),
          ),
          DataCell(Text(
              _reportData[index].dateBill == ""
                  ? "ວ່າງເປົ່າ"
                  : _reportData[index].dateBill +
                      " " +
                      _reportData[index].timeBill,
              style: TextStyle(
                  color: colorblack,
                  fontSize: fontgeneral,
                  fontFamily: phetsarath))),
          DataCell(Text(
              _reportData[index].sellerId == ""
                  ? "ວ່າງເປົ່າ"
                  : _reportData[index].sellerId,
              style: TextStyle(
                  color: colorblack,
                  fontSize: fontgeneral,
                  fontFamily: phetsarath))),
          DataCell(Text(
              _reportData[index].deviceNumber.toString() == ""
                  ? "ວ່າງເປົ່າ"
                  : _reportData[index].deviceNumber.toString(),
              style: TextStyle(
                  color: colorblack,
                  fontSize: fontgeneral,
                  fontFamily: phetsarath))),
          DataCell(Text(
              _reportData[index].billPrice.toString() == ""
                  ? "ວ່າງເປົ່າ"
                  : Numberformated.formated
                      .format(_reportData[index].billPrice),
              style: TextStyle(
                  color: colorblack,
                  fontSize: fontgeneral,
                  fontFamily: phetsarath))),
          DataCell(Text(
              _reportData[index].dateCancel == ""
                  ? "ວ່າງເປົ່າ"
                  : _reportData[index].dateCancel +
                      " " +
                      _reportData[index].timeCancel,
              style: TextStyle(
                  color: colorblack,
                  fontSize: fontgeneral,
                  fontFamily: phetsarath))),
          DataCell(Text(
              _reportData[index].cancelBy == ""
                  ? "ວ່າງເປົ່າ"
                  : _reportData[index].cancelBy,
              style: TextStyle(
                  color: colorblack,
                  fontSize: fontgeneral,
                  fontFamily: phetsarath))),
        ]);
  }
}

class BillNumberseller extends DataTableSource {
  BillNumberseller(
      {@required List<BillNumberSellerMd> reportData, BuildContext context})
      : _reportData = reportData,
        _context = context,
        assert(reportData != null);
  final List<BillNumberSellerMd> _reportData;
  final BuildContext _context;
  bool get isRowCountApproximate => false;
  int get rowCount => _reportData.length;
  int get selectedRowCount => 0;
  ReportSaleCTR report = Get.put(ReportSaleCTR());
  DataRow getRow(int index) {
    return DataRow(
        onSelectChanged: (value) {
          if (_reportData[index].billNumber.toString() != "") {
            report.txtbill.text = _reportData[index].billNumber.toString();
            report
                .getlistofbill(_reportData[index].billNumber.toString(),
                    report.period.value)
                .then((value) => report.onloadingListbillDetail(value));
            report.onloadingListbillDetail("");
          }
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
              _reportData[index].billNumber == ""
                  ? "ວ່າງເປົ່າ"
                  : _reportData[index].billNumber,
              style: TextStyle(
                  color: colorblack,
                  fontSize: fontgeneral,
                  fontFamily: phetsarath))),
          DataCell(Text(
              _reportData[index].dateBill.toString() == ""
                  ? "ວ່າງເປົ່າ"
                  : DateFormat("dd/MM/yyyy")
                          .format(_reportData[index].dateBill) +
                      " ${_reportData[index].timeBill}",
              style: TextStyle(
                  color: colorblack,
                  fontSize: fontgeneral,
                  fontFamily: phetsarath))),
          DataCell(Text(
              _reportData[index].sellerId.toString() == ""
                  ? "ວ່າງເປົ່າ"
                  : _reportData[index].sellerId.toString(),
              style: TextStyle(
                  color: colorblack,
                  fontSize: fontgeneral,
                  fontFamily: phetsarath))),
          DataCell(Text(
              _reportData[index].deviceNumber.toString() == ""
                  ? "ວ່າງເປົ່າ"
                  : _reportData[index].deviceNumber.toString(),
              style: TextStyle(
                  color: colorblack,
                  fontSize: fontgeneral,
                  fontFamily: phetsarath))),
          DataCell(Text(
              _reportData[index].billPrice.toString() == ""
                  ? "ວ່າງເປົ່າ"
                  : Numberformated.formated
                      .format(_reportData[index].billPrice),
              style: TextStyle(
                  color: colorblack,
                  fontSize: fontgeneral,
                  fontFamily: phetsarath))),
        ]);
  }
}

// class BillNumber extends DataTableSource {
//   BillNumber({@required List<BillNumberMd> reportData, BuildContext context})
//       : _reportData = reportData,
//         _context = context,
//         assert(reportData != null);
//   final List<BillNumberMd> _reportData;
//   final BuildContext _context;
//   bool get isRowCountApproximate => false;
//   int get rowCount => _reportData.length;
//   int get selectedRowCount => 0;
//   ReportSaleCTR report = Get.put(ReportSaleCTR());
//   DataRow getRow(int index) {
//     return DataRow(
//         onSelectChanged: (value) {
//           if (_reportData[index].billNumber != "") {
//             report.txtbill.text = _reportData[index].billNumber.toString();
//             report
//                 .getlistofbill(
//                     _reportData[index].billNumber, report.period.value)
//                 .then((value) => report.onloadingbill(value));
//             report.onloadingbill("");
//           }
//         },
//         cells: [
//           DataCell(
//             Text(index.toString(),
//                 style: TextStyle(
//                     color: colorblack,
//                     fontSize: fontgeneral,
//                     fontFamily: phetsarath)),
//           ),
//           DataCell(Text(
//               _reportData[index].billNumber == ""
//                   ? "ວ່າງເປົ່າ"
//                   : _reportData[index].billNumber,
//               style: TextStyle(
//                   color: colorblack,
//                   fontSize: fontgeneral,
//                   fontFamily: phetsarath))),
//           DataCell(Text(
//               _reportData[index].dateBill.toString() == ""
//                   ? "ວ່າງເປົ່າ"
//                   : DateFormat("dd/MM/yyyy hh:mm")
//                       .format(_reportData[index].dateBill),
//               style: TextStyle(
//                   color: colorblack,
//                   fontSize: fontgeneral,
//                   fontFamily: phetsarath))),
//           DataCell(Text(
//               _reportData[index].sellerId.toString() == ""
//                   ? "ວ່າງເປົ່າ"
//                   : _reportData[index].sellerId.toString(),
//               style: TextStyle(
//                   color: colorblack,
//                   fontSize: fontgeneral,
//                   fontFamily: phetsarath))),
//           DataCell(Text(
//               _reportData[index].deviceNumber.toString() == ""
//                   ? "ວ່າງເປົ່າ"
//                   : _reportData[index].deviceNumber.toString(),
//               style: TextStyle(
//                   color: colorblack,
//                   fontSize: fontgeneral,
//                   fontFamily: phetsarath))),
//           DataCell(Text(
//               _reportData[index].billPrice.toString() == ""
//                   ? "ວ່າງເປົ່າ"
//                   : Numberformated.formated
//                       .format(_reportData[index].billPrice),
//               style: TextStyle(
//                   color: colorblack,
//                   fontSize: fontgeneral,
//                   fontFamily: phetsarath))),
//         ]);
//   }
// }
class ListOfBillcancel extends DataTableSource {
  ListOfBillcancel(
      {@required List<ListOfbillcanceMd> reportData, BuildContext context})
      : _reportData = reportData,
        _context = context,
        assert(reportData != null);
  final List<ListOfbillcanceMd> _reportData;
  final BuildContext _context;
  bool get isRowCountApproximate => false;
  int get rowCount => _reportData.length;
  int get selectedRowCount => 0;
  DataRow getRow(int index) {
    return DataRow(onSelectChanged: (value) {}, cells: [
      DataCell(Text(
          _reportData[index].lotteryNumber == ""
              ? "ວ່າງເປົ່າ"
              : _reportData[index].lotteryNumber,
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          _reportData[index].lotteryPrice.toString() == ""
              ? "ວ່າງເປົ່າ"
              : Numberformated.formated.format(_reportData[index].lotteryPrice),
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
    ]);
  }
}

class ListOfBill extends DataTableSource {
  ListOfBill({@required List<ListofbillMd> reportData, BuildContext context})
      : _reportData = reportData,
        _context = context,
        assert(reportData != null);
  final List<ListofbillMd> _reportData;
  final BuildContext _context;
  bool get isRowCountApproximate => false;
  int get rowCount => _reportData.length;
  int get selectedRowCount => 0;
  DataRow getRow(int index) {
    return DataRow(onSelectChanged: (value) {}, cells: [
      DataCell(Text(
          _reportData[index].lotteryNumber == ""
              ? "ວ່າງເປົ່າ"
              : _reportData[index].lotteryNumber,
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          _reportData[index].lotteryPrice.toString() == ""
              ? "ວ່າງເປົ່າ"
              : Numberformated.formated.format(_reportData[index].lotteryPrice),
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
    ]);
  }
}
