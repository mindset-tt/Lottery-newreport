// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotterymanagement/Controllers/MenuCTR.dart';
import 'package:http/http.dart' as http;
import 'package:lotterymanagement/Models/PaymentAwordMD.dart';
import 'package:lotterymanagement/UrlRespose/Http_Url.dart';

class PayAwardCTR extends GetxController {
  RxString statusCode = "".obs;
  RxString empty = "".obs;
  RxBool onTap = false.obs;
  RxString txtsearch = "".obs;
  RxString loadingperoid = "".obs;
  RxString onloading = "".obs;
  RxString dateperoid = "".obs;
  RxString numberperoid = "".obs;
  RxString getperiod = "".obs;
  var search = TextEditingController();
  var barcode = TextEditingController();
  var f2 = FocusNode();
  MenuCTR menu = Get.put(MenuCTR());
  var paymentawordmd = List<PaymentAwordMd>().obs;
  void clear() {
    // loadingperoid("");
    barcode.clear();
     onloading("");
  }

  Future<String> getPayment(String billnumber, String periodnumber) async {
    try {
      var data = await http.get(
          Uri.parse(
              "${HttpUrl.httpurl}${HttpUrl.paymentaword}/$billnumber/$periodnumber"),
          headers: {
            'Authorization': 'Bearer ${menu.token}',
          });
      if (data.statusCode == 200) {
        var jsonData = data.body;
        var values = paymentAwordMdFromJson(jsonData);
        paymentawordmd.value = values;
        return statusCode(data.statusCode.toString());
      } else {
        return statusCode(data.statusCode.toString());
      }
    } catch (e) {
      return statusCode("error");
    }
  }

  Future<String> postPayment(
      String devicecode,
      String billnumber,
      String moneypay,
      String percent,
      String periodnumber,
      String createby) async {
    try {
      var data = await http.post(
        Uri.parse("${HttpUrl.httpurl}${HttpUrl.paymentaword}"),
        body: {
          "device_code": devicecode,
          "bill_number": billnumber,
          "money_pay": moneypay,
          "percent": percent,
          "period_number": periodnumber,
          "create_by": createby
        },
        headers: {
          'Authorization': 'Bearer ${menu.token}',
        },
      );
      if (data.statusCode == 200) {
        return statusCode(data.statusCode.toString());
      } else {
        return statusCode(data.statusCode.toString());
      }
    } catch (e) {
      return statusCode("error");
    }
  }
}
