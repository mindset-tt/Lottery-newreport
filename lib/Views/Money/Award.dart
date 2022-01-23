// ignore_for_file: file_names, must_be_immutable, prefer_is_empty
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:lotterymanagement/AlertDialogs/CustomDialog.dart';
import 'package:lotterymanagement/Colors/Colors.dart';
import 'package:lotterymanagement/Controllers/Install_Open/CreateSellerCTR.dart';
import 'package:lotterymanagement/Controllers/PayAward/PayAwardCTR.dart';
import 'package:lotterymanagement/Fonts/Fonts.dart';
import 'package:lotterymanagement/UrlRespose/StatusCodeError.dart';
import 'package:lotterymanagement/Widget/Button.dart';
import 'package:lotterymanagement/Widget/HttpError.dart';
import 'package:lotterymanagement/Widget/Numberformat.dart';
import 'package:lotterymanagement/Widget/PopupDialog.dart';
import 'package:get/get.dart';
import 'package:lotterymanagement/Widget/Textfield.dart';
class AwardPayment extends StatefulWidget {
  const AwardPayment({Key key}) : super(key: key);
  @override
  _AwardPaymentState createState() => _AwardPaymentState();
}

class _AwardPaymentState extends State<AwardPayment> {
  PayAwardCTR award = Get.put(PayAwardCTR());
  CreateSellerCTR peroid = Get.put(CreateSellerCTR());
  @override
  void initState() {
    award.menu.disable(true);
    peroid.getCreatesaler().then((value) {
      if (value == "200") {
        award.loadingperoid(value);
        award.getperiod(peroid.periodmd[0].periodNumber.toString());
        award.numberperoid(peroid.periodmd[0].lotteryNumber.toString());
        award.dateperoid(peroid.periodmd[0].dateOnline.toString());
      }
    });
    award.clear();
    super.initState();
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
                  backgroundColor: colorbackground,
                  appBar: AppBar(
                    backgroundColor: colorbackground,
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: InfoPopup(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(50),
                        ],
                        title: "ການເງິນ",
                        search: award.search,
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
                      child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width,
                      color: colorbackground,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(right: 50, left: 50, top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "ກວດຈ່າຍເງິນລາງວັນ",
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
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Container(
                                    width: 130,
                                    height: 42,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all()),
                                    child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                      borderRadius: BorderRadius.circular(8),
                                      value: award.loadingperoid.value == "200"
                                          ? award.getperiod.value
                                          : null,
                                      hint: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Text("ງວດ: ",
                                            style: TextStyle(
                                                color: award.empty.value == "1"
                                                    ? colorred
                                                    : colorblack,
                                                fontSize: fontmenu,
                                                fontFamily: phetsarath)),
                                      ),
                                      items: award.loadingperoid.value == "200"
                                          ? peroid.periodmd.map((document) {
                                              return DropdownMenuItem(
                                                  onTap: () {
                                                    award.numberperoid(document
                                                        .lotteryNumber
                                                        .toString());
                                                    award.dateperoid(document
                                                        .dateOnline
                                                        .toString());
                                                  },
                                                  value: document.periodNumber,
                                                  child: SizedBox(
                                                    height: 30.0,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20.0),
                                                      child: Text(
                                                          document.periodNumber,
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
                                        peroid.getCreatesaler().then((value) =>
                                            award.loadingperoid(value));
                                        award.getperiod(value1);
                                        award.barcode.clear();
                                        FocusScope.of(context)
                                            .requestFocus(award.f2);
                                      },
                                    )),
                                  ),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                TextDetail(
                                  title: "ງວດ",
                                  color: colorblack,
                                  subtitle: award.getperiod.value == ""
                                      ? "ວ່າງເປົ່າ"
                                      : award.getperiod.value,
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                TextDetail(
                                  title: "ວັນທີ",
                                  color: colorblack,
                                  subtitle: award.dateperoid.value == ""
                                      ? "ວ່າງເປົ່າ"
                                      : DateFormat("dd/MM/yyyy").format(
                                          DateTime.parse(award.dateperoid.value
                                              .toString())),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                TextDetail(
                                  title: "ເລກອອກ",
                                  color: colordarkblue,
                                  subtitle: award.numberperoid.value == ""
                                      ? "ວ່າງເປົ່າ"
                                      : award.numberperoid.value,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Textfield(
                                  onChanged: (values) {
                                    if (award.getperiod.value == "") {
                                      award.empty("1");
                                    } else {
                                      if (award.barcode.text != "") {
                                        FocusScope.of(context)
                                            .requestFocus(award.f2);
                                        award.empty("");
                                        award
                                            .getPayment(award.barcode.text,
                                                award.getperiod.value)
                                            .then((value) {
                                          if (value == "200") {
                                            FocusScope.of(context)
                                                .requestFocus(award.f2);
                                            award.onloading(value);
                                          }
                                        });
                                      } else {
                                        award.onloading("");
                                      }
                                    }
                                  },
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(40),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  hintText: "ເລກບາໂຄດ",
                                  fontFamily: phetsarath,
                                  focusNode: award.f2,
                                  obscureText: false,
                                  bordercolor: colordarkblue,
                                  controller: award.barcode,
                                  fontWeight: FontWeight.normal,
                                  textInputType: TextInputType.text,
                                  size: 250,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "ກວດຈ່າຍລາງວັນ",
                                    style: TextStyle(
                                        fontFamily: phetsarath,
                                        color: colorblack,
                                        fontSize: fontmenu,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 350,
                                  height: 350,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ListNumber(
                                        name: "ເລກ 1 ໂຕ:",
                                        color: award.onloading.value == "200"
                                            ? double.parse(award
                                                        .paymentawordmd[0]
                                                        .winList
                                                        .d1
                                                        .toString()) >
                                                    0
                                                ? colorgreen
                                                : colorblack
                                            : colorblack,
                                        number: award.onloading.value == "200"
                                            ? Numberformated.formated.format(
                                                double.parse(award
                                                    .paymentawordmd[0]
                                                    .winList
                                                    .d1
                                                    .toString()))
                                            : "0",
                                      ),
                                      ListNumber(
                                        name: "ເລກ 2 ໂຕ:",
                                        color: award.onloading.value == "200"
                                            ? double.parse(award
                                                        .paymentawordmd[0]
                                                        .winList
                                                        .d2
                                                        .toString()) >
                                                    0
                                                ? colorgreen
                                                : colorblack
                                            : colorblack,
                                        number: award.onloading.value == "200"
                                            ? Numberformated.formated.format(
                                                double.parse(award
                                                    .paymentawordmd[0]
                                                    .winList
                                                    .d2
                                                    .toString()))
                                            : "0",
                                      ),
                                      ListNumber(
                                        name: "ເລກ 3 ໂຕ:",
                                        color: award.onloading.value == "200"
                                            ? double.parse(award
                                                        .paymentawordmd[0]
                                                        .winList
                                                        .d3
                                                        .toString()) >
                                                    0
                                                ? colorgreen
                                                : colorblack
                                            : colorblack,
                                        number: award.onloading.value == "200"
                                            ? Numberformated.formated.format(
                                                double.parse(award
                                                    .paymentawordmd[0]
                                                    .winList
                                                    .d3
                                                    .toString()))
                                            : "0",
                                      ),
                                      ListNumber(
                                        name: "ເລກ 4 ໂຕ:",
                                        color: award.onloading.value == "200"
                                            ? double.parse(award
                                                        .paymentawordmd[0]
                                                        .winList
                                                        .d4
                                                        .toString()) >
                                                    0
                                                ? colorgreen
                                                : colorblack
                                            : colorblack,
                                        number: award.onloading.value == "200"
                                            ? Numberformated.formated.format(
                                                double.parse(award
                                                    .paymentawordmd[0]
                                                    .winList
                                                    .d4
                                                    .toString()))
                                            : "0",
                                      ),
                                      ListNumber(
                                        name: "ເລກ 5 ໂຕ:",
                                        color: award.onloading.value == "200"
                                            ? double.parse(award
                                                        .paymentawordmd[0]
                                                        .winList
                                                        .d5
                                                        .toString()) >
                                                    0
                                                ? colorgreen
                                                : colorblack
                                            : colorblack,
                                        number: award.onloading.value == "200"
                                            ? Numberformated.formated.format(
                                                double.parse(award
                                                    .paymentawordmd[0]
                                                    .winList
                                                    .d5
                                                    .toString()))
                                            : "0",
                                      ),
                                      ListNumber(
                                        name: "ເລກ 6 ໂຕ:",
                                        color: award.onloading.value == "200"
                                            ? double.parse(award
                                                        .paymentawordmd[0]
                                                        .winList
                                                        .d6
                                                        .toString()) >
                                                    0
                                                ? colorgreen
                                                : colorblack
                                            : colorblack,
                                        number: award.onloading.value == "200"
                                            ? Numberformated.formated.format(
                                                double.parse(award
                                                    .paymentawordmd[0]
                                                    .winList
                                                    .d6
                                                    .toString()))
                                            : "0",
                                      ),
                                      Text(
                                        "ລວມເງິນຖືກລາງວັນ",
                                        style: TextStyle(
                                            fontFamily: phetsarath,
                                            color: colorblack,
                                            fontSize: fontmenu,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        award.onloading.value == "200"
                                            ? Numberformated.formated.format(
                                                double.parse(award
                                                    .paymentawordmd[0]
                                                    .totalPriceAll
                                                    .toString()))
                                            : "0",
                                        style: TextStyle(
                                            fontFamily: phetsarath,
                                            color: colorblack,
                                            fontSize: fonttitle,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 200,
                                ),
                                SizedBox(
                                  width: 300,
                                  height: 330,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "ລວມເງິນທີ່ຕ້ອງຈ່າຍ",
                                              style: TextStyle(
                                                  fontFamily: phetsarath,
                                                  color: colorblack,
                                                  fontSize: fontmenu,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              award.onloading.value == "200"
                                                  ? Numberformated.formated
                                                      .format(double.parse(award
                                                          .paymentawordmd[0]
                                                          .totalPricePay
                                                          .toString()))
                                                  : "0",
                                              style: const TextStyle(
                                                  fontFamily: phetsarath,
                                                  color: colorgreen,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextDetail(
                                              title: "ສະຖານະ",
                                              color:
                                                  award.onloading.value == "200"
                                                      ? award.paymentawordmd[0]
                                                                  .statusPay
                                                                  .toString() ==
                                                              "ຈ່າຍແລ້ວ"
                                                          ? colorgreen
                                                          : colorred
                                                      : colorblack,
                                              subtitle:
                                                  award.onloading.value == "200"
                                                      ? award.paymentawordmd[0]
                                                          .statusPay
                                                          .toString()
                                                      : "ວ່າງເປົ່າ",
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            SizedBox(
                                              width: 300,
                                              child: Button(
                                                height: 42,
                                                title:
                                                    award.onTap.value == false
                                                        ? "ຈ່າຍ"
                                                        : "ລໍຖ້າ...",
                                                colorstype: colorwhite,
                                                fontFamily: phetsarath,
                                                fontSize: fontmenu,
                                                onPressed: () {
                                                  if (award.onloading.value ==
                                                          "200" &&
                                                      award.paymentawordmd[0]
                                                              .totalPricePay
                                                              .toString() !=
                                                          "0") {
                                                    FocusScope.of(context)
                                                        .requestFocus(award.f2);
                                                    CustomDialogs
                                                        .confirmBillDialogs(
                                                            context, () {
                                                      if (award.onTap.value ==
                                                          false) {
                                                        award.onTap(true);
                                                        award
                                                            .postPayment(
                                                                award
                                                                    .paymentawordmd[
                                                                        0]
                                                                    .data[0]
                                                                    .deviceCode,
                                                                award.barcode
                                                                    .text,
                                                                award
                                                                    .paymentawordmd[
                                                                        0]
                                                                    .totalPricePay
                                                                    .toString(),
                                                                award
                                                                    .paymentawordmd[
                                                                        0]
                                                                    .percent
                                                                    .toString(),
                                                                award.getperiod
                                                                    .value,
                                                                award
                                                                    .menu
                                                                    .userid
                                                                    .value)
                                                            .then((value) {
                                                          if (value == "201") {
                                                            Navigator.pop(
                                                                context);
                                                            Get.snackbar(
                                                                "Warning Messages !",
                                                                "",
                                                                messageText: Text(
                                                                    "ສຳເລັດແລ້ວ . . .",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            phetsarath,
                                                                        color:
                                                                            colorblack,
                                                                        fontSize:
                                                                            fontgeneral,
                                                                        fontWeight: FontWeight
                                                                            .normal)),
                                                                maxWidth: 500,
                                                                backgroundColor:
                                                                    colorwhite,
                                                                snackPosition:
                                                                    SnackPosition
                                                                        .TOP,
                                                                icon:
                                                                    const Icon(
                                                                  Icons.message,
                                                                  color:
                                                                      colorgreen,
                                                                ));
                                                            award.clear();
                                                            FocusScope.of(
                                                                    context)
                                                                .requestFocus(
                                                                    award.f2);
                                                            peroid
                                                                .getCreatesaler()
                                                                .then((value) =>
                                                                    award.loadingperoid(
                                                                        value));
                                                          } else if (value ==
                                                              "401") {
                                                            Navigator.pop(
                                                                context);
                                                            CustomDialogs
                                                                .errorDialogs(
                                                                    context,
                                                                    StatusCodeText
                                                                        .statusCodeText401);

                                                            FocusScope.of(
                                                                    context)
                                                                .requestFocus(
                                                                    award.f2);
                                                          } else if (value ==
                                                              "402") {
                                                            Navigator.pop(
                                                                context);
                                                            CustomDialogs
                                                                .errorDialogs(
                                                                    context,
                                                                    " ຫມົດກຳນົດການຈ່າຍລາງວັນແລ້ວ !");

                                                            FocusScope.of(
                                                                    context)
                                                                .requestFocus(
                                                                    award.f2);
                                                          } else if (value ==
                                                              "403") {
                                                            Navigator.pop(
                                                                context);
                                                            CustomDialogs
                                                                .errorDialogs(
                                                                    context,
                                                                    " ຈ່າຍແລ້ວ !");

                                                            FocusScope.of(
                                                                    context)
                                                                .requestFocus(
                                                                    award.f2);
                                                          } else if (value ==
                                                              "404") {
                                                            Navigator.pop(
                                                                context);
                                                            CustomDialogs
                                                                .errorDialogs(
                                                                    context,
                                                                    StatusCodeText
                                                                        .statusCodeText404);

                                                            FocusScope.of(
                                                                    context)
                                                                .requestFocus(
                                                                    award.f2);
                                                          } else {
                                                            Navigator.pop(
                                                                context);
                                                            CustomDialogs
                                                                .errorDialogs(
                                                                    context,
                                                                    StatusCodeText
                                                                        .statusCodeText500);

                                                            FocusScope.of(
                                                                    context)
                                                                .requestFocus(
                                                                    award.f2);
                                                          }
                                                        }).whenComplete(() =>
                                                                award.onTap(
                                                                    false));
                                                      }
                                                    });
                                                  } else {
                                                    CustomDialogs
                                                        .warningDialogs(
                                                            context);
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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

class ListNumber extends StatelessWidget {
  const ListNumber({
    Key key,
    this.name,
    this.number,
    this.color,
  }) : super(key: key);
  final String name, number;
  final Color color;
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
                  color: color,
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

class TextDetail extends StatelessWidget {
  TextDetail({Key key, this.title, this.subtitle, this.color})
      : super(key: key);
  String title;
  String subtitle;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
                color: colorblack, fontSize: fontmenu, fontFamily: phetsarath)),
        const SizedBox(
          width: 20,
        ),
        Text(subtitle,
            style: TextStyle(
                color: color,
                fontSize: fontmenu,
                fontWeight: FontWeight.bold,
                fontFamily: phetsarath)),
      ],
    );
  }
}
