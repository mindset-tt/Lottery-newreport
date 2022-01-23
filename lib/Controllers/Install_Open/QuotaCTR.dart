// ignore_for_file: file_names, prefer_collection_literals
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotterymanagement/Controllers/MenuCTR.dart';
import 'package:lotterymanagement/Models/QuotaMD.dart';
import 'package:http/http.dart' as http;
import 'package:lotterymanagement/UrlRespose/Http_Url.dart';

class QuotaCTR extends GetxController {
  RxString statusCode = "".obs;
  RxString empty = "".obs;
  RxString updates = "".obs;
  RxBool onTap = false.obs;
  var quotamd = List<QuotaMd>().obs;
  MenuCTR menu = Get.put(MenuCTR());
  var search = TextEditingController();
  var dt1 = TextEditingController();
  var dt2 = TextEditingController();
  var dt3 = TextEditingController();
  var dt4 = TextEditingController();
  var dt5 = TextEditingController();
  var dt6 = TextEditingController();
  var f1 = FocusNode();
  var f2 = FocusNode();
  var f3 = FocusNode();
  var f4 = FocusNode();
  var f5 = FocusNode();
  var f6 = FocusNode();
  clear() {
    dt1.text = "";
    dt2.text = "";
    dt3.text = "";
    dt4.text = "";
    dt5.text = "";
    dt6.text = "";
    empty("");
  }

  Future<String> getallquota() async {
    try {
      var data = await http
          .get(Uri.parse("${HttpUrl.httpurl}${HttpUrl.quota}"), headers: {
        'Authorization': 'Bearer ${menu.token}',
      });
      if (data.statusCode == 200) {
        var jsonData = data.body;
        var values = quotaMdFromJson(jsonData);
        quotamd.value = values;
        return statusCode(data.statusCode.toString());
      } else {
        return statusCode(data.statusCode.toString());
      }
    } catch (e) {
      return statusCode("error");
    }
  }

  Future<String> quotaupdate(
      String n1, String n2, String n3, String n4, String n5, String n6) async {
    try {
      List<Quotaarray> tags = [
        Quotaarray(int.parse(n1)),
        Quotaarray(int.parse(n2)),
        Quotaarray(int.parse(n3)),
        Quotaarray(int.parse(n4)),
        Quotaarray(int.parse(n5)),
        Quotaarray(int.parse(n6)),
      ];
      var json = jsonEncode(tags);
      var data = await http.put(
          Uri.parse(
            "${HttpUrl.httpurl}${HttpUrl.quota}",
          ),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${menu.token}',
          },
          body: json);
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

class Quotaarray {
  int maxvalues;
  Quotaarray(this.maxvalues);
  Map toJson() => {
        "max_values": maxvalues,
      };
}
