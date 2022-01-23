//ignore_for_file: prefer_collection_literals, file_names, avoid_print
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotterymanagement/Controllers/MenuCTR.dart';
import 'package:lotterymanagement/Models/BranchMD.dart';
import 'package:http/http.dart' as http;
// import 'package:lotterymanagement/Models/ProvinceMD.dart';
import 'package:lotterymanagement/UrlRespose/Http_Url.dart';

class SettingBranchCTR extends GetxController {
  RxString statusCode = "".obs;
  RxString empty = "".obs;
  RxString txtsearch = "".obs;
  RxString onloading = "".obs;
  RxBool onDeleted = false.obs;
  RxBool onTap = false.obs;
  bool check = false;
  var branchmd = List<BranchMd>().obs;
  // var provincemd = List<ProviceMd>().obs;
  MenuCTR menu = Get.put(MenuCTR());
  var search = TextEditingController();
  var name = TextEditingController();
  var provincename = TextEditingController();
  var phone = TextEditingController();
  var f1 = FocusNode();
  var f2 = FocusNode();
  var f3 = FocusNode();
  String id = ""; //, province
  void clear() {
    name.clear();
    id = "";
    txtsearch.value = "";
    search.text = "";
    phone.clear();
    provincename.clear();
    empty("");
    // province = null;
  }

  // Future<String> getProvine() async {
  //   try {
  //     var data = await http
  //         .get(Uri.parse("${HttpUrl.httpurl}${HttpUrl.province}"), headers: {
  //       'Authorization': 'Bearer ${menu.token}',
  //     });
  //     if (data.statusCode == 200) {
  //       var jsonData = data.body;
  //       var values = proviceMdFromJson(jsonData);
  //       provincemd.value = values;
  //       return statusCode(data.statusCode.toString());
  //     } else {
  //       return statusCode(data.statusCode.toString());
  //     }
  //   } catch (e) {
  //     return statusCode("error");
  //   }
  // }

  Future<String> getallbranch() async {
    try {
      var data = await http
          .get(Uri.parse("${HttpUrl.httpurl}${HttpUrl.branch}"), headers: {
        'Authorization': 'Bearer ${menu.token}',
      });
      if (data.statusCode == 200) {
        var jsonData = data.body;
        var values = branchMdFromJson(jsonData);
        branchmd.value = values;
        return statusCode(data.statusCode.toString());
      } else {
        return statusCode(data.statusCode.toString());
      }
    } catch (e) {
      return statusCode("error");
    }
  }

  Future<String> postbranch(String branchcode, String provinceid,
      String createby, String phone, String name) async {
    try {
      var data = await http
          .post(Uri.parse("${HttpUrl.httpurl}${HttpUrl.branch}"), body: {
        "branch_code": branchcode,
        "province_id": provinceid,
        "createby": createby,
        "phone": phone,
        "branch_name": name
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

  Future<String> deletebranch(String branchid) async {
    try {
      var data = await http.put(
          Uri.parse("${HttpUrl.httpurl}${HttpUrl.branch}/$branchid"),
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

  Future<String> updatebranch(String branchid, String branchcode,
      String provinceid, String phone, String name) async {
    try {
      var data = await http
          .put(Uri.parse("${HttpUrl.httpurl}${HttpUrl.branch}"), body: {
        "branch_id": branchid,
        "branch_code": branchcode,
        "province_id": provinceid,
        "phone": phone,
        "branch_name": name
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
