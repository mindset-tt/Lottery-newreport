// ignore_for_file: file_names, prefer_collection_literals
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lotterymanagement/Controllers/MenuCTR.dart';
import 'package:lotterymanagement/Models/CurrentperiodMD.dart';
import 'package:lotterymanagement/UrlRespose/Http_Url.dart';
class InputNumberCTR extends GetxController {
  RxString statusCode = "".obs;
  RxString empty = "".obs;
  RxString onloading = "".obs;
  RxString online = "".obs;
  RxBool onUpdates = false.obs;
  var number = TextEditingController();
  var search = TextEditingController();
  var f1 = FocusNode();
  MenuCTR menu = Get.put(MenuCTR());
  var currentperiod = List<CerrentperiodMd>().obs;

  Future<String> closeSelling() async {
    try {
      var data = await http.put(
          Uri.parse("${HttpUrl.httpurl}${HttpUrl.period}/close-selling"),
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

  Future<String> getNumber() async {
    try {
      var data = await http.get(
          Uri.parse("${HttpUrl.httpurl}${HttpUrl.currentperiod}"),
          headers: {
            'Authorization': 'Bearer ${menu.token}',
          });
      if (data.statusCode == 200) {
        var jsonData = data.body;
        var values = cerrentperiodMdFromJson(jsonData);
        currentperiod.value = values;
        return statusCode(data.statusCode.toString());
      } else {
        return statusCode(data.statusCode.toString());
      }
    } catch (e) {
      return statusCode("error");
    }
  }

  Future<String> postInputNumber(String lotterynumber, String periodnumber, String addby) async {
    try {
      var data = await http
          .post(Uri.parse("${HttpUrl.httpurl}${HttpUrl.lottery}"), body: {
        "lottery_number": lotterynumber,
        "period_number": periodnumber,
        "add_by": addby,
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

  Future<String> updatecloseperiod(String id) async {
    try {
      var data = await http.put(
          Uri.parse(
              "${HttpUrl.httpurl}${HttpUrl.period}/close-current-period/$id"),
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

  Future<String> postcalculatesale(String periodnumber) async {
    try {
      var data = await http.post(
          Uri.parse(
              "${HttpUrl.httpurl}${HttpUrl.lottery}/caculate_sale/$periodnumber"),
          headers: {
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

  Future<String> postcalculateWin(
      String lotterynumber, String periodnumber) async {
    try {
      var data = await http.post(
          Uri.parse(
              "${HttpUrl.httpurl}${HttpUrl.lottery}/caculate_win/$lotterynumber/$periodnumber"),
          headers: {
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
}
