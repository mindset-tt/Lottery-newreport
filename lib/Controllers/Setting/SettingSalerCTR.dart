// ignore_for_file: file_names, prefer_collection_literals, avoid_print
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotterymanagement/Controllers/MenuCTR.dart';
import 'package:lotterymanagement/Models/GetOnlydeviceCTR.dart';
import 'package:lotterymanagement/Models/SellerMD.dart';
import 'package:lotterymanagement/Models/UnitMD.dart';
import 'package:lotterymanagement/UrlRespose/Http_Url.dart';
import 'package:http/http.dart' as http;
class SettingSalerCTR extends GetxController {
  RxString statusCode = "".obs;
  RxString empty = "".obs;
  RxString block = "".obs;
  RxString txtsearch = "".obs;
  RxString selected = "".obs;
  RxString codeSaler = "".obs;
  RxBool onDeleted = false.obs;
  RxString onloading = "".obs;
  RxString onSaveloading = "".obs;
  RxBool onTap = false.obs;
  RxBool eyepass = false.obs;
  RxBool eyecon = false.obs;
  bool check = false;
  var sellermd = List<SellerMd>().obs;
  var unitmd = List<UnitMd>().obs;
  MenuCTR menu = Get.put(MenuCTR());
  var search = TextEditingController();
  var salename = TextEditingController();
  var phone = TextEditingController();
  var address = TextEditingController();
  var passord = TextEditingController();
  var confirmpassord = TextEditingController();
  var maxsale = TextEditingController();
  var f3 = FocusNode();
  //var f4 = FocusNode();
  var f5 = FocusNode();
  var f6 = FocusNode();
  var f7 = FocusNode();
  var f8 = FocusNode();
  String branch, id = "";
  RxString passwordupdate = "".obs;
  String bybranch; //, onlydevice, onlydeviceupdate = ""
  var listgetonlydevice = List<GetonlydeviceMd>().obs;
  void clear() {
    eyepass(false);
    eyecon(false);
    phone.clear();
    salename.clear();
    address.clear();
    passord.clear();
    confirmpassord.clear();
    id = "";
    passwordupdate("");
    empty("");
    // selected("");
    maxsale.text = "3,000,000";
    txtsearch.value = "";
    search.text = "";
    // onlydeviceupdate = "";
    codeSaler("");
  }
  // Future<String> gatonlydevice(String id) async {
  //   try {
  //     var data = await http.get(
  //         Uri.parse(
  //             "${HttpUrl.httpurl}${HttpUrl.emei}/get_only_device_code/$id"),
  //         headers: {
  //           'Authorization': 'Bearer ${menu.token}',
  //         });
  //     if (data.statusCode == 200) {
  //       var jsonData = data.body;
  //       var values = getonlydeviceMdFromJson(jsonData);
  //       listgetonlydevice.value = values;
  //       return statusCode(data.statusCode.toString());
  //     } else {
  //       return statusCode(data.statusCode.toString());
  //     }
  //   } catch (e) {
  //     return statusCode("error");
  //   }
  // }

  Future<String> gatallseller() async {
    try {
      var data = await http
          .get(Uri.parse("${HttpUrl.httpurl}${HttpUrl.seller}"), headers: {
        'Authorization': 'Bearer ${menu.token}',
      });
      if (data.statusCode == 200) {
        var jsonData = data.body;
        var values = sellerMdFromJson(jsonData);
        sellermd.value = values;
        return statusCode(data.statusCode.toString());
      } else {
        return statusCode(data.statusCode.toString());
      }
    } catch (e) {
      return statusCode("error");
    }
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

  Future<String> postseller(
      String devicecode,
      String uspwd,
      String createby,
      String branchid,
      String unitid,
      String usname,
      String usphone,
      String usaddress,
      String maxsale) async {
    try {
      var data = await http
          .post(Uri.parse("${HttpUrl.httpurl}${HttpUrl.seller}"), body: {
        "device_code": devicecode,
        "us_pwd": uspwd,
        "create_by": createby,
        "branch_id": branchid,
        "unit_id": unitid,
        "us_name": usname,
        "us_phone": usphone,
        "us_address": usaddress,
        "max_sell": maxsale
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

  Future<String> updateseller(
      String suid,
      String devicecode,
      String uspwd,
      String branchid,
      String unitid,
      String usname,
      String usphone,
      String usaddress,
      String maxsale) async {
    try {
      var data = await http
          .put(Uri.parse("${HttpUrl.httpurl}${HttpUrl.seller}"), body: {
        "usid": suid,
        "device_code": devicecode,
        "us_pwd": uspwd,
        "branch_id": branchid,
        "unit_id": unitid,
        "us_name": usname,
        "us_phone": usphone,
        "us_address": usaddress,
        "max_sell": maxsale
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

  Future<String> deleteseller(String devicecode) async {
    try {
      var data = await http.delete(
          Uri.parse("${HttpUrl.httpurl}${HttpUrl.seller}/$devicecode"),
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
