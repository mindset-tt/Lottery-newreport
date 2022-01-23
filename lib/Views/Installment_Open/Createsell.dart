// ignore_for_file: file_names, annotate_overrides, unused_field
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lotterymanagement/AlertDialogs/CustomDialog.dart';
import 'package:lotterymanagement/Colors/Colors.dart';
import 'package:lotterymanagement/Controllers/Install_Open/CreateSellerCTR.dart';
import 'package:lotterymanagement/Fonts/Fonts.dart';
import 'package:lotterymanagement/Models/PeriodMD.dart';
import 'package:lotterymanagement/Responsive/Responsive.dart';
import 'package:lotterymanagement/UrlRespose/StatusCodeError.dart';
import 'package:lotterymanagement/Widget/AppbarheaderMobile.dart';
import 'package:lotterymanagement/Widget/Button.dart';
import 'package:lotterymanagement/Widget/HttpError.dart';
import 'package:lotterymanagement/Widget/LabelText.dart';
import 'package:lotterymanagement/Widget/Numberformat.dart';
import 'package:lotterymanagement/Widget/PopupDialog.dart';
import 'package:lotterymanagement/Widget/ShowNullData.dart';
import 'package:lotterymanagement/Widget/Textfield.dart';

class CreateSell extends StatefulWidget {
  const CreateSell({Key key}) : super(key: key);
  @override
  _CreateSellState createState() => _CreateSellState();
}

class _CreateSellState extends State<CreateSell> {
  CreateSellerCTR createseller = Get.put(CreateSellerCTR());
  DateTime selectedDate = DateTime.now();
  DateFormat dateonline = DateFormat("dd/MM/yyyy");
  selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {
      selectedDate = picked;
      createseller.datetime.text = dateonline.format(selectedDate);
      // setState(() {
      //   selectedDate = picked;
      //   createseller.datetime.text = dateonline.format(selectedDate);
      // });
    }
  }

  @override
  void initState() {
    createseller.datetime.text = dateonline.format(DateTime.now());
    createseller
        .getCreatesaler()
        .then((value) => createseller.onloading(value));
    createseller.clear();
    createseller.menu.disable(false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => createseller.statusCode.value == "error"
          ? HttpError(
              title: StatusCodeText.httpError,
            )
          : createseller.statusCode.value == "500"
              ? HttpError(
                  title: StatusCodeText.httpError,
                )
              : Scaffold(
                  backgroundColor: colorbackground,
                  appBar: Responsive.isMobile(context)
                      ? HeaderMobile(
                          onChanged: (p0) {
                            createseller.txtsearch(createseller.search.text);
                            createseller.check = false;
                          },
                          controller: createseller.search,
                          onTap: () {
                            if (createseller.search.text != "") {
                              for (int i = 0;
                                  i < createseller.periodmd.length;
                                  i++) {
                                if (createseller.periodmd[i].periodNumber
                                        .toString() ==
                                    createseller.search.text) {
                                  createseller.check = true;
                                }
                              }
                              if (createseller.check == false) {
                                CustomDialogs.invalidDialogs(
                                    context, "ບໍ່ພົບຂໍ້ມູນນີ້");
                              }
                            }
                          },
                          hintText: "ຄົ້ນຫາ ງວດ",
                        )
                      : AppBar(
                          backgroundColor: colorbackground,
                          title: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: InfoPopup(
                              hintText: "ຄົ້ນຫາ ງວດ",
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(50),
                              ],
                              title: "ການຕັ້ງຄ່າ ແລະ ເປີດ",
                              search: createseller.search,
                              onChanged: (val) {
                                createseller
                                    .txtsearch(createseller.search.text);
                                createseller.check = false;
                              },
                              onTap: () {
                                if (createseller.search.text != "") {
                                  for (int i = 0;
                                      i < createseller.periodmd.length;
                                      i++) {
                                    if (createseller.periodmd[i].periodNumber
                                            .toString() ==
                                        createseller.search.text) {
                                      createseller.check = true;
                                    }
                                  }
                                  if (createseller.check == false) {
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Text(
                                          "ສ້າງງວດຈຳຫນ່າຍ",
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
                                              name: "ງວດ",
                                              color: createseller.empty.value ==
                                                      "1"
                                                  ? colorred
                                                  : colorblack,
                                            ),
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
                                                      20),
                                                ],
                                                fontFamily: phetsarath,
                                                obscureText: false,
                                                bordercolor:
                                                    createseller.empty.value ==
                                                            "1"
                                                        ? colorred
                                                        : colordarkblue,
                                                focusNode:
                                                    createseller.empty.value ==
                                                            "1"
                                                        ? createseller.f1
                                                        : createseller.f1,
                                                controller:
                                                    createseller.payment,
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
                                              count: "1",
                                              name: "ວັນທີເລກອອກ",
                                              color: colorblack,
                                            ),
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: SizedBox(
                                                width: 250,
                                                height: 42,
                                                child: TextField(
                                                  controller:
                                                      createseller.datetime,
                                                  readOnly: true,
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          const EdgeInsets
                                                                  .symmetric(
                                                              horizontal: 20),
                                                      border: const OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                      suffixIcon: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            selectDate(context);
                                                          });
                                                        },
                                                        child: const Icon(
                                                          Icons.date_range,
                                                          color: colorblack,
                                                        ),
                                                      )),
                                                  style: TextStyle(
                                                      fontFamily: phetsarath,
                                                      color: colorblack,
                                                      fontSize: fontmenu),
                                                ),
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
                                              name: "ກຳຫນົດຮັບລາງວັນ",
                                              color: createseller.empty.value ==
                                                      "2"
                                                  ? colorred
                                                  : colorblack,
                                            ),
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Textfield(
                                                fontFamily: phetsarath,
                                                obscureText: false,
                                                bordercolor:
                                                    createseller.empty.value ==
                                                            "2"
                                                        ? colorred
                                                        : colordarkblue,
                                                focusNode:
                                                    createseller.empty.value ==
                                                            "2"
                                                        ? createseller.f2
                                                        : createseller.f2,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                  LengthLimitingTextInputFormatter(
                                                      2),
                                                ],
                                                controller:
                                                    createseller.paymentshow,
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
                                              name: "ເວລາປິດ",
                                              color: createseller.empty.value ==
                                                      "3"
                                                  ? colorred
                                                  : colorblack,
                                            ),
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Textfield(
                                                
                                                fontFamily: phetsarath,
                                                obscureText: false,
                                                bordercolor:
                                                    createseller.empty.value ==
                                                            "3"
                                                        ? colorred
                                                        : colordarkblue,
                                                focusNode:
                                                    createseller.empty.value ==
                                                            "3"
                                                        ? createseller.f3
                                                        : createseller.f3,
                                                inputFormatters: [
                                                  Numberformated.maskTime,
                                                  LengthLimitingTextInputFormatter(
                                                      8),
                                                ],
                                                controller:
                                                    createseller.timeopen,
                                                fontWeight: FontWeight.normal,
                                                textInputType:
                                                    TextInputType.number,
                                                size: 150,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  // c2
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Button(
                                    height: 42,
                                    title: createseller.onTap.value == false
                                        ? "ບັນທຶກ"
                                        : "ລໍຖ້າ...",
                                    colorstype: colorwhite,
                                    fontFamily: phetsarath,
                                    fontSize: fontgeneral,
                                    onPressed: () {
                                     
                                      if (createseller.payment.text == "") {
                                        createseller.empty("1");
                                        FocusScope.of(context)
                                            .requestFocus(createseller.f1);
                                      } else if (createseller
                                              .paymentshow.text ==
                                          "") {
                                        createseller.empty("2");
                                        FocusScope.of(context)
                                            .requestFocus(createseller.f2);
                                      } else if (createseller.timeopen.text ==
                                          "") {
                                        createseller.empty("3");
                                        FocusScope.of(context)
                                            .requestFocus(createseller.f3);
                                      }else if (createseller.timeopen.text.length!=8) {
                                        createseller.empty("3");
                                        FocusScope.of(context)
                                            .requestFocus(createseller.f3);
                                      } else {
                                        if (createseller.onTap.value == false) {
                                          createseller.onTap(true);
                                          createseller.empty("");
                                          DateFormat dateonline =
                                              DateFormat("yyyy-MM-dd");
                                          createseller.dateinput.value =
                                              dateonline.format(selectedDate);
                                          createseller
                                              .postCreateSaler(
                                                  createseller.payment.text,
                                                  createseller.dateinput.value,
                                                  createseller.timeopen.text,
                                                  createseller
                                                      .menu.userid.value,
                                                  createseller.paymentshow.text)
                                              .then((value) {
                                            if (value == "201") {
                                              createseller
                                                  .getCreatesaler()
                                                  .then((value) => createseller
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
                                                          fontSize: fontgeneral,
                                                          fontWeight: FontWeight
                                                              .normal)),
                                                  maxWidth: 500,
                                                  backgroundColor: colorwhite,
                                                  snackPosition:
                                                      SnackPosition.TOP,
                                                  icon: const Icon(
                                                    Icons.message,
                                                    color: colorgreen,
                                                  ));
                                              createseller.clear();
                                              FocusScope.of(context)
                                                  .requestFocus(
                                                      createseller.f1);
                                            } else if (value == "401") {
                                              CustomDialogs.errorDialogs(
                                                  context,
                                                  StatusCodeText
                                                      .statusCodeText401);
                                            } else if (value == "403") {
                                              CustomDialogs.errorDialogs(
                                                  context,
                                                  " ງວດນີ້ເປີດຖືກເປີດຢູ່ແລ້ວ !");
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
                                                  createseller.onTap(false));
                                        }
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "ລາຍງານງວດ",
                                    style: TextStyle(
                                        fontFamily: phetsarath,
                                        color: colorblack,
                                        fontSize: fontmenu,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  createseller.periodmd.isEmpty
                                      ? const ShowNullData(
                                          width: 150,
                                          height: 150,
                                        )
                                      : createseller.onloading.value == "200"
                                          ? Expanded(
                                              child: SingleChildScrollView(
                                                child: Container(
                                                  color: colorwhite,
                                                  width: double.infinity,
                                                  child: PaginatedDataTable(
                                                    showCheckboxColumn: false,
                                                    columnSpacing:
                                                        defaultPadding,
                                                    showFirstLastButtons: true,
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
                                                          label: Text("ງວດ",
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
                                                      // DataColumn(
                                                      //     label: Text("ງວດສະແດງ",
                                                      //         style: TextStyle(
                                                      //             color: colorblack,
                                                      //             fontSize: fontmenu,
                                                      //             fontWeight: FontWeight.bold,
                                                      //             fontFamily: phetsarath))),
                                                      DataColumn(
                                                          label: Text(
                                                              "ວັນທີເລກອອກ",
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
                                                          label: Text("ເລກອອກ",
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
                                                          label: Text("ສະຖານະ",
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
                                                          label: Text("ເວລາປິດ",
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
                                                              "ວັນທີສິ້ນສຸດ",
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
                                                          label: Container()),
                                                    ],
                                                    source: MyDataTable(
                                                        reportData: createseller
                                                                    .txtsearch
                                                                    .value ==
                                                                ""
                                                            ? createseller
                                                                .periodmd
                                                            : createseller
                                                                .periodmd
                                                                .where((e) =>
                                                                    e.periodNumber
                                                                        .toString() ==
                                                                    createseller
                                                                        .txtsearch
                                                                        .value)
                                                                .toList(),
                                                        context: context),
                                                    rowsPerPage: 15,
                                                    // initialFirstRowIndex: 1,
                                                  ),
                                                ),
                                              ),
                                            )
                                          : const ShowNullData(
                                              width: 150,
                                              height: 150,
                                            )
                                ],
                              ),
                            ),
                          ),
                        ))
                      :
                      //////////////////////////////////////// Mobile //////////////////////////////////////
                      SafeArea(
                          child: SingleChildScrollView(
                          child: Container(
                            width: double.infinity,
                            height: 1317,
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
                                    "ສ້າງງວດຈຳຫນ່າຍ",
                                    style: TextStyle(
                                        fontFamily: phetsarath,
                                        color: colordarkblue,
                                        fontSize: fontmenu,
                                        fontWeight: FontWeight.bold),
                                  ),

                                  // c1
                                  LabelText(
                                    count: "1",
                                    name: "ງວດ",
                                    color: createseller.empty.value == "1"
                                        ? colorred
                                        : colorblack,
                                  ),

                                  Textfield(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(20),
                                    ],
                                    fontFamily: phetsarath,
                                    obscureText: false,
                                    bordercolor: createseller.empty.value == "1"
                                        ? colorred
                                        : colordarkblue,
                                    focusNode: createseller.empty.value == "1"
                                        ? createseller.f1
                                        : createseller.f1,
                                    controller: createseller.payment,
                                    fontWeight: FontWeight.normal,
                                    textInputType: TextInputType.number,
                                    size: double.infinity,
                                  ),

                                  const LabelText(
                                    count: "1",
                                    name: "ວັນທີເລກອອກ",
                                    color: colorblack,
                                  ),

                                  SizedBox(
                                    width: double.infinity,
                                    height: 50,
                                    child: TextField(
                                      controller: createseller.datetime,
                                      readOnly: true,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 20),
                                          border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          suffixIcon: InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectDate(context);
                                              });
                                            },
                                            child: const Icon(
                                              Icons.date_range,
                                              color: colorblack,
                                            ),
                                          )),
                                      style: TextStyle(
                                          fontFamily: phetsarath,
                                          color: colorblack,
                                          fontSize: fontmenu),
                                    ),
                                  ),

                                  LabelText(
                                    count: "1",
                                    name: "ກຳຫນົດຮັບລາງວັນ",
                                    color: createseller.empty.value == "2"
                                        ? colorred
                                        : colorblack,
                                  ),
                                  Textfield(
                                    fontFamily: phetsarath,
                                    obscureText: false,
                                    bordercolor: createseller.empty.value == "2"
                                        ? colorred
                                        : colordarkblue,
                                    focusNode: createseller.empty.value == "2"
                                        ? createseller.f2
                                        : createseller.f2,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(2),
                                    ],
                                    controller: createseller.paymentshow,
                                    fontWeight: FontWeight.normal,
                                    textInputType: TextInputType.number,
                                    size: double.infinity,
                                  ),

                                  LabelText(
                                    count: "1",
                                    name: "ເວລາປິດ",
                                    color: createseller.empty.value == "3"
                                        ? colorred
                                        : colorblack,
                                  ),

                                  Textfield(
                                    fontFamily: phetsarath,
                                    obscureText: false,
                                    bordercolor: createseller.empty.value == "3"
                                        ? colorred
                                        : colordarkblue,
                                    focusNode: createseller.empty.value == "3"
                                        ? createseller.f3
                                        : createseller.f3,
                                    inputFormatters: [
                                      Numberformated.maskTime,
                                      LengthLimitingTextInputFormatter(8),
                                    ],
                                    controller: createseller.timeopen,
                                    fontWeight: FontWeight.normal,
                                    textInputType: TextInputType.number,
                                    size: double.infinity,
                                  ),
                                  // c2
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Button(
                                    height: 42,
                                    title: createseller.onTap.value == false
                                        ? "ບັນທຶກ"
                                        : "ລໍຖ້າ...",
                                    colorstype: colorwhite,
                                    fontFamily: phetsarath,
                                    fontSize: fontgeneral,
                                    onPressed: () {
                                      if (createseller.payment.text == "") {
                                        createseller.empty("1");
                                        FocusScope.of(context)
                                            .requestFocus(createseller.f1);
                                      } else if (createseller
                                              .paymentshow.text ==
                                          "") {
                                        createseller.empty("2");
                                        FocusScope.of(context)
                                            .requestFocus(createseller.f2);
                                      } else if (createseller.timeopen.text ==
                                          "") {
                                        createseller.empty("3");
                                        FocusScope.of(context)
                                            .requestFocus(createseller.f3);
                                      } else {
                                        if (createseller.onTap.value == false) {
                                          createseller.onTap(true);
                                          createseller.empty("");
                                          DateFormat dateonline =
                                              DateFormat("yyyy-MM-dd");
                                          createseller.dateinput.value =
                                              dateonline.format(selectedDate);
                                          createseller
                                              .postCreateSaler(
                                                  createseller.payment.text,
                                                  createseller.dateinput.value,
                                                  createseller.timeopen.text,
                                                  createseller
                                                      .menu.userid.value,
                                                  createseller.paymentshow.text)
                                              .then((value) {
                                            if (value == "201") {
                                              createseller
                                                  .getCreatesaler()
                                                  .then((value) => createseller
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
                                                          fontSize: fontgeneral,
                                                          fontWeight: FontWeight
                                                              .normal)),
                                                  maxWidth: 500,
                                                  backgroundColor: colorwhite,
                                                  snackPosition:
                                                      SnackPosition.TOP,
                                                  icon: const Icon(
                                                    Icons.message,
                                                    color: colorgreen,
                                                  ));
                                              createseller.clear();
                                              FocusScope.of(context)
                                                  .requestFocus(
                                                      createseller.f1);
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
                                                  createseller.onTap(false));
                                        }
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "ລາຍງານງວດ",
                                    style: TextStyle(
                                        fontFamily: phetsarath,
                                        color: colorblack,
                                        fontSize: fontmenu,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  createseller.periodmd.isEmpty
                                      ? const ShowNullData(
                                          width: 100,
                                          height: 100,
                                        )
                                      : createseller.onloading.value == "200"
                                          ? Container(
                                              color: colorwhite,
                                              width: double.infinity,
                                              child: PaginatedDataTable(
                                                showCheckboxColumn: false,
                                                columnSpacing: defaultPadding,
                                                showFirstLastButtons: true,
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
                                                      label: Text("ງວດ",
                                                          style: TextStyle(
                                                              color: colorblack,
                                                              fontSize:
                                                                  fontmenu,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  phetsarath))),
                                                  // DataColumn(
                                                  //     label: Text("ງວດສະແດງ",
                                                  //         style: TextStyle(
                                                  //             color: colorblack,
                                                  //             fontSize: fontmenu,
                                                  //             fontWeight: FontWeight.bold,
                                                  //             fontFamily: phetsarath))),
                                                  DataColumn(
                                                      label: Text("ວັນທີເລກອອກ",
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
                                                      label: Text("ເລກອອກ",
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
                                                      label: Text("ສະຖານະ",
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
                                                      label: Text("ເວລາປິດ",
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
                                                      label: Text(
                                                          "ວັນທີສິ້ນສຸດ",
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
                                                      label: Container()),
                                                ],
                                                source: MyDataTable(
                                                    reportData: createseller
                                                                .txtsearch
                                                                .value ==
                                                            ""
                                                        ? createseller.periodmd
                                                        : createseller.periodmd
                                                            .where((e) =>
                                                                e.periodNumber
                                                                    .toString() ==
                                                                createseller
                                                                    .txtsearch
                                                                    .value)
                                                            .toList(),
                                                    context: context),
                                                rowsPerPage: 15,
                                                // initialFirstRowIndex: 1,
                                              ),
                                            )
                                          : const ShowNullData(
                                              width: 100,
                                              height: 100,
                                            )
                                ],
                              ),
                            ),
                          ),
                        ))),
    );
  }
}

class MyDataTable extends DataTableSource {
  MyDataTable({@required List<PeriodMd> reportData, BuildContext context})
      : _reportData = reportData,
        _context = context,
        assert(reportData != null);
  final List<PeriodMd> _reportData;
  final BuildContext _context;
  bool get isRowCountApproximate => false;
  int get rowCount => _reportData.length;
  int get selectedRowCount => 0;
  CreateSellerCTR createseller = Get.put(CreateSellerCTR());
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(
        Text(_reportData[index].row ?? "ວ່າງເປົ່າ",
            style: TextStyle(
                color: colorblack,
                fontSize: fontgeneral,
                fontFamily: phetsarath)),
      ),
      DataCell(
        Text(
            _reportData[index].periodNumber == ""
                ? "ວ່າງເປົ່າ"
                : _reportData[index].periodNumber,
            style: TextStyle(
                color: colorblack,
                fontSize: fontgeneral,
                fontFamily: phetsarath)),
      ),
      // DataCell(Text(_reportData[index].onlineId.toString() ?? "ວ່າງເປົ່າ",
      //     style: TextStyle(
      //         color: colorblack,
      //         fontSize: fontgeneral,
      //         fontFamily: phetsarath))),
      DataCell(Text(
          _reportData[index].dateOffline.toString() == ""
              ? "ວ່າງເປົ່າ"
              : DateFormat("dd/MM/yyyy").format(_reportData[index].dateOffline),
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(_reportData[index].lotteryNumber ?? "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          _reportData[index].onlineStatus.toString() == "1"
              ? "ເປີດ"
              :  "ປິດ",
          style: TextStyle(
              color: _reportData[index].onlineStatus.toString() == "1"
                  ? colorgreen
                  :  colorred,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          _reportData[index].timeOffline.toString() == ""
              ? "ວ່າງເປົ່າ"
              : _reportData[index].timeOffline.toString(),
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          _reportData[index].dateEnd.toString() == ""
              ? "ວ່າງເປົ່າ"
              : DateFormat("dd/MM/yyyy").format(_reportData[index].dateEnd),
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(
        // _reportData[index].onlineStatus.toString() != "1"
        //     ? Container()
        //     :
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 350,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                      text:
                                          createseller.onDeleted.value == false
                                              ? "ລົບ"
                                              : "ລໍຖ້າ...",
                                      onPressed: () {
                                        if (createseller.onDeleted.value ==
                                            false) {
                                          createseller.onDeleted(true);
                                          createseller
                                              .deleteCreateSaler(
                                                  _reportData[index]
                                                      .periodNumber
                                                      .toString())
                                              .then((value) {
                                            if (value == "200") {
                                              createseller
                                                  .getCreatesaler()
                                                  .then((value) => createseller
                                                      .onloading(value));
                                              createseller.clear();
                                              FocusScope.of(_context)
                                                  .requestFocus(
                                                      createseller.f1);
                                              createseller.onDeleted(false);
                                              Navigator.of(_context).pop();
                                              Get.snackbar(
                                                  "Warning Messages !", "",
                                                  messageText: Text(
                                                      StatusCodeText
                                                          .statusCodeText200Delete,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              phetsarath,
                                                          color: colorblack,
                                                          fontSize: fontgeneral,
                                                          fontWeight: FontWeight
                                                              .normal)),
                                                  maxWidth: 500,
                                                  backgroundColor: colorwhite,
                                                  snackPosition:
                                                      SnackPosition.TOP,
                                                  icon: const Icon(
                                                    Icons.message,
                                                    color: colorgreen,
                                                  ));
                                            } else if (value == "401") {
                                              createseller.onDeleted(false);
                                              Navigator.of(_context).pop();
                                              CustomDialogs.errorDialogs(
                                                  _context,
                                                  StatusCodeText
                                                      .statusCodeText401);
                                            } else if (value == "403") {
                                              createseller.onDeleted(false);
                                              Navigator.of(_context).pop();
                                              CustomDialogs.errorDialogs(
                                                  _context,
                                                  StatusCodeText
                                                      .statusCodeText403);
                                            } else if (value == "404") {
                                              createseller.onDeleted(false);
                                              Navigator.of(_context).pop();
                                              CustomDialogs.errorDialogs(
                                                  _context,
                                                  StatusCodeText
                                                      .statusCodeText404);
                                            } else {
                                              createseller.onDeleted(false);
                                              Navigator.of(_context).pop();
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
      )
    ]);
  }
}
