// // ignore_for_file: file_names, prefer_collection_literals
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lotterymanagement/Controllers/MenuCTR.dart';
// import 'package:lotterymanagement/Models/BranMD.dart';
// import 'package:lotterymanagement/Models/BranchMD.dart';
// import 'package:lotterymanagement/Models/DeviceMD.dart';
// import 'package:http/http.dart' as http;
// import 'package:lotterymanagement/Models/EmeideviceMD.dart';
// import 'package:lotterymanagement/UrlRespose/Http_Url.dart';
// class SettingUserSalerCTR extends GetxController {
//   RxString statusCode = "".obs;
//   RxString empty = "".obs;
//   RxString txtsearch = "".obs;
//   bool check = false;
//   RxString onloading = "".obs;
//   RxBool onTap = false.obs;
//   String device, bran, branch, id = "";
//   var listDevice = List<DeviceMd>().obs;
//   var listBran = List<BranMd>().obs;
//   var listEmei = List<EmeideviceMd>().obs;
//   MenuCTR menu = Get.put(MenuCTR());
//   var search = TextEditingController();
//   var unitid = TextEditingController();
//   var emei = TextEditingController();
//   var branchmd = List<BranchMd>().obs;
//     var f1 = FocusNode();
//   var f2 = FocusNode();
//     void clear() {
//     device = null;
//     bran = null;
//     branch = null;
//     unitid.text = "";
//     emei.text = "";
//     id = "";
//     txtsearch.value = "";
//     search.text = "";
//   }
//   Future<String> getallbranch() async {
//     try {
//       var data = await http
//           .get(Uri.parse("${HttpUrl.httpurl}${HttpUrl.branch}"), headers: {
//         'Authorization': 'Bearer ${menu.token}',
//       });
//       if (data.statusCode == 200) {
//         var jsonData = data.body;
//         var values = branchMdFromJson(jsonData);
//         branchmd.value = values;
//         return statusCode(data.statusCode.toString());
//       } else {
//         return statusCode(data.statusCode.toString());
//       }
//     } catch (e) {
//       return statusCode("error");
//     }
//   }

//   Future<String> getDevice() async {
//     try {
//       var data = await http
//           .get(Uri.parse("${HttpUrl.httpurl}${HttpUrl.device}"), headers: {
//         'Authorization': 'Bearer ${menu.token}',
//       });
//       if (data.statusCode == 200) {
//         var jsonData = data.body;
//         var values = deviceMdFromJson(jsonData);
//         listDevice.value = values;
//         return statusCode(data.statusCode.toString());
//       } else {
//         return statusCode(data.statusCode.toString());
//       }
//     } catch (e) {
//       return statusCode("error");
//     }
//   }

//   Future<String> getBran(String id) async {
//     try {
//       var data = await http
//           .get(Uri.parse("${HttpUrl.httpurl}${HttpUrl.bran}/$id"), headers: {
//         'Authorization': 'Bearer ${menu.token}',
//       });
//       if (data.statusCode == 200) {
//         var jsonData = data.body;
//         var values = branMdFromJson(jsonData);
//         listBran.value = values;
//         return statusCode(data.statusCode.toString());
//       } else {
//         return statusCode(data.statusCode.toString());
//       }
//     } catch (e) {
//       return statusCode("error");
//     }
//   }

//   Future<String> getEmeidevice() async {
//     try {
//       var data = await http
//           .get(Uri.parse("${HttpUrl.httpurl}${HttpUrl.emei}"), headers: {
//         'Authorization': 'Bearer ${menu.token}',
//       });
//       if (data.statusCode == 200) {
//         var jsonData = data.body;
//         var values = emeideviceMdFromJson(jsonData);
//         listEmei.value = values;
//         return statusCode(data.statusCode.toString());
//       } else {
//         return statusCode(data.statusCode.toString());
//       }
//     } catch (e) {
//       return statusCode("error");
//     }
//   }

//   Future<String> postEmeiDevice(
//     String devicetypeid,
//     String brandid,
//     String devicecode,
//     String deviceimei,
//     String statusdevice,
//     String branchid,
//     String unitid,
//     String registerby,
//     String codetype,
//   ) async {
//     try {
//       var data = await http
//           .post(Uri.parse("${HttpUrl.httpurl}${HttpUrl.emeidevice}"), body: {
//         "device_type_id": devicetypeid,
//         "brand_id": brandid,
//         "device_code": devicecode,
//         "device_imei": deviceimei,
//         "status_device": statusdevice,
//         "branch_id": branchid,
//         "unit_id": unitid,
//         "register_by": registerby,
//         "code_type": codetype
//       }, headers: {
//         'Authorization': 'Bearer ${menu.token}',
//       });
//       if (data.statusCode == 201) {
//         return statusCode(data.statusCode.toString());
//       } else {
//         return statusCode(data.statusCode.toString());
//       }
//     } catch (e) {
//       return statusCode("error");
//     }
//   }

//   Future<String> deleteDevice(String id) async {
//     try {
//       var data = await http
//           .put(Uri.parse("${HttpUrl.httpurl}${HttpUrl.emei}/$id"), headers: {
//         'Authorization': 'Bearer ${menu.token}',
//       });
//       if (data.statusCode == 200) {
//         return statusCode(data.statusCode.toString());
//       } else {
//         return statusCode(data.statusCode.toString());
//       }
//     } catch (e) {
//       return statusCode("error");
//     }
//   }

//   Future<String> updateEmeiDevice(
//     String devicetypeid,
//     String brandid,
//     String devicecode,
//     String deviceimei,
//     String branchid,
//   ) async {
//     try {
//       var data =
//           await http.put(Uri.parse("${HttpUrl.httpurl}${HttpUrl.emei}"), body: {
//         "device_type_id": devicetypeid,
//         "brand_id": brandid,
//         "device_code": devicecode,
//         "device_imei": deviceimei,
//         "branch_id": branchid,
//       }, headers: {
//         'Authorization': 'Bearer ${menu.token}',
//       });
//       if (data.statusCode == 201) {
//         return statusCode(data.statusCode.toString());
//       } else {
//         return statusCode(data.statusCode.toString());
//       }
//     } catch (e) {
//       return statusCode("error");
//     }
//   }
// }
