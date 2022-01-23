// ignore_for_file: file_names, annotate_overrides, unused_field
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:lotterymanagement/AlertDialogs/CustomDialog.dart';
import 'package:lotterymanagement/Colors/Colors.dart';
import 'package:lotterymanagement/Controllers/Install_Open/CreateSellerCTR.dart';
import 'package:lotterymanagement/Controllers/Report/PrintReportCTR.dart';
import 'package:lotterymanagement/Fonts/Fonts.dart';
import 'package:lotterymanagement/Models/ModelReport/ReportBillMD.dart';
import 'package:lotterymanagement/Models/ModelReport/ReportSaleMD.dart';
import 'package:lotterymanagement/Models/ModelReport/ReportWonMD.dart';
import 'package:lotterymanagement/Models/ModelReport/ReportexportMD.dart';
import 'package:lotterymanagement/UrlRespose/StatusCodeError.dart';
import 'package:lotterymanagement/Views/Installment_Open/Quota.dart';
import 'package:lotterymanagement/Views/Money/Award.dart';
import 'package:lotterymanagement/Widget/Button.dart';
import 'package:lotterymanagement/Widget/HttpError.dart';
import 'package:lotterymanagement/Widget/Numberformat.dart';
import 'package:lotterymanagement/Widget/PopupDialog.dart';
import 'package:get/get.dart';
import 'package:lotterymanagement/Widget/ShowNullData.dart';

class PrintReport extends StatefulWidget {
  const PrintReport({Key key}) : super(key: key);
  @override
  _PrintReportState createState() => _PrintReportState();
}

class _PrintReportState extends State<PrintReport>
    with SingleTickerProviderStateMixin {
  PrintReportCTR printreport = Get.put(PrintReportCTR());
  CreateSellerCTR peroid = Get.put(CreateSellerCTR());
  @override
  void initState() {
    printreport.menu.disable(true);
    peroid.getCreatesaler().then((value) {
      if (value == "200") {
        printreport.loadingperoid(value);
        printreport.getperiod(peroid.periodmd[0].periodNumber.toString());
        printreport.numberperoid(peroid.periodmd[0].lotteryNumber.toString());
        printreport.dateperoid(peroid.periodmd[0].dateOnline.toString());
        printreport.getbranchCombobox().then((value) {
          if (value == "200") {
            printreport
                .getbranch(printreport.listbrachmd[0].branchId.toString());
            printreport.getbybranch(printreport.getbranch.value).then((value) {
              printreport.selected(value);
              printreport.getunit(printreport.listunitmd[0].unitId.toString());
            });
          }
        });
        printreport.loadingData(printreport.getperiod.value, "0", "0");
      }
    });
    printreport.clear();
    super.initState();
    printreport.controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => peroid.statusCode.value == "error"
          ? HttpError(
              title: StatusCodeText.httpError,
            )
          : peroid.statusCode.value == "500"
              ? HttpError(
                  title: StatusCodeText.httpError,
                )
              : Scaffold(
                  appBar: AppBar(
                    backgroundColor: colorbackground,
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: InfoPopup(
                        hintText: "ຄົ້ນຫາ",
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(50),
                        ],
                        title: "ລາຍງານ",
                        search: printreport.search,
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
                        padding:
                            const EdgeInsets.only(right: 50, left: 50, top: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ພິມການຂາຍ",
                              style: TextStyle(
                                  fontFamily: phetsarath,
                                  color: colordarkblue,
                                  fontSize: fontmenu,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "ສັງລວມການຂາຍ ຖືກລາງວັນ",
                              style: TextStyle(
                                  fontFamily: phetsarath,
                                  color: colorblack,
                                  fontSize: fontmenu,
                                  fontWeight: FontWeight.normal),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "ຂໍ້ມູນລາຍງານ",
                              style: TextStyle(
                                  fontFamily: phetsarath,
                                  color: colorblack,
                                  fontSize: fontmenu,
                                  fontWeight: FontWeight.normal),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            // ////////// Row Title //////////
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  child: Row(
                                    children: [
                                      Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Container(
                                          width: 130,
                                          height: 42,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all()),
                                          child: DropdownButtonHideUnderline(
                                              child: DropdownButton(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            value: printreport
                                                        .loadingperoid.value ==
                                                    "200"
                                                ? printreport.getperiod.value
                                                : null,
                                            hint: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20.0),
                                              child: Text("ງວດ: ",
                                                  style: TextStyle(
                                                      color: printreport.empty
                                                                  .value ==
                                                              "1"
                                                          ? colorred
                                                          : colorblack,
                                                      fontSize: fontmenu,
                                                      fontFamily: phetsarath)),
                                            ),
                                            items: printreport
                                                        .loadingperoid.value ==
                                                    "200"
                                                ? peroid.periodmd
                                                    .map((document) {
                                                    return DropdownMenuItem(
                                                        onTap: () {
                                                          printreport.numberperoid(
                                                              document
                                                                  .lotteryNumber
                                                                  .toString());
                                                          printreport.dateperoid(
                                                              document
                                                                  .dateOffline
                                                                  .toString());
                                                        },
                                                        value: document
                                                            .periodNumber,
                                                        child: SizedBox(
                                                          height: 30.0,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20.0),
                                                            child: Text(
                                                                document
                                                                    .periodNumber,
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
                                              peroid.getCreatesaler().then(
                                                  (value) => printreport
                                                      .loadingperoid(value));
                                              printreport.getperiod(value1);
                                              printreport.loadingData(
                                                  printreport.getperiod.value,
                                                  printreport.getbranch.value,
                                                  printreport.getunit.value);
                                            },
                                          )),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      TextDetail(
                                        title: "ງວດ",
                                        color: colorblack,
                                        subtitle:
                                            printreport.loadingperoid.value ==
                                                    ""
                                                ? "ວ່າງເປົ່າ"
                                                : printreport.getperiod.value,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      TextDetail(
                                        title: "ວັນທີເລກອອກ",
                                        color: colorblack,
                                        subtitle:
                                            printreport.dateperoid.value == ""
                                                ? "ວ່າງເປົ່າ"
                                                : DateFormat("dd/MM/yyyy")
                                                    .format(DateTime.parse(
                                                        printreport
                                                            .dateperoid.value
                                                            .toString())),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      TextDetail(
                                        title: "ເລກອອກ",
                                        color: colordarkblue,
                                        subtitle:
                                            printreport.numberperoid.value == ""
                                                ? "ວ່າງເປົ່າ"
                                                : printreport
                                                    .numberperoid.value,
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  child: Row(
                                    children: [
                                      Button(
                                        height: 42,
                                        title: printreport.onTapExcel.value ==
                                                false
                                            ? "Export Excel"
                                            : "ລໍຖ້າ...",
                                        colorstype: colorwhite,
                                        fontFamily: phetsarath,
                                        fontSize: fontgeneral,
                                        onPressed: () {
                                          printreport.loadingData(
                                              printreport.getperiod.value,
                                              printreport.getbranch.value,
                                              printreport.getunit.value);
                                          if (printreport.onTapExcel.value ==
                                              false) {
                                            //////////// ສັ່ງລວມການຂາຍ /////////
                                            if (printreport.itemselect.value ==
                                                "ສັງລວມການຂາຍ") {
                                              printreport
                                                  .getExportAll(
                                                      printreport
                                                          .getperiod.value,
                                                      printreport
                                                          .getbranch.value,
                                                      printreport.getunit.value)
                                                  .then((value) {
                                                if (value == "200") {
                                                  printreport.downloadFile(
                                                      "All_Sale_Won");
                                                } else {
                                                  CustomDialogs.errorDialogs(
                                                      context,
                                                      "ບໍ່ພົບຂໍ້ມູນນີ້ !");
                                                }
                                              }).whenComplete(() => printreport
                                                      .onTapExcel(false));
                                            }
                                            //////////// ສັ່ງລວມຈຸດຂາຍ /////////
                                            else if (printreport
                                                    .itemselect.value ==
                                                "ສັງລວມຈຸດຂາຍ") {
                                              if (printreport
                                                      .onselectTap.value ==
                                                  "0") {
                                                printreport
                                                    .getExportSale(
                                                        printreport
                                                            .getperiod.value,
                                                        printreport
                                                            .getbranch.value,
                                                        printreport
                                                            .getunit.value)
                                                    .then((value) {
                                                  if (value == "200") {
                                                    printreport
                                                        .downloadFile("Sale");
                                                  } else {
                                                    CustomDialogs.errorDialogs(
                                                        context,
                                                        "ບໍ່ພົບຂໍ້ມູນນີ້ !");
                                                  }
                                                }).whenComplete(() =>
                                                        printreport
                                                            .onTapExcel(false));
                                              } else {
                                                printreport
                                                    .getExportWon(
                                                        printreport
                                                            .getperiod.value,
                                                        printreport
                                                            .getbranch.value,
                                                        printreport
                                                            .getunit.value)
                                                    .then((value) {
                                                  if (value == "200") {
                                                    printreport
                                                        .downloadFile("Won");
                                                  } else {
                                                    CustomDialogs.errorDialogs(
                                                        context,
                                                        "ບໍ່ພົບຂໍ້ມູນນີ້ !");
                                                  }
                                                }).whenComplete(() =>
                                                        printreport
                                                            .onTapExcel(false));
                                              }
                                            }
                                            //////////// ພິມບິນຖືກການລາງວັນ /////////
                                            else if (printreport
                                                    .itemselect.value ==
                                                "ພິມບິນຖືກລາງວັນ") {
                                              printreport
                                                  .getExportBill(
                                                      printreport
                                                          .getperiod.value,
                                                      printreport
                                                          .getbranch.value,
                                                      printreport.getunit.value)
                                                  .then((value) {
                                                if (value == "200") {
                                                  printreport.downloadFile(
                                                      "Print_Bill");
                                                } else {
                                                  CustomDialogs.errorDialogs(
                                                      context,
                                                      "ບໍ່ພົບຂໍ້ມູນນີ້ !");
                                                }
                                              }).whenComplete(() => printreport
                                                      .onTapExcel(false));
                                            }
                                            //////////// ສັ່ງລວມຈຸດຂາຍ Export /////////
                                            else {
                                              printreport
                                                  .getExportExport(
                                                      printreport
                                                          .getperiod.value,
                                                      printreport
                                                          .getbranch.value,
                                                      printreport.getunit.value)
                                                  .then((value) {
                                                if (value == "200") {
                                                  printreport
                                                      .downloadFile("Export");
                                                } else {
                                                  CustomDialogs.errorDialogs(
                                                      context,
                                                      "ບໍ່ພົບຂໍ້ມູນນີ້ !");
                                                }
                                              }).whenComplete(() => printreport
                                                      .onTapExcel(false));
                                            }
                                          }

                                          printreport.onTapExcel(true);
                                        },
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      ButtonQuota(
                                        title:
                                            printreport.onTapBill.value == false
                                                ? "ພິມບິນ"
                                                : "ລໍຖ້າ...",
                                        colorstype: colordarkblue,
                                        fontFamily: phetsarath,
                                        fontSize: fontgeneral,
                                        onPressed: () {
                                          printreport.loadingData(
                                              printreport.getperiod.value,
                                              printreport.getbranch.value,
                                              printreport.getunit.value);
                                          if (printreport.onTapBill.value ==
                                              false) {
                                            printreport.onTapBill(true);
                                            //////////// ສັ່ງລວມການຂາຍ /////////
                                            if (printreport.itemselect.value ==
                                                "ສັງລວມການຂາຍ") {
                                              printreport
                                                  .getExportAll(
                                                      printreport
                                                          .getperiod.value,
                                                      printreport
                                                          .getbranch.value,
                                                      printreport.getunit.value)
                                                  .then((value) {
                                                if (value == "200") {
                                                  printreport.createReportAllPDF(
                                                      printreport
                                                          .getperiod.value,
                                                      printreport
                                                          .getbranch.value,
                                                      printreport
                                                          .getunit.value);
                                                } else {
                                                  CustomDialogs.errorDialogs(
                                                      context,
                                                      "ບໍ່ພົບຂໍ້ມູນນີ້ !");
                                                }
                                              }).whenComplete(() => printreport
                                                      .onTapBill(false));
                                            }
                                            //////////// ສັ່ງລວມຈຸດຂາຍ /////////
                                            else if (printreport
                                                    .itemselect.value ==
                                                "ສັງລວມຈຸດຂາຍ") {
                                              if (printreport
                                                      .onselectTap.value ==
                                                  "0") {
                                                printreport
                                                    .getExportSale(
                                                        printreport
                                                            .getperiod.value,
                                                        printreport
                                                            .getbranch.value,
                                                        printreport
                                                            .getunit.value)
                                                    .then((value) {
                                                  if (value == "200") {
                                                    printreport
                                                        .createReportSalePDF(
                                                            printreport
                                                                .getperiod
                                                                .value,
                                                            printreport
                                                                .getbranch
                                                                .value,
                                                            printreport
                                                                .getunit.value);
                                                  } else {
                                                    CustomDialogs.errorDialogs(
                                                        context,
                                                        "ບໍ່ພົບຂໍ້ມູນນີ້ !");
                                                  }
                                                }).whenComplete(() =>
                                                        printreport
                                                            .onTapBill(false));
                                              } else {
                                                printreport
                                                    .getExportWon(
                                                        printreport
                                                            .getperiod.value,
                                                        printreport
                                                            .getbranch.value,
                                                        printreport
                                                            .getunit.value)
                                                    .then((value) {
                                                  if (value == "200") {
                                                    printreport.createReportWonPDF(
                                                        printreport
                                                            .getperiod.value,
                                                        printreport
                                                            .getbranch.value,
                                                        printreport
                                                            .getunit.value);
                                                  } else {
                                                    CustomDialogs.errorDialogs(
                                                        context,
                                                        "ບໍ່ພົບຂໍ້ມູນນີ້ !");
                                                  }
                                                }).whenComplete(() =>
                                                        printreport
                                                            .onTapBill(false));
                                              }
                                            }
                                            //////////// ພິມບິນຖືກການລາງວັນ /////////
                                            else if (printreport
                                                    .itemselect.value ==
                                                "ພິມບິນຖືກລາງວັນ") {
                                              printreport
                                                  .getExportBill(
                                                      printreport
                                                          .getperiod.value,
                                                      printreport
                                                          .getbranch.value,
                                                      printreport.getunit.value)
                                                  .then((value) {
                                                if (value == "200") {
                                                  printreport.createReportbillPDF(
                                                      printreport
                                                          .getperiod.value,
                                                      printreport
                                                          .getbranch.value,
                                                      printreport
                                                          .getunit.value);
                                                } else {
                                                  CustomDialogs.errorDialogs(
                                                      context,
                                                      "ບໍ່ພົບຂໍ້ມູນນີ້ !");
                                                }
                                              }).whenComplete(() => printreport
                                                      .onTapBill(false));
                                            }
                                            //////////// ສັ່ງລວມຈຸດຂາຍ Export /////////
                                            else {
                                              printreport
                                                  .getExportExport(
                                                      printreport
                                                          .getperiod.value,
                                                      printreport
                                                          .getbranch.value,
                                                      printreport.getunit.value)
                                                  .then((value) {
                                                if (value == "200") {
                                                  printreport
                                                      .createReportExportPDF(
                                                          printreport
                                                              .getperiod.value,
                                                          printreport
                                                              .getbranch.value,
                                                          printreport
                                                              .getunit.value);
                                                } else {
                                                  CustomDialogs.errorDialogs(
                                                      context,
                                                      "ບໍ່ພົບຂໍ້ມູນນີ້ !");
                                                }
                                              }).whenComplete(() => printreport
                                                      .onTapBill(false));
                                            }
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            // ////////// Row Combobox //////////
                            Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      height: 42,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all()),
                                      child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                        borderRadius: BorderRadius.circular(10),
                                        value:
                                            printreport.listbrachmd.isNotEmpty
                                                ? printreport.getbranch.value
                                                : null,
                                        hint: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20.0),
                                          child: Text("ສາຂາ :",
                                              style: TextStyle(
                                                  color: colorblack,
                                                  fontSize: fontmenu,
                                                  fontFamily: phetsarath)),
                                        ),
                                        items: printreport
                                                .listbrachmd.isNotEmpty
                                            ? printreport.listbrachmd
                                                .map((document) {
                                                return DropdownMenuItem(
                                                    onTap: () {
                                                      printreport.branchpdf(
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
                                            : null,
                                        onChanged: (value1) {
                                          printreport.getbranchCombobox();
                                          printreport.getbranch(value1);
                                          printreport.selected("");
                                          printreport
                                              .getbybranch(value1)
                                              .then((value) {
                                            if (value != "200") {
                                              printreport.selected(value);
                                            } else {
                                              printreport.selected(value);
                                            }
                                          });

                                          printreport.loadingData(
                                              printreport.getperiod.value,
                                              printreport.getbranch.value,
                                              printreport.getunit.value);
                                        },
                                      )),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      height: 42,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all()),
                                      child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                        borderRadius: BorderRadius.circular(10),
                                        value:
                                            printreport.selected.value == "200"
                                                ? printreport.getunit.value
                                                : null,
                                        hint: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20.0),
                                          child: Text("ຫນ່ວຍ :",
                                              style: TextStyle(
                                                  color: colorblack,
                                                  fontSize: fontmenu,
                                                  fontFamily: phetsarath)),
                                        ),
                                        items: printreport.selected.value ==
                                                "200"
                                            ? printreport.listunitmd
                                                .map((document) {
                                                return DropdownMenuItem(
                                                  value: document.unitId
                                                      .toString(),
                                                  child: SizedBox(
                                                    height: 30.0,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20.0),
                                                      child: Text(
                                                          document.unitName,
                                                          style: TextStyle(
                                                              color: colorblack,
                                                              fontSize:
                                                                  fontmenu,
                                                              fontFamily:
                                                                  phetsarath)),
                                                    ),
                                                  ),
                                                );
                                              }).toList()
                                            : null,
                                        onChanged: (value) {
                                          printreport.getbybranch(
                                              printreport.getbranch.value);
                                          printreport.getunit(value);

                                          printreport.loadingData(
                                              printreport.getperiod.value,
                                              printreport.getbranch.value,
                                              printreport.getunit.value);
                                        },
                                      )),
                                    ),
                                  ),
                                ),
                              ],
                            )
                            // ////////// Column ListData //////////
                            ,
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              width: double.infinity,
                              color: colorwhite,
                              height: 1000,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // ////////// list items //////////
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Card(
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(1),
                                        ),
                                        child: Container(
                                          height: 42,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(1)),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                              iconEnabledColor: colordarkblue,
                                              borderRadius:
                                                  BorderRadius.circular(1),
                                              value: printreport.listitem,
                                              hint: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text("ສັງລວມການຂາຍ",
                                                    style: TextStyle(
                                                        color: colordarkblue,
                                                        fontSize: fontmenu,
                                                        fontFamily:
                                                            phetsarath)),
                                              ),
                                              items: [
                                                DropdownMenuItem(
                                                  onTap: () {
                                                    printreport.loadingData(
                                                        printreport
                                                            .getperiod.value,
                                                        printreport
                                                            .getbranch.value,
                                                        printreport
                                                            .getunit.value);
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Text("ສັງລວມການຂາຍ",
                                                        style: TextStyle(
                                                            color:
                                                                colordarkblue,
                                                            fontSize: fontmenu,
                                                            fontFamily:
                                                                phetsarath)),
                                                  ),
                                                  value: "ສັງລວມການຂາຍ",
                                                ),
                                                DropdownMenuItem(
                                                  onTap: () {
                                                    printreport.loadingData(
                                                        printreport
                                                            .getperiod.value,
                                                        printreport
                                                            .getbranch.value,
                                                        printreport
                                                            .getunit.value);
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Text("ສັງລວມຈຸດຂາຍ",
                                                        style: TextStyle(
                                                            color:
                                                                colordarkblue,
                                                            fontSize: fontmenu,
                                                            fontFamily:
                                                                phetsarath)),
                                                  ),
                                                  value: "ສັງລວມຈຸດຂາຍ",
                                                ),
                                                DropdownMenuItem(
                                                  onTap: () {
                                                    printreport.loadingData(
                                                        printreport
                                                            .getperiod.value,
                                                        printreport
                                                            .getbranch.value,
                                                        printreport
                                                            .getunit.value);
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Text(
                                                        "ພິມບິນຖືກລາງວັນ",
                                                        style: TextStyle(
                                                            color:
                                                                colordarkblue,
                                                            fontSize: fontmenu,
                                                            fontFamily:
                                                                phetsarath)),
                                                  ),
                                                  value: "ພິມບິນຖືກລາງວັນ",
                                                ),
                                                DropdownMenuItem(
                                                  onTap: () {
                                                    printreport.loadingData(
                                                        printreport
                                                            .getperiod.value,
                                                        printreport
                                                            .getbranch.value,
                                                        printreport
                                                            .getunit.value);
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Text(
                                                        "ສັງລວມຈຸດຂາຍ Export",
                                                        style: TextStyle(
                                                            color:
                                                                colordarkblue,
                                                            fontSize: fontmenu,
                                                            fontFamily:
                                                                phetsarath)),
                                                  ),
                                                  value: "ສັງລວມຈຸດຂາຍ Export",
                                                ),
                                              ].toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  printreport.listitem = value;
                                                  printreport.itemselect(value);
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Card(
                                        elevation: 5,
                                        child: IconButton(
                                            color: colorblack,
                                            onPressed: () {
                                              printreport.loadingData(
                                                  printreport.getperiod.value,
                                                  printreport.getbranch.value,
                                                  printreport.getunit.value);
                                            },
                                            icon: const Icon(Icons.refresh)),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 1,
                                    color: colordarkblue,
                                  ),
                                  //////////// list data //////////
                                  printreport.itemselect.value == "ສັງລວມການຂາຍ"
                                      ?
                                      ///// ສັງລວມການຂາຍ ///////
                                      Container(
                                          padding: const EdgeInsets.all(10),
                                          width: double.infinity,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const ListReportAll(
                                                color: colorblack,
                                                fontWeight: FontWeight.bold,
                                                title: "",
                                                d1: "ມູນຄ່າຈຳຫນ່າຍ",
                                                d2: "ມູນຄ່າຂາຍໄດ້",
                                                d3: "ມູນຄ່າຖືກລາງວັນ",
                                                d4: "ຜິດດ່ຽງ",
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              ListReportAll(
                                                color: colorblack,
                                                fontWeight: FontWeight.bold,
                                                title: "ເລກ 1 ໂຕ",
                                                d1: printreport.loadingsale
                                                            .value !=
                                                        "200"
                                                    ? "0"
                                                    : Numberformated.formated
                                                        .format(double.parse(
                                                            printreport
                                                                .reportallmd[0]
                                                                .quota[0]
                                                                .quota
                                                                .toString())),
                                                d2: printreport.loadingsale
                                                            .value !=
                                                        "200"
                                                    ? "0"
                                                    : printreport.reportallmd[0]
                                                                .sales[0].sd1 ==
                                                            null
                                                        ? "0"
                                                        : Numberformated
                                                            .formated
                                                            .format(double.parse(
                                                                printreport
                                                                    .reportallmd[
                                                                        0]
                                                                    .sales[0]
                                                                    .sd1
                                                                    .toString())),
                                                d3: printreport.loadingsale
                                                            .value !=
                                                        "200"
                                                    ? "0"
                                                    : printreport.reportallmd[0]
                                                                .won[0].wd1 ==
                                                            null
                                                        ? "0"
                                                        : Numberformated
                                                            .formated
                                                            .format(double.parse(
                                                                printreport
                                                                    .reportallmd[
                                                                        0]
                                                                    .won[0]
                                                                    .wd1
                                                                    .toString())),
                                                d4: printreport.loadingsale
                                                            .value !=
                                                        "200"
                                                    ? "0"
                                                    : Numberformated.formated
                                                        .format(double.parse(
                                                            printreport
                                                                .reportallmd[0]
                                                                .balance
                                                                .d1
                                                                .toString())),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              ListReportAll(
                                                color: colorblack,
                                                fontWeight: FontWeight.bold,
                                                title: "ເລກ 2 ໂຕ",
                                                d1: printreport.loadingsale
                                                            .value !=
                                                        "200"
                                                    ? "0"
                                                    : Numberformated.formated
                                                        .format(double.parse(
                                                            printreport
                                                                .reportallmd[0]
                                                                .quota[1]
                                                                .quota
                                                                .toString())),
                                                d2: printreport.loadingsale
                                                            .value !=
                                                        "200"
                                                    ? "0"
                                                    : printreport.reportallmd[0]
                                                                .sales[0].sd2 ==
                                                            null
                                                        ? "0"
                                                        : Numberformated
                                                            .formated
                                                            .format(double.parse(
                                                                printreport
                                                                    .reportallmd[
                                                                        0]
                                                                    .sales[0]
                                                                    .sd2
                                                                    .toString())),
                                                d3: printreport.loadingsale
                                                            .value !=
                                                        "200"
                                                    ? "0"
                                                    : printreport.reportallmd[0]
                                                                .won[0].wd2 ==
                                                            null
                                                        ? "0"
                                                        : Numberformated
                                                            .formated
                                                            .format(double.parse(
                                                                printreport
                                                                    .reportallmd[
                                                                        0]
                                                                    .won[0]
                                                                    .wd2
                                                                    .toString())),
                                                d4: printreport.loadingsale
                                                            .value !=
                                                        "200"
                                                    ? "0"
                                                    : Numberformated.formated
                                                        .format(double.parse(
                                                            printreport
                                                                .reportallmd[0]
                                                                .balance
                                                                .d2
                                                                .toString())),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              ListReportAll(
                                                color: colorblack,
                                                fontWeight: FontWeight.bold,
                                                title: "ເລກ 3 ໂຕ",
                                                d1: printreport.loadingsale
                                                            .value !=
                                                        "200"
                                                    ? "0"
                                                    : Numberformated.formated
                                                        .format(double.parse(
                                                            printreport
                                                                .reportallmd[0]
                                                                .quota[2]
                                                                .quota
                                                                .toString())),
                                                d2: printreport.loadingsale
                                                            .value !=
                                                        "200"
                                                    ? "0"
                                                    : printreport.reportallmd[0]
                                                                .sales[0].sd3 ==
                                                            null
                                                        ? "0"
                                                        : Numberformated
                                                            .formated
                                                            .format(double.parse(
                                                                printreport
                                                                    .reportallmd[
                                                                        0]
                                                                    .sales[0]
                                                                    .sd3
                                                                    .toString())),
                                                d3: printreport.loadingsale
                                                            .value !=
                                                        "200"
                                                    ? "0"
                                                    : printreport.reportallmd[0]
                                                                .won[0].wd3 ==
                                                            null
                                                        ? "0"
                                                        : Numberformated
                                                            .formated
                                                            .format(double.parse(
                                                                printreport
                                                                    .reportallmd[
                                                                        0]
                                                                    .won[0]
                                                                    .wd3
                                                                    .toString())),
                                                d4: printreport.loadingsale
                                                            .value !=
                                                        "200"
                                                    ? "0"
                                                    : Numberformated.formated
                                                        .format(double.parse(
                                                            printreport
                                                                .reportallmd[0]
                                                                .balance
                                                                .d3
                                                                .toString())),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              ListReportAll(
                                                color: colorblack,
                                                fontWeight: FontWeight.bold,
                                                title: "ເລກ 4 ໂຕ",
                                                d1: printreport.loadingsale
                                                            .value !=
                                                        "200"
                                                    ? "0"
                                                    : Numberformated.formated
                                                        .format(double.parse(
                                                            printreport
                                                                .reportallmd[0]
                                                                .quota[3]
                                                                .quota
                                                                .toString())),
                                                d2: printreport.loadingsale
                                                            .value !=
                                                        "200"
                                                    ? "0"
                                                    : printreport.reportallmd[0]
                                                                .sales[0].sd4 ==
                                                            null
                                                        ? "0"
                                                        : Numberformated
                                                            .formated
                                                            .format(double.parse(
                                                                printreport
                                                                    .reportallmd[
                                                                        0]
                                                                    .sales[0]
                                                                    .sd4
                                                                    .toString())),
                                                d3: printreport.loadingsale
                                                            .value !=
                                                        "200"
                                                    ? "0"
                                                    : printreport.reportallmd[0]
                                                                .won[0].wd4 ==
                                                            null
                                                        ? "0"
                                                        : Numberformated
                                                            .formated
                                                            .format(double.parse(
                                                                printreport
                                                                    .reportallmd[
                                                                        0]
                                                                    .won[0]
                                                                    .wd4
                                                                    .toString())),
                                                d4: printreport.loadingsale
                                                            .value !=
                                                        "200"
                                                    ? "0"
                                                    : Numberformated.formated
                                                        .format(double.parse(
                                                            printreport
                                                                .reportallmd[0]
                                                                .balance
                                                                .d4
                                                                .toString())),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              ListReportAll(
                                                color: colorblack,
                                                fontWeight: FontWeight.bold,
                                                title: "ເລກ 5 ໂຕ",
                                                d1: printreport.loadingsale
                                                            .value !=
                                                        "200"
                                                    ? "0"
                                                    : Numberformated.formated
                                                        .format(double.parse(
                                                            printreport
                                                                .reportallmd[0]
                                                                .quota[4]
                                                                .quota
                                                                .toString())),
                                                d2: printreport.loadingsale
                                                            .value !=
                                                        "200"
                                                    ? "0"
                                                    : printreport.reportallmd[0]
                                                                .sales[0].sd5 ==
                                                            null
                                                        ? "0"
                                                        : Numberformated
                                                            .formated
                                                            .format(double.parse(
                                                                printreport
                                                                    .reportallmd[
                                                                        0]
                                                                    .sales[0]
                                                                    .sd5
                                                                    .toString())),
                                                d3: printreport.loadingsale
                                                            .value !=
                                                        "200"
                                                    ? "0"
                                                    : printreport.reportallmd[0]
                                                                .won[0].wd5 ==
                                                            null
                                                        ? "0"
                                                        : Numberformated
                                                            .formated
                                                            .format(double.parse(
                                                                printreport
                                                                    .reportallmd[
                                                                        0]
                                                                    .won[0]
                                                                    .wd5
                                                                    .toString())),
                                                d4: printreport.loadingsale
                                                            .value !=
                                                        "200"
                                                    ? "0"
                                                    : Numberformated.formated
                                                        .format(double.parse(
                                                            printreport
                                                                .reportallmd[0]
                                                                .balance
                                                                .d5
                                                                .toString())),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              ListReportAll(
                                                color: colorblack,
                                                fontWeight: FontWeight.bold,
                                                title: "ເລກ 6 ໂຕ",
                                                d1: printreport.loadingsale
                                                            .value !=
                                                        "200"
                                                    ? "0"
                                                    : Numberformated.formated
                                                        .format(double.parse(
                                                            printreport
                                                                .reportallmd[0]
                                                                .quota[5]
                                                                .quota
                                                                .toString())),
                                                d2: printreport.loadingsale
                                                            .value !=
                                                        "200"
                                                    ? "0"
                                                    : printreport.reportallmd[0]
                                                                .sales[0].sd6 ==
                                                            null
                                                        ? "0"
                                                        : Numberformated
                                                            .formated
                                                            .format(double.parse(
                                                                printreport
                                                                    .reportallmd[
                                                                        0]
                                                                    .sales[0]
                                                                    .sd6
                                                                    .toString())),
                                                d3: printreport.loadingsale
                                                            .value !=
                                                        "200"
                                                    ? "0"
                                                    : printreport.reportallmd[0]
                                                                .won[0].wd6 ==
                                                            null
                                                        ? "0"
                                                        : Numberformated
                                                            .formated
                                                            .format(double.parse(
                                                                printreport
                                                                    .reportallmd[
                                                                        0]
                                                                    .won[0]
                                                                    .wd6
                                                                    .toString())),
                                                d4: printreport.loadingsale
                                                            .value !=
                                                        "200"
                                                    ? "0"
                                                    : Numberformated.formated
                                                        .format(double.parse(
                                                            printreport
                                                                .reportallmd[0]
                                                                .balance
                                                                .d6
                                                                .toString())),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              ListReportAlls(
                                                title: "ລວມ",
                                                d1: printreport.loadingsale
                                                            .value !=
                                                        "200"
                                                    ? "0"
                                                    : Numberformated.formated
                                                        .format(double.parse(
                                                            printreport
                                                                .reportallmd[0]
                                                                .totalQuota
                                                                .toString())),
                                                d2: printreport.loadingsale
                                                            .value !=
                                                        "200"
                                                    ? "0"
                                                    : printreport.reportallmd[0]
                                                                .totalSale ==
                                                            "NaN"
                                                        ? "0"
                                                        : Numberformated
                                                            .formated
                                                            .format(double.parse(
                                                                printreport
                                                                    .reportallmd[
                                                                        0]
                                                                    .totalSale
                                                                    .toString())),
                                                d3: printreport.loadingsale
                                                            .value !=
                                                        "200"
                                                    ? "0"
                                                    : printreport.reportallmd[0]
                                                                .totalWon ==
                                                            "NaN"
                                                        ? "0"
                                                        : Numberformated
                                                            .formated
                                                            .format(double.parse(
                                                                printreport
                                                                    .reportallmd[
                                                                        0]
                                                                    .totalWon
                                                                    .toString())),
                                                d4: printreport.loadingsale
                                                            .value !=
                                                        "200"
                                                    ? "0"
                                                    : Numberformated.formated
                                                        .format(double.parse(
                                                            printreport
                                                                .reportallmd[0]
                                                                .totalBalance
                                                                .toString())),
                                              ),
                                            ],
                                          ),
                                        )
                                      :
                                      ///// ສັງລວມຈຸດຂາຍ ///////
                                      printreport.itemselect.value ==
                                              "ສັງລວມຈຸດຂາຍ"
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 300,
                                                  child: TabBar(
                                                    indicatorColor: colorblack,
                                                    onTap: (value) {
                                                      printreport.onselectTap(
                                                          value.toString());

                                                      printreport
                                                          .getReportAll(
                                                              printreport
                                                                  .getperiod
                                                                  .value,
                                                              printreport
                                                                  .getbranch
                                                                  .value,
                                                              printreport
                                                                  .getunit
                                                                  .value)
                                                          .then((value) =>
                                                              printreport
                                                                  .loadingsale(
                                                                      value));
                                                      printreport
                                                          .getReportBill(
                                                              printreport
                                                                  .getperiod
                                                                  .value,
                                                              printreport
                                                                  .getbranch
                                                                  .value,
                                                              printreport
                                                                  .getunit
                                                                  .value)
                                                          .then((value) =>
                                                              printreport
                                                                  .loadingreportBill(
                                                                      value));
                                                      printreport
                                                          .getReportExport(
                                                              printreport
                                                                  .getperiod
                                                                  .value,
                                                              printreport
                                                                  .getbranch
                                                                  .value,
                                                              printreport
                                                                  .getunit
                                                                  .value)
                                                          .then((value) =>
                                                              printreport
                                                                  .loadingreportExport(
                                                                      value));
                                                      if (printreport
                                                              .onselectTap
                                                              .value ==
                                                          "0") {
                                                        printreport
                                                            .getReportSale(
                                                                printreport
                                                                    .getperiod
                                                                    .value,
                                                                printreport
                                                                    .getbranch
                                                                    .value,
                                                                printreport
                                                                    .getunit
                                                                    .value)
                                                            .then((value) =>
                                                                printreport
                                                                    .loadingreportsale(
                                                                        value));
                                                      } else {
                                                        printreport
                                                            .getReportWon(
                                                                printreport
                                                                    .getperiod
                                                                    .value,
                                                                printreport
                                                                    .getbranch
                                                                    .value,
                                                                printreport
                                                                    .getunit
                                                                    .value)
                                                            .then((value) =>
                                                                printreport
                                                                    .loadingreportWon(
                                                                        value));
                                                      }
                                                    },
                                                    controller:
                                                        printreport.controller,
                                                    tabs: [
                                                      Tab(
                                                        child: Text(
                                                            "ມູນຄ່າຂາຍໄດ້",
                                                            style: TextStyle(
                                                                color:
                                                                    colorblack,
                                                                fontSize:
                                                                    fontmenu,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    phetsarath)),
                                                      ),
                                                      Tab(
                                                        child: Text(
                                                            "ມູນຄ່າຖືກລາງວັນ",
                                                            style: TextStyle(
                                                                color:
                                                                    colorblack,
                                                                fontSize:
                                                                    fontmenu,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    phetsarath)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                printreport.onselectTap.value ==
                                                        "0"
                                                    ?
                                                    // ////////// list On tab ມູນຄ່າຂາຍໄດ້ //////////
                                                    printreport.loadingreportsale
                                                                .value !=
                                                            "200"
                                                        ? const ShowNullData(
                                                            width: 150,
                                                            height: 150,
                                                          )
                                                        : Container(
                                                            width:
                                                                double.infinity,
                                                            // height: 500,
                                                            color: colorwhite,
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
                                                                        "ລ/ດ",
                                                                        style: TextStyle(
                                                                            color:
                                                                                colorblack,
                                                                            fontSize:
                                                                                fontmenu,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: phetsarath))),
                                                                DataColumn(
                                                                    label: Text(
                                                                        "ສາຂາ",
                                                                        style: TextStyle(
                                                                            color:
                                                                                colorblack,
                                                                            fontSize:
                                                                                fontmenu,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: phetsarath))),
                                                                DataColumn(
                                                                    label: Text(
                                                                        "ລະຫັດເຄື່ອງ",
                                                                        style: TextStyle(
                                                                            color:
                                                                                colorblack,
                                                                            fontSize:
                                                                                fontmenu,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: phetsarath))),
                                                                DataColumn(
                                                                    label: Text(
                                                                        "ເລກ 1 ໂຕ",
                                                                        style: TextStyle(
                                                                            color:
                                                                                colorblack,
                                                                            fontSize:
                                                                                fontmenu,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: phetsarath))),
                                                                DataColumn(
                                                                    label: Text(
                                                                        "ເລກ 2 ໂຕ",
                                                                        style: TextStyle(
                                                                            color:
                                                                                colorblack,
                                                                            fontSize:
                                                                                fontmenu,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: phetsarath))),
                                                                DataColumn(
                                                                    label: Text(
                                                                        "ເລກ 3 ໂຕ",
                                                                        style: TextStyle(
                                                                            color:
                                                                                colorblack,
                                                                            fontSize:
                                                                                fontmenu,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: phetsarath))),
                                                                DataColumn(
                                                                    label: Text(
                                                                        "ເລກ 4 ໂຕ",
                                                                        style: TextStyle(
                                                                            color:
                                                                                colorblack,
                                                                            fontSize:
                                                                                fontmenu,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: phetsarath))),
                                                                DataColumn(
                                                                    label: Text(
                                                                        "ເລກ 5 ໂຕ",
                                                                        style: TextStyle(
                                                                            color:
                                                                                colorblack,
                                                                            fontSize:
                                                                                fontmenu,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: phetsarath))),
                                                                DataColumn(
                                                                    label: Text(
                                                                        "ເລກ 6 ໂຕ",
                                                                        style: TextStyle(
                                                                            color:
                                                                                colorblack,
                                                                            fontSize:
                                                                                fontmenu,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: phetsarath))),
                                                                DataColumn(
                                                                    label: Text(
                                                                        "ລວມ",
                                                                        style: TextStyle(
                                                                            color:
                                                                                colorpercent,
                                                                            fontSize:
                                                                                fontmenu,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: phetsarath))),
                                                              ],
                                                              source: ReportAllsale(
                                                                  reportData:
                                                                      printreport
                                                                          .reportSalemd,
                                                                  context:
                                                                      context),
                                                              rowsPerPage: 15,
                                                              //  initialFirstRowIndex: 1,
                                                            ),
                                                          )
                                                    :
                                                    // ////////// list On tab ມູນຄ່າຖືກລາງວັນ //////////
                                                    printreport.loadingreportWon
                                                                .value !=
                                                            "200"
                                                        ? const ShowNullData(
                                                            width: 150,
                                                            height: 150,
                                                          )
                                                        : Container(
                                                            width:
                                                                double.infinity,
                                                            // height: 500,
                                                            color: colorwhite,
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
                                                                        "ລ/ດ",
                                                                        style: TextStyle(
                                                                            color:
                                                                                colorblack,
                                                                            fontSize:
                                                                                fontmenu,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: phetsarath))),
                                                                DataColumn(
                                                                    label: Text(
                                                                        "ສາຂາ",
                                                                        style: TextStyle(
                                                                            color:
                                                                                colorblack,
                                                                            fontSize:
                                                                                fontmenu,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: phetsarath))),
                                                                DataColumn(
                                                                    label: Text(
                                                                        "ລະຫັດເຄື່ອງ",
                                                                        style: TextStyle(
                                                                            color:
                                                                                colorblack,
                                                                            fontSize:
                                                                                fontmenu,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: phetsarath))),
                                                                DataColumn(
                                                                    label: Text(
                                                                        "ເລກ 1 ໂຕ",
                                                                        style: TextStyle(
                                                                            color:
                                                                                colorblack,
                                                                            fontSize:
                                                                                fontmenu,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: phetsarath))),
                                                                DataColumn(
                                                                    label: Text(
                                                                        "ເລກ 2 ໂຕ",
                                                                        style: TextStyle(
                                                                            color:
                                                                                colorblack,
                                                                            fontSize:
                                                                                fontmenu,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: phetsarath))),
                                                                DataColumn(
                                                                    label: Text(
                                                                        "ເລກ 3 ໂຕ",
                                                                        style: TextStyle(
                                                                            color:
                                                                                colorblack,
                                                                            fontSize:
                                                                                fontmenu,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: phetsarath))),
                                                                DataColumn(
                                                                    label: Text(
                                                                        "ເລກ 4 ໂຕ",
                                                                        style: TextStyle(
                                                                            color:
                                                                                colorblack,
                                                                            fontSize:
                                                                                fontmenu,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: phetsarath))),
                                                                DataColumn(
                                                                    label: Text(
                                                                        "ເລກ 5 ໂຕ",
                                                                        style: TextStyle(
                                                                            color:
                                                                                colorblack,
                                                                            fontSize:
                                                                                fontmenu,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: phetsarath))),
                                                                DataColumn(
                                                                    label: Text(
                                                                        "ເລກ 6 ໂຕ",
                                                                        style: TextStyle(
                                                                            color:
                                                                                colorblack,
                                                                            fontSize:
                                                                                fontmenu,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: phetsarath))),
                                                                DataColumn(
                                                                    label: Text(
                                                                        "ລວມ",
                                                                        style: TextStyle(
                                                                            color:
                                                                                colorpercent,
                                                                            fontSize:
                                                                                fontmenu,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: phetsarath))),
                                                                DataColumn(
                                                                    label: Text(
                                                                        "ຜິດດ່ຽງ",
                                                                        style: TextStyle(
                                                                            color:
                                                                                colorpercent,
                                                                            fontSize:
                                                                                fontmenu,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: phetsarath))),
                                                              ],
                                                              source: ReportAllWon(
                                                                  reportData:
                                                                      printreport
                                                                          .reportWonmd,
                                                                  context:
                                                                      context),
                                                              rowsPerPage: 15,
                                                              //  initialFirstRowIndex: 1,
                                                            ),
                                                          )
                                              ],
                                            )
                                          : printreport.itemselect.value ==
                                                  "ພິມບິນຖືກລາງວັນ"
                                              ?
                                              ///// ພິມບິນຖືກລາງວັນ ///////
                                              printreport.loadingreportBill
                                                          .value !=
                                                      "200"
                                                  ? const ShowNullData(
                                                      width: 150,
                                                      height: 150,
                                                    )
                                                  : Container(
                                                      width: double.infinity,
                                                      // height: 500,
                                                      color: colorwhite,
                                                      child: PaginatedDataTable(
                                                        showCheckboxColumn:
                                                            false,
                                                        showFirstLastButtons:
                                                            true,
                                                        columnSpacing:
                                                            defaultPadding,
                                                        columns: [
                                                          DataColumn(
                                                              label: Text("ລ/ດ",
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
                                                                  "ສາຂາ",
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
                                                                  "ລະຫັດເຄື່ອງ",
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
                                                                  "ເລກບິນ",
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
                                                                  "ເລກ 1 ໂຕ",
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
                                                                  "ເລກ 2 ໂຕ",
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
                                                                  "ເລກ 3 ໂຕ",
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
                                                                  "ເລກ 4 ໂຕ",
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
                                                                  "ເລກ 5 ໂຕ",
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
                                                                  "ເລກ 6 ໂຕ",
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
                                                              label: Text("ລວມ",
                                                                  style: TextStyle(
                                                                      color:
                                                                          colorpercent,
                                                                      fontSize:
                                                                          fontmenu,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          phetsarath))),
                                                          DataColumn(
                                                              label: Text(
                                                                  "ຈ່າຍລາງວັນ",
                                                                  style: TextStyle(
                                                                      color:
                                                                          colorpercent,
                                                                      fontSize:
                                                                          fontmenu,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          phetsarath))),
                                                          DataColumn(
                                                              label: Text(
                                                                  "ວັນທີຈ່າຍ",
                                                                  style: TextStyle(
                                                                      color:
                                                                          colorpercent,
                                                                      fontSize:
                                                                          fontmenu,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          phetsarath))),
                                                        ],
                                                        source: ReportAllBill(
                                                            reportData:
                                                                printreport
                                                                    .reportBillmd,
                                                            context: context),
                                                        rowsPerPage: 15,
                                                        //  initialFirstRowIndex: 1,
                                                      ),
                                                    )
                                              :
                                              ///// ສັງລວມຈຸດຂາຍ Export ///////
                                              printreport.loadingreportExport
                                                          .value !=
                                                      "200"
                                                  ? const ShowNullData(
                                                      width: 150,
                                                      height: 150,
                                                    )
                                                  : Container(
                                                      width: double.infinity,
                                                      // height: 500,
                                                      color: colorwhite,
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
                                                                  "ລ/ດ\t\t ${printreport.loadingreportExport.value}",
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
                                                                  "ຈຸດຂາຍ\t\t",
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
                                                                  "ຊື້ 1 ໂຕ\t\t",
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
                                                                  "ຊື້ 2 ໂຕ\t\t",
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
                                                                  "ຊື້ 3 ໂຕ\t\t",
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
                                                                  "ຊື້ 4 ໂຕ\t\t",
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
                                                                  "ຊື້ 5 ໂຕ\t\t",
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
                                                                  "ຊື້ 6 ໂຕ\t\t\t\t",
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
                                                                  "ຖືກ 1 ໂຕ\t\t",
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
                                                                  "ຖືກ 2 ໂຕ\t\t",
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
                                                                  "ຖືກ 3 ໂຕ\t\t",
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
                                                                  "ຖືກ 4 ໂຕ\t\t",
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
                                                                  "ຖືກ 5 ໂຕ\t\t",
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
                                                                  "ຖືກ 6 ໂຕ\t\t",
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
                                                                  "ຜິດດ່ຽງ\t\t",
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
                                                                  "ສາຂາ\t\t",
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
                                                                  "ວັນທີ\t\t",
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
                                                        source: ReportAllExport(
                                                            reportData: printreport
                                                                .reportExportmd,
                                                            context: context),
                                                        rowsPerPage: 15,
                                                        //  initialFirstRowIndex: 1,
                                                      ),
                                                    )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
                ),
    );
  }
}

class ReportAllWon extends DataTableSource {
  ReportAllWon({@required List<ReportWonMd> reportData, BuildContext context})
      : _reportData = reportData,
        _context = context,
        assert(reportData != null);
  final List<ReportWonMd> _reportData;
  final BuildContext _context;
  bool get isRowCountApproximate => false;
  int get rowCount => _reportData[0].balance.length;
  int get selectedRowCount => 0;
  PrintReportCTR printreport = Get.put(PrintReportCTR());
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(
        Text(_reportData[0].won[index].row ?? "ວ່າງເປົ່າ",
            style: TextStyle(
                color: colorblack,
                fontSize: fontgeneral,
                fontFamily: phetsarath)),
      ),
      DataCell(Text(_reportData[0].won[index].branchName ?? "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(_reportData[0].won[index].deviceCode ?? "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[0].won[index].wd1)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[0].won[index].wd2)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[0].won[index].wd3)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[0].won[index].wd4)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[0].won[index].wd5)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[0].won[index].wd6)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[0].won[index].total)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorpercent,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated.format(
                  double.parse(_reportData[0].balance[index].balance)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorpercent,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
    ]);
  }
}

class ReportAllExport extends DataTableSource {
  ReportAllExport(
      {@required List<ReportExportMd> reportData, BuildContext context})
      : _reportData = reportData,
        _context = context,
        assert(reportData != null);
  final List<ReportExportMd> _reportData;
  final BuildContext _context;
  bool get isRowCountApproximate => false;
  int get rowCount => _reportData[0].sale.length;
  int get selectedRowCount => 0;
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(
        Text(_reportData[0].sale[index].row ?? "ວ່າງເປົ່າ",
            style: TextStyle(
                color: colorblack,
                fontSize: fontgeneral,
                fontFamily: phetsarath)),
      ),
      DataCell(Text(_reportData[0].sale[index].deviceCode ?? "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[0].sale[index].sd1)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[0].sale[index].sd2)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[0].sale[index].sd3)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[0].sale[index].sd4)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[0].sale[index].sd5)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[0].sale[index].sd6)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[0].data[index].won.wd1)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[0].data[index].won.wd2)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[0].data[index].won.wd3)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[0].data[index].won.wd4)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[0].data[index].won.wd5)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[0].data[index].won.wd6)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[0].data[index].balance)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(_reportData[0].sale[index].branchName ?? "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(_reportData[0].sale[index].dateOffline ?? "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
    ]);
  }
}

class ReportAllBill extends DataTableSource {
  ReportAllBill({@required List<ReportBillMd> reportData, BuildContext context})
      : _reportData = reportData,
        _context = context,
        assert(reportData != null);
  final List<ReportBillMd> _reportData;
  final BuildContext _context;
  bool get isRowCountApproximate => false;
  int get rowCount => _reportData.length;
  int get selectedRowCount => 0;
  DataRow getRow(int index) {
    return DataRow(cells: [
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
      DataCell(Text(_reportData[index].deviceCode ?? "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(_reportData[index].billNumber ?? "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[index].wd1)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[index].wd2)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[index].wd3)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[index].wd4)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[index].wd5)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[index].wd6)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[index].total)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorpercent,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          _reportData[index].pay == null
              ? "ວ່າງເປົ່າ"
              : Numberformated.formated
                  .format(double.parse(_reportData[index].pay.toString())),
          style: TextStyle(
              color: colorpercent,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          _reportData[index].date == null
              ? "ວ່າງເປົ່າ"
              : _reportData[index].date.toString(),
          style: TextStyle(
              color: colorpercent,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
    ]);
  }
}

class ReportAllsale extends DataTableSource {
  ReportAllsale({@required List<ReportSaleMd> reportData, BuildContext context})
      : _reportData = reportData,
        _context = context,
        assert(reportData != null);
  final List<ReportSaleMd> _reportData;
  final BuildContext _context;
  bool get isRowCountApproximate => false;
  int get rowCount => _reportData.length;
  int get selectedRowCount => 0;
  DataRow getRow(int index) {
    return DataRow(cells: [
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
      DataCell(Text(_reportData[index].deviceCode ?? "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[index].sd1)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[index].sd2)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[index].sd3)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[index].sd4)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[index].sd5)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[index].sd6)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorblack,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
      DataCell(Text(
          Numberformated.formated
                  .format(double.parse(_reportData[index].total)) ??
              "ວ່າງເປົ່າ",
          style: TextStyle(
              color: colorpercent,
              fontSize: fontgeneral,
              fontFamily: phetsarath))),
    ]);
  }
}

class ListReportAlls extends StatelessWidget {
  const ListReportAlls({
    Key key,
    this.d1,
    this.d2,
    this.d3,
    this.d4,
    this.title,
  }) : super(key: key);
  final String title;
  final String d1;
  final String d2;
  final String d3;
  final String d4;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
                color: colorpercent,
                fontSize: fontgeneral,
                fontWeight: FontWeight.bold,
                fontFamily: phetsarath)),
        const SizedBox(
          height: 10,
        ),
        Text(d1,
            style: TextStyle(
                color: colorpercent,
                fontSize: fontgeneral,
                fontWeight: FontWeight.normal,
                fontFamily: phetsarath)),
        const SizedBox(
          height: 10,
        ),
        Text(d2,
            style: TextStyle(
                color: colorpercent,
                fontSize: fontgeneral,
                fontWeight: FontWeight.normal,
                fontFamily: phetsarath)),
        const SizedBox(
          height: 10,
        ),
        Text(d3,
            style: TextStyle(
                color: colorpercent,
                fontSize: fontgeneral,
                fontWeight: FontWeight.normal,
                fontFamily: phetsarath)),
        const SizedBox(
          height: 10,
        ),
        Text(d4,
            style: TextStyle(
                color: colorpercent,
                fontSize: fontgeneral,
                fontWeight: FontWeight.normal,
                fontFamily: phetsarath)),
      ],
    );
  }
}

class ListReportAll extends StatelessWidget {
  const ListReportAll({
    Key key,
    this.d1,
    this.d2,
    this.d3,
    this.d4,
    this.title,
    this.color,
    this.fontWeight,
  }) : super(key: key);
  final String title;
  final String d1;
  final String d2;
  final String d3;
  final String d4;
  final FontWeight fontWeight;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
                color: colorblack,
                fontSize: fontgeneral,
                fontWeight: FontWeight.bold,
                fontFamily: phetsarath)),
        const SizedBox(
          height: 10,
        ),
        Text(d1,
            style: TextStyle(
                color: color,
                fontSize: fontgeneral,
                fontWeight: fontWeight,
                fontFamily: phetsarath)),
        const SizedBox(
          height: 10,
        ),
        Text(d2,
            style: TextStyle(
                color: color,
                fontSize: fontgeneral,
                fontWeight: fontWeight,
                fontFamily: phetsarath)),
        const SizedBox(
          height: 10,
        ),
        Text(d3,
            style: TextStyle(
                color: color,
                fontSize: fontgeneral,
                fontWeight: fontWeight,
                fontFamily: phetsarath)),
        const SizedBox(
          height: 10,
        ),
        Text(d4,
            style: TextStyle(
                color: color,
                fontSize: fontgeneral,
                fontWeight: fontWeight,
                fontFamily: phetsarath)),
      ],
    );
  }
}
