// ignore_for_file: file_names, prefer_collection_literals, avoid_print
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lotterymanagement/Controllers/MenuCTR.dart';
import 'package:lotterymanagement/Models/UnitMD.dart';
import 'package:lotterymanagement/UrlRespose/Http_Url.dart';

class SettingUnitCTR extends GetxController {
  RxString statusCode = "".obs;
  RxString empty = "".obs;
  RxString txtsearch = "".obs;
  RxString onloading = "".obs;
  RxString defaultpercent = "0".obs;
  RxBool onTap = false.obs;
  RxBool onDeleted = false.obs;
  bool check = false;
  MenuCTR menu = Get.put(MenuCTR());
  var unitmd = List<UnitMd>().obs;
  var search = TextEditingController();
  var percent = TextEditingController();
  var unitname = TextEditingController();
  var phone = TextEditingController();
  var address = TextEditingController();
  var email = TextEditingController();
  var f2 = FocusNode();
  var f3 = FocusNode();
  var f4 = FocusNode();
  var f5 = FocusNode();
  var f6 = FocusNode();
  String branch, id = "";
  void clear() {
    id = "";
    defaultpercent("0");
    percent.clear();
    phone.clear();
    unitname.clear();
    address.clear();
    email.clear();
    empty("");
    txtsearch.value = "";
    search.text = "";
  }

  Future<String> gatallunit() async {
    try {
      var data = await http
          .get(Uri.parse("${HttpUrl.httpurl}${HttpUrl.unit}"), headers: {
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

  Future<String> postunit(
      String branchid,
      String serviceunitname,
      String villagename,
      String createby,
      String tel1,
      String supercent,
      String suemail) async {
    try {
      var data = await http
          .post(Uri.parse("${HttpUrl.httpurl}${HttpUrl.unit}"), body: {
        "branch_id": branchid,
        "service_unit_name": serviceunitname,
        "village_name": villagename,
        "create_by": createby,
        "tel1": tel1,
        "su_percent": supercent,
        "su_email": suemail
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

  Future<String> deleteunit(String suid) async {
    try {
      var data = await http
          .put(Uri.parse("${HttpUrl.httpurl}${HttpUrl.unit}/$suid"), headers: {
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

  Future<String> updateunit(
      String suid,
      String branchid,
      String serviceunitname,
      String villagename,
      String createby,
      String tel1,
      String supercent,
      String suemail) async {
    try {
      var data =
          await http.put(Uri.parse("${HttpUrl.httpurl}${HttpUrl.unit}"), body: {
        "su_id": suid,
        "branch_id": branchid,
        "service_unit_name": serviceunitname,
        "village_name": villagename,
        "create_by": createby,
        "tel1": tel1,
        "su_percent": supercent,
        "su_email": suemail
      }, headers: {
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
