// ignore_for_file: file_names, prefer_collection_literals
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lotterymanagement/Controllers/MenuCTR.dart';
import 'package:lotterymanagement/Models/UnitMD.dart';
import 'package:lotterymanagement/UrlRespose/Http_Url.dart';

class BlockUserCTR extends GetxController {
  RxString statusCode = "".obs;
  RxString empty = "".obs;
  RxString txtsearch = "".obs;
  RxString onloading = "".obs;
  RxBool onlTab = false.obs;
  RxString selected = "".obs;
  RxString itemselect = "".obs;
  String branch, unit;
  bool check = false;
  var search = TextEditingController();
  MenuCTR menu = Get.put(MenuCTR());
  var unitmd = List<UnitMd>().obs;
  void clear() {
    branch = null;
    unit = null;
    selected("");
    txtsearch("");
    search.clear();
  }

  Future<String> getbybranch(String id) async {
    try {
      var data = await http.get(
          Uri.parse("${HttpUrl.httpurl}${HttpUrl.unit}/bybranch/$id"),
          headers: {
            'Authorization': 'Bearer ${menu.token}',
          });
      if (data.statusCode == 200) {
        var jsonData = data.body;
        var values = unitMdFromJson(jsonData);
        unitmd.value = values;
        return statusCode(data.statusCode.toString());
      } else {
        return statusCode(data.statusCode.toString());
      }
    } catch (e) {
      return statusCode("error");
    }
  }

  Future<String> onBlockuser(String id) async {
    try {
      var data = await http.put(
          Uri.parse("${HttpUrl.httpurl}${HttpUrl.seller}/block/$id"),
          headers: {
            'Authorization': 'Bearer ${menu.token}',
          });
      if (data.statusCode == 200) {
        return statusCode(data.statusCode.toString());
      } else {
        return statusCode(data.statusCode.toString());
      }
    } catch (e) {
      return statusCode("error");
    }
  }

  Future<String> onUnBlockuser(String id) async {
    try {
      var data = await http.put(
          Uri.parse("${HttpUrl.httpurl}${HttpUrl.seller}/unblock/$id"),
          headers: {
            'Authorization': 'Bearer ${menu.token}',
          });
      if (data.statusCode == 200) {
        return statusCode(data.statusCode.toString());
      } else {
        return statusCode(data.statusCode.toString());
      }
    } catch (e) {
      return statusCode("error");
    }
  }

  Future<String> onMoveuser(String unitid, String uid) async {
    try {
      var data = await http.put(
          Uri.parse("${HttpUrl.httpurl}${HttpUrl.moveuser}/$unitid/$uid"),
          headers: {
            'Authorization': 'Bearer ${menu.token}',
          });
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
