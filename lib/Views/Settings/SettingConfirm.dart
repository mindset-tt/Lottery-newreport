// ignore_for_file: file_names, annotate_overrides
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lotterymanagement/AlertDialogs/CustomDialog.dart';
import 'package:lotterymanagement/Colors/Colors.dart';
import 'package:lotterymanagement/Controllers/Setting/SettingConfirmCTR.dart';
import 'package:lotterymanagement/Fonts/Fonts.dart';
import 'package:lotterymanagement/Models/DeviceforauthorMD.dart';
import 'package:lotterymanagement/Responsive/Responsive.dart';
import 'package:lotterymanagement/UrlRespose/StatusCodeError.dart';
import 'package:lotterymanagement/Widget/AppbarheaderMobile.dart';
import 'package:lotterymanagement/Widget/Button.dart';
import 'package:lotterymanagement/Widget/HttpError.dart';
import 'package:lotterymanagement/Widget/PopupDialog.dart';
import 'package:lotterymanagement/Widget/ShowNullData.dart';

class SettingConfirm extends StatefulWidget {
  const SettingConfirm({Key key}) : super(key: key);
  @override
  _SettingConfirmState createState() => _SettingConfirmState();
}

class _SettingConfirmState extends State<SettingConfirm> {
  SettingConfirmCTR confrim = Get.put(SettingConfirmCTR());
  @override
  void initState() {
    confrim.clear();
    confrim.getallDeviceAuth().then((value) => confrim.onloading(value));
    confrim.menu.disable(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => confrim.statusCode.value == "error"
          ? HttpError(
              title: StatusCodeText.httpError,
            )
          : confrim.statusCode.value == "500"
              ? HttpError(
                  title: StatusCodeText.httpError,
                )
              : Scaffold(
                  backgroundColor: colorbackground,
                  appBar: Responsive.isMobile(context)
                      ? const HeaderMobile()
                      : AppBar(
                          backgroundColor: colorbackground,
                          title: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: InfoPopup(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(50),
                              ],
                              title: "ຕັ້ງຄ່າ",
                              search: confrim.search,
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
                                    Text(
                                      "ອະນຸຫມັດເຄື່ອງຂາຍ",
                                      style: TextStyle(
                                          fontFamily: phetsarath,
                                          color: colordarkblue,
                                          fontSize: fontmenu,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "ສະແດງຂໍ້ມູນລາຍການເຄື່ອງ",
                                                style: TextStyle(
                                                    fontFamily: phetsarath,
                                                    color: colorblack,
                                                    fontSize: fontmenu,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Container(
                                                  width: 350,
                                                  height: 42,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(),
                                                      color: colorwhite),
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                          child: DropdownButton(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    value: confrim.machine,
                                                    hint: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20.0),
                                                      child: Text(
                                                          "ເຄື່ອງທັງຫມົດ",
                                                          style: TextStyle(
                                                              color: colorblack,
                                                              fontSize:
                                                                  fontmenu,
                                                              fontFamily:
                                                                  phetsarath)),
                                                    ),
                                                    items: [
                                                      DropdownMenuItem(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20.0),
                                                          child: Text(
                                                              "ເຄື່ອງທັງຫມົດ",
                                                              style: TextStyle(
                                                                  color:
                                                                      colorblack,
                                                                  fontSize:
                                                                      fontmenu,
                                                                  fontFamily:
                                                                      phetsarath)),
                                                        ),
                                                        value: "ເຄື່ອງທັງຫມົດ",
                                                      ),
                                                      DropdownMenuItem(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20.0),
                                                          child: Text("ອານຸມັດ",
                                                              style: TextStyle(
                                                                  color:
                                                                      colorblack,
                                                                  fontSize:
                                                                      fontmenu,
                                                                  fontFamily:
                                                                      phetsarath)),
                                                        ),
                                                        value: "ອານຸມັດ",
                                                      ),
                                                      DropdownMenuItem(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20.0),
                                                          child: Text(
                                                              "ຍັງບໍ່ອານຸມັດ",
                                                              style: TextStyle(
                                                                  color:
                                                                      colorblack,
                                                                  fontSize:
                                                                      fontmenu,
                                                                  fontFamily:
                                                                      phetsarath)),
                                                        ),
                                                        value: "ຍັງບໍ່ອານຸມັດ",
                                                      ),
                                                      DropdownMenuItem(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20.0),
                                                          child: Text("Blocked",
                                                              style: TextStyle(
                                                                  color:
                                                                      colorblack,
                                                                  fontSize:
                                                                      fontmenu,
                                                                  fontFamily:
                                                                      phetsarath)),
                                                        ),
                                                        value: "Blocked",
                                                      ),
                                                    ].toList(),
                                                    onChanged: (value) {
                                                      setState(() {
                                                        confrim.machine = value;
                                                      });
                                                    },
                                                  )),
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
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: 42,
                                        child: TextFormField(
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(
                                                50),
                                          ],
                                          autofocus: true,
                                          onChanged: (value) {
                                            confrim.txtsearch(
                                                confrim.secondsearch.text);
                                          },
                                          controller: confrim.secondsearch,
                                          keyboardType: TextInputType.text,
                                          style: TextStyle(
                                              color: colorblack,
                                              fontSize: fontmenu,
                                              fontFamily: phetsarath,
                                              fontWeight: FontWeight.normal),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                borderSide: const BorderSide(
                                                    color: colorblack)),
                                            suffixIcon: InkWell(
                                                onTap: () {
                                                  if (confrim
                                                          .secondsearch.text !=
                                                      "") {
                                                    for (int i = 0;
                                                        i <
                                                            confrim
                                                                .listdeviceauthor
                                                                .length;
                                                        i++) {
                                                      if (confrim.txtsearch
                                                              .value ==
                                                          confrim
                                                              .listdeviceauthor[
                                                                  i]
                                                              .deviceCode
                                                              .toString()) {
                                                        confrim.check = true;
                                                        break;
                                                      } else {
                                                        confrim.check = false;
                                                        break;
                                                      }
                                                    }
                                                    if (confrim.check ==
                                                        false) {
                                                      CustomDialogs
                                                          .invalidDialogs(
                                                              context,
                                                              "ບໍ່ພົບຂໍ້ມູນນີ້");
                                                    }
                                                  }
                                                },
                                                child: const Icon(
                                                  Icons.search,
                                                  color: colorblack,
                                                )),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 25),
                                            hintText:
                                                "ຄົ້ນຫາ ລະຫັດ ລະຫັດເຄື່ອງຂາຍ",
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: colorblack),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    confrim.listdeviceauthor.isEmpty
                                        ? const ShowNullData(
                                            height: 150,
                                            width: 150,
                                          )
                                        : confrim.onloading.value == "200"
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
                                                                      "ເລກອ້າງອີງ",
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
                                                                      "ລະຫັດເຄື່ອງຂາຍ",
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
                                                                      "ອານຸມັດ",
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
                                                                      "ວັນທີລົງທະບຽນ",
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
                                                                      "",
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
                                                            source: MyDataTable(
                                                                reportData: confrim
                                                                            .machine ==
                                                                        null
                                                                    ? confrim.txtsearch.value ==
                                                                            ""
                                                                        ? confrim
                                                                            .listdeviceauthor
                                                                        : confrim
                                                                            .listdeviceauthor
                                                                            .where((e) =>
                                                                                e.deviceCode ==
                                                                                confrim
                                                                                    .txtsearch.value)
                                                                            .toList()
                                                                    : confrim.machine ==
                                                                            "ເຄື່ອງທັງຫມົດ"
                                                                        ? confrim
                                                                            .listdeviceauthor
                                                                        : confrim
                                                                            .listdeviceauthor
                                                                            .where((e) =>
                                                                                e.usStatus ==
                                                                                confrim.machine)
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
                              height: 1059,
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
                                      "ອະນຸຫມັດເຄື່ອງຂາຍ",
                                      style: TextStyle(
                                          fontFamily: phetsarath,
                                          color: colordarkblue,
                                          fontSize: fontmenu,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "ສະແດງຂໍ້ມູນລາຍການເຄື່ອງ",
                                      style: TextStyle(
                                          fontFamily: phetsarath,
                                          color: colorblack,
                                          fontSize: fontmenu,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
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
                                        value: confrim.machine,
                                        hint: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20.0),
                                          child: Text("ເຄື່ອງທັງຫມົດ",
                                              style: TextStyle(
                                                  color: colorblack,
                                                  fontSize: fontmenu,
                                                  fontFamily: phetsarath)),
                                        ),
                                        items: [
                                          DropdownMenuItem(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20.0),
                                              child: Text("ເຄື່ອງທັງຫມົດ",
                                                  style: TextStyle(
                                                      color: colorblack,
                                                      fontSize: fontmenu,
                                                      fontFamily: phetsarath)),
                                            ),
                                            value: "ເຄື່ອງທັງຫມົດ",
                                          ),
                                          DropdownMenuItem(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20.0),
                                              child: Text("ອານຸມັດ",
                                                  style: TextStyle(
                                                      color: colorblack,
                                                      fontSize: fontmenu,
                                                      fontFamily: phetsarath)),
                                            ),
                                            value: "ອານຸມັດ",
                                          ),
                                          DropdownMenuItem(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20.0),
                                              child: Text("ຍັງບໍ່ອານຸມັດ",
                                                  style: TextStyle(
                                                      color: colorblack,
                                                      fontSize: fontmenu,
                                                      fontFamily: phetsarath)),
                                            ),
                                            value: "ຍັງບໍ່ອານຸມັດ",
                                          ),
                                          DropdownMenuItem(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20.0),
                                              child: Text("Blocked",
                                                  style: TextStyle(
                                                      color: colorblack,
                                                      fontSize: fontmenu,
                                                      fontFamily: phetsarath)),
                                            ),
                                            value: "Blocked",
                                          ),
                                        ].toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            confrim.machine = value;
                                          });
                                        },
                                      )),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 50,
                                      child: TextFormField(
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(50),
                                        ],
                                        autofocus: true,
                                        onChanged: (value) {
                                          confrim.txtsearch(
                                              confrim.secondsearch.text);
                                        },
                                        controller: confrim.secondsearch,
                                        keyboardType: TextInputType.text,
                                        style: TextStyle(
                                            color: colorblack,
                                            fontSize: fontmenu,
                                            fontFamily: phetsarath,
                                            fontWeight: FontWeight.normal),
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color: colorblack)),
                                          suffixIcon: InkWell(
                                              onTap: () {
                                                if (confrim.secondsearch.text !=
                                                    "") {
                                                  for (int i = 0;
                                                      i <
                                                          confrim
                                                              .listdeviceauthor
                                                              .length;
                                                      i++) {
                                                    if (confrim
                                                            .txtsearch.value ==
                                                        confrim
                                                            .listdeviceauthor[i]
                                                            .deviceCode
                                                            .toString()) {
                                                      confrim.check = true;
                                                      break;
                                                    } else {
                                                      confrim.check = false;
                                                      break;
                                                    }
                                                  }
                                                  if (confrim.check == false) {
                                                    CustomDialogs
                                                        .invalidDialogs(context,
                                                            "ບໍ່ພົບຂໍ້ມູນນີ້");
                                                  }
                                                }
                                              },
                                              child: const Icon(
                                                Icons.search,
                                                color: colorblack,
                                              )),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 25),
                                          hintText:
                                              "ຄົ້ນຫາ ລະຫັດ ລະຫັດເຄື່ອງຂາຍ",
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: colorblack),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    confrim.listdeviceauthor.isEmpty
                                        ? const ShowNullData(
                                            height: 100,
                                            width: 100,
                                          )
                                        : confrim.onloading.value == "200"
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
                                                                  "ເລກອ້າງອີງ",
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
                                                                  "ລະຫັດເຄື່ອງຂາຍ",
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
                                                                  "ອານຸມັດ",
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
                                                                  "ວັນທີລົງທະບຽນ",
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
                                                            reportData: confrim
                                                                        .machine ==
                                                                    null
                                                                ? confrim.txtsearch
                                                                            .value ==
                                                                        ""
                                                                    ? confrim
                                                                        .listdeviceauthor
                                                                    : confrim
                                                                        .listdeviceauthor
                                                                        .where((e) =>
                                                                            e.deviceCode ==
                                                                            confrim
                                                                                .txtsearch.value)
                                                                        .toList()
                                                                : confrim.machine ==
                                                                        "ເຄື່ອງທັງຫມົດ"
                                                                    ? confrim
                                                                        .listdeviceauthor
                                                                    : confrim
                                                                        .listdeviceauthor
                                                                        .where((e) =>
                                                                            e.usStatus ==
                                                                            confrim.machine)
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
  MyDataTable(
      {@required List<DeviceForAuthoriseMd> reportData, BuildContext context})
      : _reportData = reportData,
        _context = context,
        assert(reportData != null);
  final List<DeviceForAuthoriseMd> _reportData;
  final BuildContext _context;
  bool get isRowCountApproximate => false;
  int get rowCount => _reportData.length;
  int get selectedRowCount => 0;
  SettingConfirmCTR confrim = Get.put(SettingConfirmCTR());
  DateFormat date = DateFormat("dd/MM/yyyy");
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
        Text(_reportData[index].deviceNumber.toString() ?? "ວ່າງເປົ່າ",
            style: TextStyle(
                color: colorblack,
                fontSize: fontgeneral,
                fontFamily: phetsarath)),
      ),
      DataCell(Text(_reportData[index].deviceCode.toString() ?? "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(_reportData[index].usStatus ?? "ວ່າງເປົ່າ",
          style: TextStyle(
              color: _reportData[index].usStatus == "ຍັງບໍ່ອານຸມັດ"
                  ? colorred
                  : _reportData[index].usStatus == "Blocked"
                      ? colorred
                      : colorgreen,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(date.format(_reportData[index].dateRegister) ?? "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(
        _reportData[index].usStatus == "ຍັງບໍ່ອານຸມັດ"
            ? Button(
                height: 35,
                title: confrim.onTap.value == false ? "ອານຸມັດ" : "ລໍຖ້າ...",
                colorstype: colorwhite,
                fontFamily: phetsarath,
                fontSize: fontgeneral,
                onPressed: () {
                  if (confrim.onTap.value == false) {
                    confrim.onTap(true);
                    confrim.id = _reportData[index].deviceCode.toString();
                    confrim.confirmdevice(confrim.id).then((value) {
                      if (value == "200") {
                        confrim
                            .getallDeviceAuth()
                            .then((value) => confrim.onloading(value));
                      } else if (value == "401") {
                        Navigator.of(_context).pop();
                        CustomDialogs.errorDialogs(
                            _context, StatusCodeText.statusCodeText401);
                      } else if (value == "403") {
                        Navigator.of(_context).pop();
                        CustomDialogs.errorDialogs(
                            _context, StatusCodeText.statusCodeText403);
                      } else if (value == "404") {
                        Navigator.of(_context).pop();
                        CustomDialogs.errorDialogs(
                            _context, StatusCodeText.statusCodeText404);
                      } else {
                        Navigator.of(_context).pop();
                        CustomDialogs.errorDialogs(
                            _context, StatusCodeText.statusCodeText500);
                      }
                    }).whenComplete(() => confrim.onTap(false));
                  }
                })
            : const Text(""),
      )
    ]);
  }
}
