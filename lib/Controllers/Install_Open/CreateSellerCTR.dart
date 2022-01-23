// ignore_for_file: file_names, prefer_collection_literals
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lotterymanagement/Controllers/MenuCTR.dart';
import 'package:lotterymanagement/Models/PeriodMD.dart';
import 'package:lotterymanagement/UrlRespose/Http_Url.dart';

class CreateSellerCTR extends GetxController {
  RxString statusCode = "".obs;
  RxString empty = "".obs;
  MenuCTR menu = Get.put(MenuCTR());
  var periodmd = List<PeriodMd>().obs;
  var search = TextEditingController();
  var timeopen = TextEditingController();
  var payment = TextEditingController();
  RxBool onDeleted = false.obs;
  var paymentshow = TextEditingController();
  var datetime = TextEditingController();
  RxBool onTap = false.obs;
  RxString txtsearch = "".obs;
  RxString onloading = "".obs;
  bool check = false;
  RxString dateinput = "".obs;
  var f1 = FocusNode();
  var f2 = FocusNode();
  var f3 = FocusNode();
  void clear() {
    timeopen.text = "20:00:00";
    payment.text = "";
    paymentshow.text = "10";
    dateinput.value = "";
  }
  Future<String> getCreatesaler() async {
    try {
      var data = await http
          .get(Uri.parse("${HttpUrl.httpurl}${HttpUrl.lottery}"), headers: {
        'Authorization': 'Bearer ${menu.token}',
      });
      if (data.statusCode == 200) {
        var jsonData = data.body;
        var values = periodMdFromJson(jsonData);
        periodmd.value = values;

        return statusCode(data.statusCode.toString());
      } else {
        return statusCode(data.statusCode.toString());
      }
    } catch (e) {
      return statusCode("error");
    }
  }
  
  Future<String> postCreateSaler(String periodnumber, String dateoffline,String timeoffline, String createby, String timeaword) async {
    try {
      var data = await http
          .post(Uri.parse("${HttpUrl.httpurl}${HttpUrl.period}/open"), body: {
        "period_number": periodnumber,
        "date_offline": dateoffline,
        "time_offline": timeoffline,
        "create_by": createby,
        "dayExpire": timeaword
      }, headers: {
        'Authorization': 'Bearer ${menu.token}',
      });
      if (data.statusCode == 201) {
        return data.statusCode.toString();
      } else {
        return data.statusCode.toString();
      }
    } catch (e) {
      return statusCode("error");
    }
  }

  Future<String> deleteCreateSaler(String onlineid) async {
    try {
      var data = await http.delete(
          Uri.parse("${HttpUrl.httpurl}${HttpUrl.period}/$onlineid"),
          headers: {
            'Authorization': 'Bearer ${menu.token}',
          });
      if (data.statusCode == 200) {
        return data.statusCode.toString();
      } else {
        return data.statusCode.toString();
      }
    } catch (e) {
      return statusCode("error");
    }
  }
}
