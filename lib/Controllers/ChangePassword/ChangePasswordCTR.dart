// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotterymanagement/Controllers/MenuCTR.dart';
import 'package:http/http.dart' as http;
import 'package:lotterymanagement/UrlRespose/Http_Url.dart';

class ChangPasswordCTR extends GetxController {
  var search = TextEditingController();
  var username = TextEditingController();
  var passsword = TextEditingController();
  var confirm = TextEditingController();
  var f1 = FocusNode();
  var f2 = FocusNode();
  var f3 = FocusNode();
  MenuCTR menu = Get.put(MenuCTR());
  RxString empty = "".obs;
  RxString statusCode = "".obs;
  RxBool onTap = false.obs;
  void clear() {
    username.clear();
    passsword.clear();
    confirm.clear();
    empty("");
  }

  Future<String> changePassword(String useremail, String userpassword,
      String usernewpassword, String userid) async {
    try {
      var data =
          await http.put(Uri.parse("${HttpUrl.httpurl}${HttpUrl.user}"), body: {
        "user_email": useremail,
        "user_password": userpassword,
        "user_newpassword": usernewpassword,
        "userid": userid,
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
