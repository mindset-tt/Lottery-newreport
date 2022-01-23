// ignore_for_file: file_names, annotate_overrides, unused_field
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lotterymanagement/AlertDialogs/CustomDialog.dart';
import 'package:lotterymanagement/Colors/Colors.dart';
import 'package:lotterymanagement/Controllers/See_saling/BlockUserCTR.dart';
import 'package:lotterymanagement/Controllers/Setting/SettingSalerCTR.dart';
import 'package:lotterymanagement/Controllers/Setting/SettingbranchCTR.dart';
import 'package:lotterymanagement/Fonts/Fonts.dart';
import 'package:lotterymanagement/Models/SellerMD.dart';
import 'package:lotterymanagement/Responsive/Responsive.dart';
import 'package:lotterymanagement/UrlRespose/StatusCodeError.dart';
import 'package:lotterymanagement/Widget/AppbarheaderMobile.dart';
import 'package:lotterymanagement/Widget/Button.dart';
import 'package:lotterymanagement/Widget/HttpError.dart';
import 'package:lotterymanagement/Widget/LabelText.dart';
import 'package:lotterymanagement/Widget/PopupDialog.dart';
import 'package:get/get.dart';
import 'package:lotterymanagement/Widget/ShowNullData.dart';

class BlockUser extends StatefulWidget {
  const BlockUser({Key key}) : super(key: key);
  @override
  _BlockUserState createState() => _BlockUserState();
}

class _BlockUserState extends State<BlockUser> {
  BlockUserCTR blockuser = Get.put(BlockUserCTR());
  SettingBranchCTR combobox = Get.put(SettingBranchCTR());
  SettingSalerCTR saler = Get.put(SettingSalerCTR());
  @override
  void initState() {
    blockuser.clear();
    saler.gatallseller().then((value) => saler.onloading(value));
    saler.menu.disable(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => saler.statusCode.value == "error"
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
                          blockuser.txtsearch(blockuser.search.text);
                          blockuser.check = false;
                        },
                        controller: blockuser.search,
                        onTap: () {
                          if (blockuser.search.text != "") {
                            for (int i = 0; i < saler.sellermd.length; i++) {
                              if (saler.sellermd[i].deviceCode.toString() ==
                                      blockuser.search.text ||
                                  saler.sellermd[i].unitName ==
                                      blockuser.search.text) {
                                saler.check = true;
                              }
                            }
                            if (saler.check == false) {
                              CustomDialogs.invalidDialogs(
                                  context, "ບໍ່ພົບຂໍ້ມູນນີ້");
                            }
                          }
                        },
                        hintText: "ຄົ້ນຫາ ເຄື່ອງຂາຍ ຫນ່ວຍຂາຍ",
                      )
                    : AppBar(
                        backgroundColor: colorbackground,
                        title: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: InfoPopup(
                            hintText: "ຄົ້ນຫາ ເຄື່ອງຂາຍ ຫນ່ວຍຂາຍ",
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(50),
                            ],
                            title: "ເບີ່ງຂໍ້ມູນຂາຍ",
                            search: blockuser.search,
                            onChanged: (val) {
                              blockuser.txtsearch(blockuser.search.text);
                              blockuser.check = false;
                            },
                            onTap: () {
                              if (blockuser.search.text != "") {
                                for (int i = 0;
                                    i < saler.sellermd.length;
                                    i++) {
                                  if (saler.sellermd[i].deviceCode.toString() ==
                                          blockuser.search.text ||
                                      saler.sellermd[i].unitName ==
                                          blockuser.search.text) {
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
                                          "Block ຄົນຂາຍ",
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
                                          MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const LabelText(
                                                count: "1",
                                                name: "ສາຂາ",
                                                color: colorblack),
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Container(
                                                width: 400,
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
                                                      BorderRadius.circular(10),
                                                  value: blockuser.branch,
                                                  hint: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20.0),
                                                    child: Text("ສາຂາ",
                                                        style: TextStyle(
                                                            color: colorblack,
                                                            fontSize: fontmenu,
                                                            fontFamily:
                                                                phetsarath)),
                                                  ),
                                                  items: combobox
                                                          .branchmd.isNotEmpty
                                                      ? combobox.branchmd
                                                          .map((document) {
                                                          return DropdownMenuItem(
                                                              value: document
                                                                  .branchId
                                                                  .toString(),
                                                              child: SizedBox(
                                                                height: 30.0,
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          20.0),
                                                                  child: Text(
                                                                      document
                                                                          .branchName,
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
                                                      : null,
                                                  onChanged: (value1) {
                                                    combobox.getallbranch();
                                                    blockuser.branch = value1;
                                                    blockuser.unit = null;
                                                    blockuser
                                                        .getbybranch(value1)
                                                        .then((value) {
                                                      if (value != "200") {
                                                        blockuser
                                                            .selected(value);
                                                      } else {
                                                        blockuser
                                                            .selected(value);
                                                      }
                                                    });
                                                  },
                                                )),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const LabelText(
                                                count: "1",
                                                name: "ຫນ່ວຍຂາຍ",
                                                color: colorblack),
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Container(
                                                width: 400,
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
                                                      BorderRadius.circular(10),
                                                  value: blockuser.unit,
                                                  hint: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20.0),
                                                    child: Text("ຫນ່ວຍຂາຍ",
                                                        style: TextStyle(
                                                            color: colorblack,
                                                            fontSize: fontmenu,
                                                            fontFamily:
                                                                phetsarath)),
                                                  ),
                                                  items: blockuser
                                                              .selected.value ==
                                                          "200"
                                                      ? blockuser.unitmd
                                                          .map((document) {
                                                          return DropdownMenuItem(
                                                              onTap: () {
                                                                blockuser.txtsearch(
                                                                    document
                                                                        .serviceUnitName);
                                                              },
                                                              value: document
                                                                  .suId
                                                                  .toString(),
                                                              child: SizedBox(
                                                                height: 30.0,
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          20.0),
                                                                  child: Text(
                                                                      document
                                                                          .serviceUnitName,
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
                                                      : null,
                                                  onChanged: (value) {
                                                    blockuser.getbybranch(
                                                        blockuser.branch);
                                                    blockuser.unit = value;
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
                                    height: 30,
                                  ),
                                  saler.sellermd.isEmpty
                                      ? const ShowNullData(
                                          height: 150,
                                          width: 150,
                                        )
                                      : saler.onloading.value == "200"
                                          ? Expanded(
                                              child: SingleChildScrollView(
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
                                                                  "ຫນ່ວຍຂາຍ",
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
                                                                  "ສະຖານະ Block",
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
                                                            reportData: blockuser
                                                                        .txtsearch
                                                                        .value ==
                                                                    ""
                                                                ? saler.sellermd
                                                                : saler.sellermd
                                                                    .where((e) =>
                                                                        e.deviceCode
                                                                                .toString() ==
                                                                            blockuser
                                                                                .txtsearch.value ||
                                                                        e.unitName ==
                                                                            blockuser
                                                                                .txtsearch.value ||
                                                                        e.unitName ==
                                                                            blockuser.txtsearch.value)
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
                            height: 1150,
                            color: colorbackground,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Block ຄົນຂາຍ",
                                    style: TextStyle(
                                        fontFamily: phetsarath,
                                        color: colordarkblue,
                                        fontSize: fontmenu,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const LabelText(
                                      count: "1",
                                      name: "ສາຂາ",
                                      color: colorblack),
                                  Container(
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all()),
                                    child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                      borderRadius: BorderRadius.circular(10),
                                      value: blockuser.branch,
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
                                                  value: document.branchId
                                                      .toString(),
                                                  child: SizedBox(
                                                    height: 30.0,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20.0),
                                                      child: Text(
                                                          document.branchName,
                                                          style: TextStyle(
                                                              color: colorblack,
                                                              fontSize:
                                                                  fontmenu,
                                                              fontFamily:
                                                                  phetsarath)),
                                                    ),
                                                  ));
                                            }).toList()
                                          : null,
                                      onChanged: (value1) {
                                        combobox.getallbranch();
                                        blockuser.branch = value1;
                                        blockuser.unit = null;
                                        blockuser
                                            .getbybranch(value1)
                                            .then((value) {
                                          if (value != "200") {
                                            blockuser.selected(value);
                                          } else {
                                            blockuser.selected(value);
                                          }
                                        });
                                      },
                                    )),
                                  ),
                                  const LabelText(
                                      count: "1",
                                      name: "ຫນ່ວຍຂາຍ",
                                      color: colorblack),
                                  Container(
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all()),
                                    child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                      borderRadius: BorderRadius.circular(10),
                                      value: blockuser.unit,
                                      hint: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Text("ຫນ່ວຍຂາຍ",
                                            style: TextStyle(
                                                color: colorblack,
                                                fontSize: fontmenu,
                                                fontFamily: phetsarath)),
                                      ),
                                      items: blockuser.selected.value == "200"
                                          ? blockuser.unitmd.map((document) {
                                              return DropdownMenuItem(
                                                  onTap: () {
                                                    blockuser.txtsearch(document
                                                        .serviceUnitName);
                                                  },
                                                  value:
                                                      document.suId.toString(),
                                                  child: SizedBox(
                                                    height: 30.0,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20.0),
                                                      child: Text(
                                                          document
                                                              .serviceUnitName,
                                                          style: TextStyle(
                                                              color: colorblack,
                                                              fontSize:
                                                                  fontmenu,
                                                              fontFamily:
                                                                  phetsarath)),
                                                    ),
                                                  ));
                                            }).toList()
                                          : null,
                                      onChanged: (value) {
                                        blockuser.getbybranch(blockuser.branch);
                                        blockuser.unit = value;
                                      },
                                    )),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  saler.sellermd.isEmpty
                                      ? const ShowNullData(
                                          height: 100,
                                          width: 100,
                                        )
                                      : saler.onloading.value == "200"
                                          ? Container(
                                              color: colorwhite,
                                              width: double.infinity,
                                              child: PaginatedDataTable(
                                                showCheckboxColumn: false,
                                                showFirstLastButtons: true,
                                                columnSpacing: defaultPadding,
                                                columns: [
                                                  DataColumn(
                                                      label: Text("ລຳດັບ",
                                                          style: TextStyle(
                                                              color: colorblack,
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
                                                              color: colorblack,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize:
                                                                  fontmenu,
                                                              fontFamily:
                                                                  phetsarath))),
                                                  DataColumn(
                                                      label: Text("ຫນ່ວຍຂາຍ",
                                                          style: TextStyle(
                                                              color: colorblack,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize:
                                                                  fontmenu,
                                                              fontFamily:
                                                                  phetsarath))),
                                                  DataColumn(
                                                      label: Text(
                                                          "ສະຖານະ Block",
                                                          style: TextStyle(
                                                              color: colorblack,
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
                                                              color: colorblack,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize:
                                                                  fontmenu,
                                                              fontFamily:
                                                                  phetsarath))),
                                                ],
                                                source: MyDataTable(
                                                    reportData: blockuser
                                                                .txtsearch.value ==
                                                            ""
                                                        ? saler.sellermd
                                                        : saler.sellermd
                                                            .where((e) =>
                                                                e.deviceCode.toString() ==
                                                                    blockuser
                                                                        .txtsearch
                                                                        .value ||
                                                                e.unitName ==
                                                                    blockuser
                                                                        .txtsearch
                                                                        .value ||
                                                                e.unitName ==
                                                                    blockuser
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
                            ),
                          ),
                        ),
                      )));
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
  BlockUserCTR block = Get.put(BlockUserCTR());
  SettingSalerCTR saler = Get.put(SettingSalerCTR());
  String unit, id;
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(
        Text(_reportData[index].row ?? "ວ່າງເປົ່າ",
            style: TextStyle(
                color: colorblack,
                fontSize: fontgeneral,
                fontFamily: phetsarath)),
      ),
      DataCell(Text(_reportData[index].deviceCode.toString(),
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(_reportData[index].unitName ?? "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(
        Text(_reportData[index].usStatus ?? "ວ່າງເປົ່າ",
            style: TextStyle(
                color: _reportData[index].usStatus.toString() == "ໃຊ້ງານ"
                    ? colorgreen
                    : colorred,
                fontSize: fontgeneral,
                fontFamily: phetsarath)),
      ),
      DataCell(Row(
        children: [
          InkWell(
              onTap: () async {
                if (_reportData[index].usStatus == "ຍັງບໍ່ທັນອານຸມັດ") {
                  CustomDialogs.errorDialogs(
                      _context, "ບໍ່ສາມາດ Blocked ຜູ້ໃຊ້ນີ້ໄດ້ !");
                } else {
                  if (_reportData[index].usStatus == "Blocked") {
                    block
                        .onUnBlockuser(_reportData[index].usid.toString())
                        .then((value) {
                      saler
                          .gatallseller()
                          .then((value) => saler.onloading(value));
                    });
                  } else {
                    block
                        .onBlockuser(_reportData[index].usid.toString())
                        .then((value) {
                      saler
                          .gatallseller()
                          .then((value) => saler.onloading(value));
                    });
                  }
                }
              },
              child: _reportData[index].usStatus == "Blocked"
                  ? Image.asset(
                      "assets/icons/onbutton.png",
                    )
                  : Image.asset("assets/icons/offbutton.png")),
          const SizedBox(
            width: 100,
          ),
          Button(
            height: Responsive.isMobile(_context) ? 40 : 35,
            title: "ຍ້າຍຫນ່ວຍ",
            colorstype: colorwhite,
            fontFamily: phetsarath,
            fontSize: fontgeneral,
            onPressed: () async {
              block
                  .getbybranch(_reportData[index].branchId.toString())
                  .then((value) => block.itemselect(value));
              unit = null;
              return showDialog(
                  barrierDismissible: false,
                  context: _context,
                  builder: (context) {
                    return Obx(
                      () => AlertDialog(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        content: Padding(
                          padding: const EdgeInsets.all(2),
                          child: SizedBox(
                            width: 350,
                            height: 220,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("ຍ້າຍຫນ່ວຍ",
                                    style: TextStyle(
                                        color: colorblack,
                                        fontWeight: FontWeight.bold,
                                        fontSize: fontmiddle,
                                        fontFamily: phetsarath)),
                                Container(
                                  width: double.infinity,
                                  height: 1,
                                  color: colorblack,
                                ),
                                Text("ຫນ່ວຍ",
                                    style: TextStyle(
                                        color: colorblack,
                                        fontSize: fontgeneral,
                                        fontFamily: phetsarath)),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Container(
                                    width: 350,
                                    height:
                                        Responsive.isMobile(context) ? 50 : 42,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all()),
                                    child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                      borderRadius: BorderRadius.circular(10),
                                      value: unit,
                                      hint: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Text("ຫນ່ວຍ",
                                            style: TextStyle(
                                                color: colorblack,
                                                fontSize: fontmenu,
                                                fontFamily: phetsarath)),
                                      ),
                                      items: block.itemselect.value == "200"
                                          ? block.unitmd.map((document) {
                                              return DropdownMenuItem(
                                                  value:
                                                      document.suId.toString(),
                                                  child: SizedBox(
                                                    height: 30.0,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20.0),
                                                      child: Text(
                                                          document
                                                              .serviceUnitName,
                                                          style: TextStyle(
                                                              color: colorblack,
                                                              fontSize:
                                                                  fontmenu,
                                                              fontFamily:
                                                                  phetsarath)),
                                                    ),
                                                  ));
                                            }).toList()
                                          : null,
                                      onChanged: (value) {
                                        block
                                            .getbybranch(_reportData[index]
                                                .branchId
                                                .toString())
                                            .then((value) =>
                                                block.itemselect(value));
                                        unit = value;
                                      },
                                    )),
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
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
                                      SizedBox(
                                        width: Responsive.isMobile(context)
                                            ? 20
                                            : 30,
                                      ),
                                      Buttons(
                                        fontWeight: FontWeight.normal,
                                        width: 100,
                                        color: colordarkblue,
                                        colortext: colorwhite,
                                        text: block.onlTab.value == false
                                            ? "ຍ້າຍ"
                                            : "ລໍຖ້າ...",
                                        onPressed: () {
                                          if (block.onlTab.value == false) {
                                            block.onlTab(true);
                                            block
                                                .onMoveuser(
                                                    unit,
                                                    _reportData[index]
                                                        .usid
                                                        .toString())
                                                .then((value) {
                                              if (value == "200") {
                                                block.onloading(value);
                                                saler.gatallseller().then(
                                                    (value) =>
                                                        saler.onloading(value));
                                                Navigator.pop(context);
                                                Get.snackbar(
                                                    "Warning Messages !", "",
                                                    messageText: Text(
                                                        "ສຳເລັດແລ້ວ . . .",
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
                                              } else {
                                                CustomDialogs.errorDialogs(
                                                    context,
                                                    "ເກີດຂຂໍ້ຜິດພາດ !");
                                              }
                                            }).whenComplete(
                                                    () => block.onlTab(false));
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
                      ),
                    );
                  });
            },
          ),
        ],
      )),
    ]);
  }
}
