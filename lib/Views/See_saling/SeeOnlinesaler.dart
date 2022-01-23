// ignore_for_file: file_names, unused_field, annotate_overrides
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lotterymanagement/AlertDialogs/CustomDialog.dart';
import 'package:lotterymanagement/Colors/Colors.dart';
import 'package:lotterymanagement/Controllers/Install_Open/InputNumberCTR.dart';
import 'package:lotterymanagement/Controllers/See_saling/SeeOnlinesalerCTR.dart';
import 'package:lotterymanagement/Fonts/Fonts.dart';
import 'package:lotterymanagement/Responsive/Responsive.dart';
import 'package:lotterymanagement/UrlRespose/StatusCodeError.dart';
import 'package:lotterymanagement/Widget/HttpError.dart';
import 'package:lotterymanagement/Widget/Numberformat.dart';
import 'package:lotterymanagement/Widget/PopupDialog.dart';
import 'package:get/get.dart';
import 'package:lotterymanagement/Widget/Tooltip.dart';

class SeeOnlineSaler extends StatefulWidget {
  const SeeOnlineSaler({Key key}) : super(key: key);
  @override
  _SeeOnlineSalerState createState() => _SeeOnlineSalerState();
}

class _SeeOnlineSalerState extends State<SeeOnlineSaler> {
  SeeOnlineSalerCTR seeonline = Get.put(SeeOnlineSalerCTR());
  InputNumberCTR inputnum = Get.put(InputNumberCTR());
  @override
  void initState() {
    inputnum.getNumber().then((value) {
      seeonline.statusCode(value);
      if (value == "200") {
        seeonline.period(inputnum.currentperiod[0].periodNumber.toString());
        seeonline.getRealtimesaler(seeonline.period.value).then((value) {
          seeonline.onloading(value);
          if (seeonline.onloading.value == "error") {
            seeonline.timercount.value = 0;
          } else if (seeonline.onloading.value != "200") {
            seeonline.timercount.value = 0;
          } else {
            seeonline.timercount.value = 10;
            if (seeonline.timercount.value == 10) {
              if (mounted) {
                seeonline.time =
                    Timer.periodic(const Duration(seconds: 1), (timer) {
                  setState(() {
                    if (seeonline.timercount.value > 0) {
                      seeonline.timercount--;
                    } else {
                      seeonline
                          .getRealtimesaler(seeonline.period.value)
                          .then((value) => seeonline.onloading(value));
                      seeonline.timercount.value = 10;
                      // user.time.cancel();
                    }
                  });
                });
              }
            }
          }
        });
      } else {
        seeonline.onloading("");
        CustomDialogs.errorDialogs(context, " ບໍພົບງວດຂາຍ !");
      }
    });
    seeonline.menu.disable(true);
    super.initState();
  }

  @override
  void dispose() {
    if (seeonline.onloading.value != "") {
      seeonline.time.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => seeonline.statusCode.value == "error"
          ? HttpError(
              title: StatusCodeText.httpError,
            )
          : seeonline.statusCode.value == "500"
              ? HttpError(
                  title: StatusCodeText.httpError,
                )
              : Scaffold(
                  backgroundColor: colorbackground,
                  appBar: Responsive.isMobile(context)
                      ? AppBar(
                          backgroundColor: colorbackground,
                          centerTitle: true,
                          leading: InkWell(
                            onTap: () {
                              seeonline.menu.controllMenu();
                            },
                            child: const Icon(
                              Icons.menu,
                              color: colorblack,
                              size: 33,
                            ),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "ເບີ່ງຂໍ້ມູນຂາຍ ${seeonline.timercount.value.toString()}",
                                  style: TextStyle(
                                      fontFamily: phetsarath,
                                      color: colorblack,
                                      fontSize: fontmenu,
                                      fontWeight: FontWeight.bold)),
                              PopupMenuButton(
                                itemBuilder: (context) {
                                  return [
                                    PopupMenuItem(
                                      enabled: false,
                                      child: Center(
                                        child: SizedBox(
                                          child: Column(
                                            children: [
                                              const Icon(
                                                Icons.account_circle,
                                                color: colorblack,
                                                size: 40,
                                              ),
                                              Text(
                                                "ຂໍ້ມູນຜູ້ໃຊ້",
                                                style: TextStyle(
                                                    fontFamily: phetsarath,
                                                    color: colorblack,
                                                    fontSize: fontgeneral,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                "ຊື່ຜູ້ໃຊ້ ${seeonline.menu.user.value}",
                                                style: TextStyle(
                                                    fontFamily: phetsarath,
                                                    color: colordarkblue,
                                                    fontSize: fontgeneral,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                "ອີເມລ ${seeonline.menu.email.value}",
                                                style: TextStyle(
                                                    fontFamily: phetsarath,
                                                    color: colordarkblue,
                                                    fontSize: fontgeneral,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Get.offAllNamed("/login");
                                                },
                                                child: const Icon(
                                                  Icons.exit_to_app,
                                                  color: colorred,
                                                  size: 30,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ];
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                offset: const Offset(0, 50),
                                color: colorbackground,
                                tooltip: 'info',
                                child: const Icon(
                                  Icons.account_circle,
                                  color: colorblack,
                                  size: 40,
                                ),
                                initialValue: 2,
                              ),
                            ],
                          ),
                        )
                      : AppBar(
                          backgroundColor: colorbackground,
                          title: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: InfoPopup(
                              hintText: "ຄົ້ນຫາ ລະຫັດ ຊື່ສາຂາ",
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(50),
                              ],
                              title:
                                  "ເບີ່ງຂໍ້ມູນຂາຍ ${seeonline.timercount.value.toString()}",
                              search: seeonline.search,
                              onChanged: (val) {
                                // branch.txtsearch(branch.search.text);
                                // branch.check = false;
                              },
                              onTap: () {
                                // if (branch.search.text != "") {
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
                              "ເບີ່ງການຂາຍປະຈຸບັນ",
                              style: TextStyle(
                                  fontFamily: phetsarath,
                                  color: colordarkblue,
                                  fontSize: fontmenu,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Expanded(
                                child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Card(
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      color: colorwhite,
                                      width: double.infinity,
                                      height: 50,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("ເຄື່ອງຂາຍ",
                                              style: TextStyle(
                                                  color: colorblack,
                                                  fontSize: fontmenu,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: phetsarath)),
                                          Text(
                                              seeonline.onloading.value == ""
                                                  ? "ເຄື່ອງຂາຍທັງຫມົດ : 0"
                                                  : "ເຄື່ອງຂາຍທັງຫມົດ : " +
                                                      Numberformated.formated.format(double
                                                              .parse(seeonline
                                                                  .realtimesalermd[
                                                                      0]
                                                                  .deviceRuning) +
                                                          double.parse(seeonline
                                                              .realtimesalermd[
                                                                  0]
                                                              .deviceUnruning)),
                                              style: TextStyle(
                                                  color: colorblack,
                                                  fontSize: fontmenu,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: phetsarath)),
                                          Text(
                                              seeonline.onloading.value == ""
                                                  ? "ເຄື່ອງທີ່ເປີດຂາຍ : 0"
                                                  : "ເຄື່ອງທີ່ເປີດຂາຍ : " +
                                                      Numberformated.formated.format(
                                                          double.parse(seeonline
                                                              .realtimesalermd[
                                                                  0]
                                                              .deviceRuning)),
                                              style: TextStyle(
                                                  color: colorgreen,
                                                  fontSize: fontmenu,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: phetsarath)),
                                          Tooltips(
                                            message: seeonline
                                                        .onloading.value ==
                                                    ""
                                                ? "ຄິດເປັນເປີເຊັນ : 0"
                                                : (double.parse(seeonline
                                                            .realtimesalermd[0]
                                                            .deviceRuning) *
                                                        100 /
                                                        (double.parse(seeonline
                                                                .realtimesalermd[
                                                                    0]
                                                                .deviceRuning) +
                                                            double.parse(seeonline
                                                                .realtimesalermd[
                                                                    0]
                                                                .deviceUnruning)))
                                                    .toString(),
                                            child: Text(
                                                seeonline.onloading.value == ""
                                                    ? "ຄິດເປັນເປີເຊັນ : 0"
                                                    : "ຄິດເປັນເປີເຊັນ : ${(double.parse(seeonline.realtimesalermd[0].deviceRuning) * 100 / (double.parse(seeonline.realtimesalermd[0].deviceRuning) + double.parse(seeonline.realtimesalermd[0].deviceUnruning))).toString().length >= 5 ? (double.parse(seeonline.realtimesalermd[0].deviceRuning) * 100 / (double.parse(seeonline.realtimesalermd[0].deviceRuning) + double.parse(seeonline.realtimesalermd[0].deviceUnruning))).toString().substring(0, 5) : (double.parse(seeonline.realtimesalermd[0].deviceRuning) * 100 / (double.parse(seeonline.realtimesalermd[0].deviceRuning) + double.parse(seeonline.realtimesalermd[0].deviceUnruning))).toString()}",
                                                style: TextStyle(
                                                    color: colorpercent,
                                                    fontSize: fontmenu,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: phetsarath)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    color: colorwhite,
                                    height: 310,
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const ListViewRealTime(
                                          title: "ປະເພດເລກ",
                                          allquotar: "ລວມເງິນ",
                                          d1: "ເລກ 1 ໂຕ",
                                          d2: "ເລກ 2 ໂຕ",
                                          d3: "ເລກ 3 ໂຕ",
                                          d4: "ເລກ 4 ໂຕ",
                                          d5: "ເລກ 5 ໂຕ",
                                          d6: "ເລກ 6 ໂຕ",
                                        ),
                                        ListViewRealTime(
                                          title: "ໂຄຕ້າ",
                                          allquotar: seeonline
                                                      .onloading.value ==
                                                  ""
                                              ? "0"
                                              : Numberformated.formated.format(
                                                  double.parse(seeonline
                                                      .realtimesalermd[0]
                                                      .allQuota)),
                                          d1: seeonline.onloading.value == ""
                                              ? "0"
                                              : Numberformated.formated.format(
                                                  double.parse(seeonline
                                                      .realtimesalermd[0]
                                                      .quota[0]
                                                      .quota)),
                                          d2: seeonline.onloading.value == ""
                                              ? "0"
                                              : Numberformated.formated.format(
                                                  double.parse(seeonline
                                                      .realtimesalermd[0]
                                                      .quota[1]
                                                      .quota)),
                                          d3: seeonline.onloading.value == ""
                                              ? "0"
                                              : Numberformated.formated.format(
                                                  double.parse(seeonline
                                                      .realtimesalermd[0]
                                                      .quota[2]
                                                      .quota)),
                                          d4: seeonline.onloading.value == ""
                                              ? "0"
                                              : Numberformated.formated.format(
                                                  double.parse(seeonline
                                                      .realtimesalermd[0]
                                                      .quota[3]
                                                      .quota)),
                                          d5: seeonline.onloading.value == ""
                                              ? "0"
                                              : Numberformated.formated.format(
                                                  double.parse(seeonline
                                                      .realtimesalermd[0]
                                                      .quota[4]
                                                      .quota)),
                                          d6: seeonline.onloading.value == ""
                                              ? "0"
                                              : Numberformated.formated.format(
                                                  double.parse(seeonline
                                                      .realtimesalermd[0]
                                                      .quota[5]
                                                      .quota)),
                                        ),
                                        ListViewRealTime(
                                          title: "ມູນຄ່າຂາຍໄດ້",
                                          color: colorgreen,
                                          allquotar: seeonline
                                                      .onloading.value ==
                                                  ""
                                              ? "0"
                                              : Numberformated.formated.format(
                                                  double.parse(seeonline
                                                      .realtimesalermd[0]
                                                      .allSale)),
                                          d1: seeonline.onloading.value == ""
                                              ? "0"
                                              : Numberformated.formated.format(
                                                  double.parse(seeonline
                                                      .realtimesalermd[0]
                                                      .salevalue
                                                      .sd1)),
                                          d2: seeonline.onloading.value == ""
                                              ? "0"
                                              : Numberformated.formated.format(
                                                  double.parse(seeonline
                                                      .realtimesalermd[0]
                                                      .salevalue
                                                      .sd2)),
                                          d3: seeonline.onloading.value == ""
                                              ? "0"
                                              : Numberformated.formated.format(
                                                  double.parse(seeonline
                                                      .realtimesalermd[0]
                                                      .salevalue
                                                      .sd3)),
                                          d4: seeonline.onloading.value == ""
                                              ? "0"
                                              : Numberformated.formated.format(
                                                  double.parse(seeonline
                                                      .realtimesalermd[0]
                                                      .salevalue
                                                      .sd4)),
                                          d5: seeonline.onloading.value == ""
                                              ? "0"
                                              : Numberformated.formated.format(
                                                  double.parse(seeonline
                                                      .realtimesalermd[0]
                                                      .salevalue
                                                      .sd5)),
                                          d6: seeonline.onloading.value == ""
                                              ? "0"
                                              : Numberformated.formated.format(
                                                  double.parse(seeonline
                                                      .realtimesalermd[0]
                                                      .salevalue
                                                      .sd6)),
                                        ),
                                        PercentTooltip(seeonline: seeonline)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
    );
  }
}

class PercentTooltip extends StatelessWidget {
  const PercentTooltip({
    Key key,
    @required this.seeonline,
  }) : super(key: key);

  final SeeOnlineSalerCTR seeonline;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("ເປີເຊັນຂາຍ",
            style: TextStyle(
                color: colorblack,
                fontSize: fontmenu,
                fontWeight: FontWeight.bold,
                fontFamily: phetsarath)),
        const SizedBox(
          height: 10,
        ),
        Tooltips(
          message: seeonline.onloading.value == ""
              ? "0"
              : seeonline.realtimesalermd[0].percentSaleAll,
          child: Text(
              seeonline.onloading.value == ""
                  ? "0"
                  : seeonline.realtimesalermd[0].percentSaleAll.length >= 5
                      ? seeonline.realtimesalermd[0].percentSaleAll
                          .substring(0, 5)
                      : seeonline.realtimesalermd[0].percentSaleAll,
              style: TextStyle(
                  color: colorpercent,
                  fontSize: fontmenu,
                  fontWeight: FontWeight.normal,
                  fontFamily: phetsarath)),
        ),
        const SizedBox(
          height: 10,
        ),
        Tooltips(
          message: seeonline.onloading.value == ""
              ? "0"
              : seeonline.realtimesalermd[0].percent.pd1,
          child: Text(
              seeonline.onloading.value == ""
                  ? "0"
                  : seeonline.realtimesalermd[0].percent.pd1.length >= 5
                      ? seeonline.realtimesalermd[0].percent.pd1.substring(0, 5)
                      : seeonline.realtimesalermd[0].percent.pd1,
              style: TextStyle(
                  color: colorpercent,
                  fontSize: fontmenu,
                  fontWeight: FontWeight.normal,
                  fontFamily: phetsarath)),
        ),
        const SizedBox(
          height: 10,
        ),
        Tooltips(
          message: seeonline.onloading.value == ""
              ? "0"
              : seeonline.realtimesalermd[0].percent.pd2,
          child: Text(
              seeonline.onloading.value == ""
                  ? "0"
                  : seeonline.realtimesalermd[0].percent.pd2.length >= 5
                      ? seeonline.realtimesalermd[0].percent.pd2.substring(0, 5)
                      : seeonline.realtimesalermd[0].percent.pd2,
              style: TextStyle(
                  color: colorpercent,
                  fontSize: fontmenu,
                  fontWeight: FontWeight.normal,
                  fontFamily: phetsarath)),
        ),
        const SizedBox(
          height: 10,
        ),
        Tooltips(
          message: seeonline.onloading.value == ""
              ? "0"
              : seeonline.realtimesalermd[0].percent.pd3,
          child: Text(
              seeonline.onloading.value == ""
                  ? "0"
                  : seeonline.realtimesalermd[0].percent.pd3.length >= 5
                      ? seeonline.realtimesalermd[0].percent.pd3.substring(0, 5)
                      : seeonline.realtimesalermd[0].percent.pd3,
              style: TextStyle(
                  color: colorpercent,
                  fontSize: fontmenu,
                  fontWeight: FontWeight.normal,
                  fontFamily: phetsarath)),
        ),
        const SizedBox(
          height: 10,
        ),
        Tooltips(
          message: seeonline.onloading.value == ""
              ? "0"
              : seeonline.realtimesalermd[0].percent.pd4,
          child: Text(
              seeonline.onloading.value == ""
                  ? "0"
                  : seeonline.realtimesalermd[0].percent.pd4.length >= 5
                      ? seeonline.realtimesalermd[0].percent.pd4.substring(0, 5)
                      : seeonline.realtimesalermd[0].percent.pd4,
              style: TextStyle(
                  color: colorpercent,
                  fontSize: fontmenu,
                  fontWeight: FontWeight.normal,
                  fontFamily: phetsarath)),
        ),
        const SizedBox(
          height: 10,
        ),
        Tooltips(
          message: seeonline.onloading.value == ""
              ? "0"
              : seeonline.realtimesalermd[0].percent.pd5,
          child: Text(
              seeonline.onloading.value == ""
                  ? "0"
                  : seeonline.realtimesalermd[0].percent.pd5.length >= 5
                      ? seeonline.realtimesalermd[0].percent.pd5.substring(0, 5)
                      : seeonline.realtimesalermd[0].percent.pd5,
              style: TextStyle(
                  color: colorpercent,
                  fontSize: fontmenu,
                  fontWeight: FontWeight.normal,
                  fontFamily: phetsarath)),
        ),
        const SizedBox(
          height: 10,
        ),
        Tooltips(
          message: seeonline.onloading.value == ""
              ? "0"
              : seeonline.realtimesalermd[0].percent.pd6,
          child: Text(
              seeonline.onloading.value == ""
                  ? "0"
                  : seeonline.realtimesalermd[0].percent.pd6.length >= 5
                      ? seeonline.realtimesalermd[0].percent.pd6.substring(0, 5)
                      : seeonline.realtimesalermd[0].percent.pd6,
              style: TextStyle(
                  color: colorpercent,
                  fontSize: fontmenu,
                  fontWeight: FontWeight.normal,
                  fontFamily: phetsarath)),
        ),
      ],
    );
  }
}

class ListViewRealTime extends StatelessWidget {
  const ListViewRealTime({
    Key key,
    this.allquotar,
    this.d1,
    this.d2,
    this.d3,
    this.d4,
    this.d5,
    this.d6,
    this.title,
    this.color,
  }) : super(key: key);
  final String title;
  final String allquotar;
  final String d1;
  final String d2;
  final String d3;
  final String d4;
  final String d5;
  final String d6;
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
                fontSize: fontmenu,
                fontWeight: FontWeight.bold,
                fontFamily: phetsarath)),
        const SizedBox(
          height: 10,
        ),
        Text(allquotar,
            style: TextStyle(
                color: color,
                fontSize: fontmenu,
                fontWeight: FontWeight.normal,
                fontFamily: phetsarath)),
        const SizedBox(
          height: 10,
        ),
        Text(d1,
            style: TextStyle(
                color: color,
                fontSize: fontmenu,
                fontWeight: FontWeight.normal,
                fontFamily: phetsarath)),
        const SizedBox(
          height: 10,
        ),
        Text(d2,
            style: TextStyle(
                color: color,
                fontSize: fontmenu,
                fontWeight: FontWeight.normal,
                fontFamily: phetsarath)),
        const SizedBox(
          height: 10,
        ),
        Text(d3,
            style: TextStyle(
                color: color,
                fontSize: fontmenu,
                fontWeight: FontWeight.normal,
                fontFamily: phetsarath)),
        const SizedBox(
          height: 10,
        ),
        Text(d4,
            style: TextStyle(
                color: color,
                fontSize: fontmenu,
                fontWeight: FontWeight.normal,
                fontFamily: phetsarath)),
        const SizedBox(
          height: 10,
        ),
        Text(d5,
            style: TextStyle(
                color: color,
                fontSize: fontmenu,
                fontWeight: FontWeight.normal,
                fontFamily: phetsarath)),
        const SizedBox(
          height: 10,
        ),
        Text(d6,
            style: TextStyle(
                color: color,
                fontSize: fontmenu,
                fontWeight: FontWeight.normal,
                fontFamily: phetsarath)),
      ],
    );
  }
}
