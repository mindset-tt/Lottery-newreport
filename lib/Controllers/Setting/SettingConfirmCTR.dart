// ignore_for_file: file_names, prefer_collection_literals, must_call_super
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lotterymanagement/Controllers/MenuCTR.dart';
import 'package:lotterymanagement/Models/DeviceforauthorMD.dart';
import 'package:lotterymanagement/UrlRespose/Http_Url.dart';

class SettingConfirmCTR extends GetxController {
  RxString statusCode = "".obs;
  RxString txtsearch = "".obs;
  RxString onloading = "".obs;
  bool check = false;
  RxBool onTap = false.obs;
  MenuCTR menu = Get.put(MenuCTR());
  var listdeviceauthor = List<DeviceForAuthoriseMd>().obs;
  var search = TextEditingController();
  var secondsearch = TextEditingController();
  String machine, id = "";
  void clear() {
    search.text = "";
    secondsearch.text = "";
  }

  Future<String> getallDeviceAuth() async {
    try {
      var data = await http.get(
          Uri.parse("${HttpUrl.httpurl}${HttpUrl.deviceforauthorise}"),
          headers: {
            'Authorization': 'Bearer ${menu.token}',
          });
      if (data.statusCode == 200) {
        var jsonData = data.body;
        var values = deviceForAuthoriseMdFromJson(jsonData);
        listdeviceauthor.value = values;
        return statusCode(data.statusCode.toString());
      } else {
        return statusCode(data.statusCode.toString());
      }
    } catch (e) {
      return statusCode("error");
    }
  }

  Future<String> confirmdevice(String id) async {
    try {
      var data = await http.put(
          Uri.parse("${HttpUrl.httpurl}${HttpUrl.authorisedevice}/$id"),
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
