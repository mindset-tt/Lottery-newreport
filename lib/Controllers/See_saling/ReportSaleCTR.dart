// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lotterymanagement/Controllers/MenuCTR.dart';
import 'package:lotterymanagement/Models/BillnumberSellerMD.dart';
import 'package:lotterymanagement/Models/CancelbillNumberMD.dart';
import 'package:lotterymanagement/Models/ListOfBillMD.dart';
import 'package:lotterymanagement/Models/ListOfBillcancelMD.dart';
import 'package:lotterymanagement/UrlRespose/Http_Url.dart';
class ReportSaleCTR extends GetxController {
  RxString statusCode = "".obs;
  RxString empty = "".obs;
  RxString txtsearch = "".obs;
  // String bill;
  RxString onloadingListbill = "".obs;
  RxString cancelonloading = "".obs;
  RxString onloadingListbillDetail = "".obs;
  RxString onloadingcancel = "".obs;
  RxString period = "".obs;
  bool check = false;
  var search = TextEditingController();
  var secondsearch = TextEditingController();
  var txtbill = TextEditingController();
  var f1 = FocusNode();
  var f2 = FocusNode();
  RxString onTap = "0".obs;
  RxBool onSave = false.obs;
  // TabController controller;
  MenuCTR menu = Get.put(MenuCTR());
  var listofbillcancelbillmd = List<ListOfbillcanceMd>().obs;
  // var cancelbillnumbermd = List<CancelbillNumberMd>().obs;
  var cancelbillnumberselermd = List<CancelbillNumberMd>().obs;
  var billnumberselermd = List<BillNumberSellerMd>().obs;
  var listofbillmd = List<ListofbillMd>().obs;

  void clear() {
    secondsearch.clear();
    txtbill.clear();
    search.clear();
    onloadingListbill("");
    onloadingListbillDetail("");
    onloadingcancel("");
    cancelonloading("");
  }

  Future<String> cancelbill(String billnumber, String userid) async {
    try {
      var data = await http.post(
          Uri.parse(
              "${HttpUrl.httpurl}${HttpUrl.cancelbill}/$billnumber/$userid"),
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

  // Future<String> getbillnumber(String billnumber, String period) async {
  //   try {
  //     var data = await http.get(
  //         Uri.parse(
  //             "${HttpUrl.httpurl}${HttpUrl.billnumber}/$billnumber/$period"),
  //         headers: {
  //           'Authorization': 'Bearer ${menu.token}',
  //         });
  //     if (data.statusCode == 200) {
  //       var jsonData = data.body;
  //       var values = billNumberMdFromJson(jsonData);
  //       billnumbermd.value = values;
  //       return statusCode(data.statusCode.toString());
  //     } else {
  //       return statusCode(data.statusCode.toString());
  //     }
  //   } catch (e) {
  //     return statusCode("error");
  //   }
  // }

  Future<String> getbillnumberseller(String devicecode, String period) async {
    try {
      var data = await http.get(
          Uri.parse(
              "${HttpUrl.httpurl}${HttpUrl.billnumberseller}/$devicecode/$period"),
          headers: {
            'Authorization': 'Bearer ${menu.token}',
          });
      if (data.statusCode == 200) {
        var jsonData = data.body;
        var values = billNumberSellerMdFromJson(jsonData);
        billnumberselermd.value = values;
        return statusCode(data.statusCode.toString());
      } else {
        return statusCode(data.statusCode.toString());
      }
    } catch (e) {
      return statusCode("error");
    }
  }

  Future<String> getlistofbill(String billnumber, String period) async {
    try {
      var data = await http.get(
          Uri.parse(
              "${HttpUrl.httpurl}${HttpUrl.listofbill}/$billnumber/$period"),
          headers: {
            'Authorization': 'Bearer ${menu.token}',
          });
      if (data.statusCode == 200) {
        var jsonData = data.body;
        var values = listofbillMdFromJson(jsonData);
        listofbillmd.value = values;
        return statusCode(data.statusCode.toString());
      } else {
        return statusCode(data.statusCode.toString());
      }
    } catch (e) {
      return statusCode("error");
    }
  }

  // Future<String> getcancelbillnumber(String billnumber, String period) async {
  //   try {
  //     var data = await http.get(
  //         Uri.parse(
  //             "${HttpUrl.httpurl}${HttpUrl.cancelbillnumber}/$billnumber/$period"),
  //         headers: {
  //           'Authorization': 'Bearer ${menu.token}',
  //         });
  //     if (data.statusCode == 200) {
  //       var jsonData = data.body;
  //       var values = cancelbillNumberMdFromJson(jsonData);

  //       cancelbillnumbermd.value = values;
  //       return statusCode(data.statusCode.toString());
  //     } else {
  //       return statusCode(data.statusCode.toString());
  //     }
  //   } catch (e) {
  //     return statusCode("error");
  //   }
  // }

  Future<String> getlcancelistofbill(String billnumber, String period) async {
    try {
      var data = await http.get(
          Uri.parse(
              "${HttpUrl.httpurl}${HttpUrl.cancellistofbill}/$billnumber/$period"),
          headers: {
            'Authorization': 'Bearer ${menu.token}',
          });
      if (data.statusCode == 200) {
        var jsonData = data.body;
        var values = listOfbillcanceMdFromJson(jsonData);
        listofbillcancelbillmd.value = values;
        return statusCode(data.statusCode.toString());
      } else {
        return statusCode(data.statusCode.toString());
      }
    } catch (e) {
      return statusCode("error");
    }
  }

  Future<String> getcancelbillnumbersaler(String device, String period) async {
    try {
      var data = await http.get(
          Uri.parse(
              "${HttpUrl.httpurl}${HttpUrl.cancelbillnumbersaler}/$device/$period"),
          headers: {
            'Authorization': 'Bearer ${menu.token}',
          });
      if (data.statusCode == 200) {
        var jsonData = data.body;
        var values = cancelbillNumberMdFromJson(jsonData);
        cancelbillnumberselermd.value = values;
        return statusCode(data.statusCode.toString());
      } else {
        return statusCode(data.statusCode.toString());
      }
    } catch (e) {
      return statusCode("error");
    }
  }
}
