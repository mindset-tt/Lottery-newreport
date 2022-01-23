// ignore_for_file: file_names
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lotterymanagement/Controllers/MenuCTR.dart';
import 'package:lotterymanagement/Models/RealtimeSalerMD.dart';
import 'package:lotterymanagement/UrlRespose/Http_Url.dart';

class SeeOnlineSalerCTR extends GetxController {
  RxString statusCode = "".obs;
  RxString empty = "".obs;
  RxString onloading = "".obs;
  RxString period = "".obs;
  RxInt timercount = 0.obs;
  Timer time;
  var search = TextEditingController();
  var realtimesalermd = List<RealtimeSalerMd>().obs;
  MenuCTR menu = Get.put(MenuCTR());
  Future<String> getRealtimesaler(String period) async {
    try {
      var data = await http.get(
          Uri.parse("${HttpUrl.httpurl}${HttpUrl.realtimesaler}/$period"),
          headers: {
            'Authorization': 'Bearer ${menu.token}',
          });
      if (data.statusCode == 200) {
        var jsonData = data.body;
        var values = realtimeSalerMdFromJson(jsonData);
        realtimesalermd.value = values;
        return statusCode(data.statusCode.toString());
      } else {
        return statusCode(data.statusCode.toString());
      }
    } catch (e) {
      print(e);
      return statusCode("error");
    }
  }
}
