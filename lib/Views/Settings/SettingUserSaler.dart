// // ignore_for_file: file_names, annotate_overrides
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:lotterymanagement/AlertDialogs/CustomDialog.dart';
// import 'package:lotterymanagement/Colors/Colors.dart';
// import 'package:lotterymanagement/Controllers/MenuCTR.dart';
// import 'package:lotterymanagement/Controllers/Setting/SettingUserSalerCTR.dart';
// import 'package:lotterymanagement/Fonts/Fonts.dart';
// import 'package:lotterymanagement/Models/EmeideviceMD.dart';
// import 'package:lotterymanagement/UrlRespose/StatusCodeError.dart';
// import 'package:lotterymanagement/Widget/Button.dart';
// import 'package:lotterymanagement/Widget/HttpError.dart';
// import 'package:lotterymanagement/Widget/LabelText.dart';
// import 'package:lotterymanagement/Widget/PopupDialog.dart';
// import 'package:lotterymanagement/Widget/Textfield.dart';

// class SettingUserSaler extends StatefulWidget {
//   const SettingUserSaler({Key key}) : super(key: key);
//   @override
//   _SettingUserSalerState createState() => _SettingUserSalerState();
// }

// class _SettingUserSalerState extends State<SettingUserSaler> {
//   SettingUserSalerCTR userSaler = Get.put(SettingUserSalerCTR());
//   MenuCTR menu = Get.put(MenuCTR());
//   @override
//   void initState() {
//     userSaler.clear();
//     userSaler.getEmeidevice().then((value) => userSaler.onloading(value));
//     userSaler.getDevice();
//     userSaler.getallbranch();
//     userSaler.menu.disable(false);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => userSaler.statusCode.value == "error"
//           ? HttpError(
//               title: StatusCodeText.httpError,
//             )
//           : userSaler.statusCode.value == "500"
//               ? HttpError(
//                   title: StatusCodeText.httpError,
//                 )
//               : Scaffold(
//                   backgroundColor: colorbackground,
//                   appBar: AppBar(
//                     backgroundColor: colorbackground,
//                     title: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 25),
//                       child: InfoPopup(
//                         inputFormatters: [
//                           LengthLimitingTextInputFormatter(50),
//                         ],
//                         title: "ຕັ້ງຄ່າ",
//                         search: userSaler.search,
//                         onChanged: (val) {
//                           userSaler.txtsearch(userSaler.search.text);
//                           userSaler.check = false;
//                         },
//                         onTap: () {
//                           if (userSaler.search.text != "") {
//                             for (int i = 0;
//                                 i < userSaler.listEmei.length;
//                                 i++) {
//                               if (userSaler.listEmei[i].deviceCode.toString() ==
//                                       userSaler.txtsearch.value ||
//                                   userSaler.listEmei[i].deviceImei.toString() ==
//                                       userSaler.txtsearch.value) {
//                                 userSaler.check = true;
//                               }
//                             }
//                             if (userSaler.check == false) {
//                               CustomDialogs.invalidDialogs(
//                                   context, "ບໍ່ພົບຂໍ້ມູນນີ້");
//                             }
//                           }
//                         },
//                       ),
//                     ),
//                   ),
//                   body: SafeArea(
//                     child: SingleChildScrollView(
//                       child: Container(
//                         width: double.infinity,
//                         height: MediaQuery.of(context).size.width,
//                         color: colorbackground,
//                         child: Padding(
//                           padding: const EdgeInsets.only(
//                               right: 50, left: 50, top: 30),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               SizedBox(
//                                 width: double.infinity,
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       "ຕັ້ງຄ່າເຄື່ອງຂາຍ",
//                                       style: TextStyle(
//                                           fontFamily: phetsarath,
//                                           color: colordarkblue,
//                                           fontSize: fontmenu,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               // c1
//                               SizedBox(
//                                 width: double.infinity,
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         LabelText(
//                                           count: "1",
//                                           name: "ປະເພດອຸປະກອນ",
//                                           color: userSaler.empty.value == "1"
//                                               ? colorred
//                                               : colorblack,
//                                         ),
//                                         Card(
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                           ),
//                                           child: Container(
//                                             width: 250,
//                                             height: 42,
//                                             decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10),
//                                                 border: Border.all()),
//                                             child: DropdownButtonHideUnderline(
//                                                 child: DropdownButton(
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                               value: userSaler.device,
//                                               hint: Padding(
//                                                 padding: const EdgeInsets.only(
//                                                     left: 20.0),
//                                                 child: Text("ປະເພດອຸປະກອນ",
//                                                     style: TextStyle(
//                                                         color: colorblack,
//                                                         fontSize: fontmenu,
//                                                         fontFamily:
//                                                             phetsarath)),
//                                               ),
//                                               items:
//                                                   userSaler.listDevice.length !=
//                                                           null
//                                                       ? userSaler.listDevice
//                                                           .map((document) {
//                                                           return DropdownMenuItem(
//                                                               value: document
//                                                                   .deviceTypeId
//                                                                   .toString(),
//                                                               child: SizedBox(
//                                                                 height: 30.0,
//                                                                 child: Padding(
//                                                                   padding: const EdgeInsets
//                                                                           .only(
//                                                                       left:
//                                                                           20.0),
//                                                                   child: Text(
//                                                                       document
//                                                                           .deviceTypeName,
//                                                                       style: TextStyle(
//                                                                           color:
//                                                                               colorblack,
//                                                                           fontSize:
//                                                                               fontmenu,
//                                                                           fontFamily:
//                                                                               phetsarath)),
//                                                                 ),
//                                                               ));
//                                                         }).toList()
//                                                       : userSaler.device,
//                                               onChanged: (value) {
//                                                 userSaler.getDevice();
//                                                 userSaler.device = value;
//                                                 userSaler.bran = null;
//                                                 userSaler
//                                                     .getBran(userSaler.device);
//                                               },
//                                             )),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         LabelText(
//                                           count: "1",
//                                           name: "ຍີ່ຫໍ້ເຄື່ອງ",
//                                           color: userSaler.empty.value == "2"
//                                               ? colorred
//                                               : colorblack,
//                                         ),
//                                         Card(
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                           ),
//                                           child: Container(
//                                             width: 250,
//                                             height: 42,
//                                             decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10),
//                                                 border: Border.all()),
//                                             child: DropdownButtonHideUnderline(
//                                                 child: DropdownButton(
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                               value: userSaler.bran,
//                                               hint: Padding(
//                                                 padding: const EdgeInsets.only(
//                                                     left: 20.0),
//                                                 child: Text("ຍີ່ຫໍ້ເຄື່ອງ",
//                                                     style: TextStyle(
//                                                         color: colorblack,
//                                                         fontSize: fontmenu,
//                                                         fontFamily:
//                                                             phetsarath)),
//                                               ),
//                                               items:
//                                                   userSaler.listBran.length !=
//                                                           null
//                                                       ? userSaler.listBran
//                                                           .map((document) {
//                                                           return DropdownMenuItem(
//                                                               value: document
//                                                                   .brandid
//                                                                   .toString(),
//                                                               child: SizedBox(
//                                                                 height: 30.0,
//                                                                 child: Padding(
//                                                                   padding: const EdgeInsets
//                                                                           .only(
//                                                                       left:
//                                                                           20.0),
//                                                                   child: Text(
//                                                                       document
//                                                                           .brandName
//                                                                           .toString(),
//                                                                       style: TextStyle(
//                                                                           color:
//                                                                               colorblack,
//                                                                           fontSize:
//                                                                               fontmenu,
//                                                                           fontFamily:
//                                                                               phetsarath)),
//                                                                 ),
//                                                               ));
//                                                         }).toList()
//                                                       : userSaler.bran,
//                                               onChanged: (value) {
//                                                 userSaler
//                                                     .getBran(userSaler.device);
//                                                 userSaler.bran = value;
//                                               },
//                                             )),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         LabelText(
//                                           count: "1",
//                                           name: "ສາຂາ",
//                                           color: userSaler.empty.value == "3"
//                                               ? colorred
//                                               : colorblack,
//                                         ),
//                                         Card(
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                           ),
//                                           child: Container(
//                                             width: 250,
//                                             height: 42,
//                                             decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10),
//                                                 border: Border.all()),
//                                             child: DropdownButtonHideUnderline(
//                                                 child: DropdownButton(
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                               value: userSaler.branch,
//                                               hint: Padding(
//                                                 padding: const EdgeInsets.only(
//                                                     left: 20.0),
//                                                 child: Text("ສາຂາ",
//                                                     style: TextStyle(
//                                                         color: colorblack,
//                                                         fontSize: fontmenu,
//                                                         fontFamily:
//                                                             phetsarath)),
//                                               ),
//                                               items: userSaler.branchmd != null
//                                                   ? userSaler.branchmd
//                                                       .map((document) {
//                                                       return DropdownMenuItem(
//                                                           value: document
//                                                               .branchId
//                                                               .toString(),
//                                                           child: SizedBox(
//                                                             height: 30.0,
//                                                             child: Padding(
//                                                               padding:
//                                                                   const EdgeInsets
//                                                                           .only(
//                                                                       left:
//                                                                           20.0),
//                                                               child: Text(
//                                                                   document
//                                                                       .branchName,
//                                                                   style: TextStyle(
//                                                                       color:
//                                                                           colorblack,
//                                                                       fontSize:
//                                                                           fontmenu,
//                                                                       fontFamily:
//                                                                           phetsarath)),
//                                                             ),
//                                                           ));
//                                                     }).toList()
//                                                   : userSaler.branch,
//                                               onChanged: (value) {
//                                                 userSaler.getallbranch();
//                                                 userSaler.branch = value;
//                                               },
//                                             )),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               // c2
//                               SizedBox(
//                                 width: double.infinity,
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         LabelText(
//                                           count: "1",
//                                           name: "ລະຫັດເຄື່ອງ",
//                                           color: userSaler.empty.value == "4"
//                                               ? colorred
//                                               : colorblack,
//                                         ),
//                                         Card(
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                           ),
//                                           child: Textfield(
//                                             inputFormatters: [
//                                               FilteringTextInputFormatter
//                                                   .digitsOnly,
//                                               LengthLimitingTextInputFormatter(
//                                                   20),
//                                             ],
//                                             fontFamily: phetsarath,
//                                             obscureText: false,
//                                             bordercolor:
//                                                 userSaler.empty.value == "4"
//                                                     ? colorred
//                                                     : colordarkblue,
//                                             focusNode:
//                                                 userSaler.empty.value == "4"
//                                                     ? userSaler.f1
//                                                     : userSaler.f1,
//                                             controller: userSaler.unitid,
//                                             fontWeight: FontWeight.normal,
//                                             textInputType: TextInputType.number,
//                                             size: 250,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         LabelText(
//                                           count: "1",
//                                           name: "ເລກ EMEI",
//                                           color: userSaler.empty.value == "5"
//                                               ? colorred
//                                               : colorblack,
//                                         ),
//                                         Card(
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                           ),
//                                           child: Textfield(
//                                             fontFamily: phetsarath,
//                                             obscureText: false,
//                                             bordercolor:
//                                                 userSaler.empty.value == "5"
//                                                     ? colorred
//                                                     : colordarkblue,
//                                             focusNode:
//                                                 userSaler.empty.value == "5"
//                                                     ? userSaler.f2
//                                                     : userSaler.f2,
//                                             inputFormatters: [
//                                               // FilteringTextInputFormatter
//                                               //     .digitsOnly,
//                                               LengthLimitingTextInputFormatter(
//                                                   50),
//                                             ],
//                                             controller: userSaler.emei,
//                                             fontWeight: FontWeight.normal,
//                                             textInputType: TextInputType.number,
//                                             size: 250,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Container(
//                                       width: 250,
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               //c4
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               Button(
//                                 height: 42,
//                                 title: userSaler.onTap.value == false
//                                     ? "ບັນທຶກ"
//                                     : "ລໍຖ້າ...",
//                                 colorstype: colorwhite,
//                                 fontFamily: phetsarath,
//                                 fontSize: fontgeneral,
//                                 onPressed: () {
//                                   if (userSaler.device == null) {
//                                     userSaler.empty("1");
//                                   } else if (userSaler.bran == null) {
//                                     userSaler.empty("2");
//                                   } else if (userSaler.branch == null) {
//                                     userSaler.empty("3");
//                                   } else if (userSaler.unitid.text == "") {
//                                     FocusScope.of(context)
//                                         .requestFocus(userSaler.f1);
//                                     userSaler.empty("4");
//                                   } else if (userSaler.emei.text == "") {
//                                     FocusScope.of(context)
//                                         .requestFocus(userSaler.f2);
//                                     userSaler.empty("5");
//                                   } else {
//                                     userSaler.empty("");
//                                     if (userSaler.onTap.value == false) {
//                                       userSaler.onTap(true);
//                                       if (userSaler.id == "") {
//                                         userSaler
//                                             .postEmeiDevice(
//                                                 userSaler.device,
//                                                 userSaler.bran,
//                                                 userSaler.unitid.text,
//                                                 userSaler.emei.text,
//                                                 "1",
//                                                 userSaler.branch,
//                                                 "0",
//                                                 menu.userid.value,
//                                                 "0")
//                                             .then((value) {
//                                           if (value == "201") {
//                                             Get.snackbar(
//                                                  "Warning Messages !", "",
//                                               messageText: Text(
//                                                   StatusCodeText
//                                                       .statusCodeText201,
//                                                   style: TextStyle(
//                                                       fontFamily: phetsarath,
//                                                       color: colorblack,
//                                                       fontSize: fontgeneral,
//                                                       fontWeight:
//                                                           FontWeight.normal)),
//                                                 maxWidth: 500,
//                                                 backgroundColor: colorwhite,
//                                                 snackPosition:
//                                                     SnackPosition.TOP,
//                                                 icon: const Icon(
//                                                   Icons.message,
//                                                   color: colorgreen,
//                                                 ));
//                                             userSaler.clear();
//                                             FocusScope.of(context)
//                                                 .requestFocus(userSaler.f1);
//                                             userSaler.getEmeidevice().then(
//                                                 (value) =>
//                                                     userSaler.onloading(value));
//                                           } else if (value == "401") {
//                                             CustomDialogs.errorDialogs(
//                                                 context,
//                                                 StatusCodeText
//                                                     .statusCodeText401);
//                                           } else if (value == "403") {
//                                             CustomDialogs.errorDialogs(
//                                                 context,
//                                                 StatusCodeText
//                                                     .statusCodeText403);
//                                           } else if (value == "404") {
//                                             CustomDialogs.errorDialogs(
//                                                 context,
//                                                 StatusCodeText
//                                                     .statusCodeText404);
//                                           } else {
//                                             CustomDialogs.errorDialogs(
//                                                 context,
//                                                 StatusCodeText
//                                                     .statusCodeText500);
//                                           }
//                                         }).whenComplete(() => userSaler.onTap(false));
//                                       } else {
//                                         userSaler
//                                             .updateEmeiDevice(
//                                                 userSaler.device,
//                                                 userSaler.bran,
//                                                 userSaler.id,
//                                                 userSaler.emei.text,
//                                                 userSaler.branch)
//                                             .then((value) {
//                                           if (value == "200") {
//                                             Get.snackbar(
//                                                  "Warning Messages !", "",
//                                               messageText: Text(
//                                                   StatusCodeText
//                                                       .statusCodeText200,
//                                                   style: TextStyle(
//                                                       fontFamily: phetsarath,
//                                                       color: colorblack,
//                                                       fontSize: fontgeneral,
//                                                       fontWeight:
//                                                           FontWeight.normal)),
//                                                 maxWidth: 500,
//                                                 backgroundColor: colorwhite,
//                                                 snackPosition:
//                                                     SnackPosition.TOP,
//                                                 icon: const Icon(
//                                                   Icons.message,
//                                                   color: colorgreen,
//                                                 ));
//                                             userSaler.clear();
//                                             FocusScope.of(context)
//                                                 .requestFocus(userSaler.f1);
//                                             userSaler.getEmeidevice().then(
//                                                 (value) =>
//                                                     userSaler.onloading(value));
//                                           } else if (value == "401") {
//                                             CustomDialogs.errorDialogs(
//                                                 context,
//                                                 StatusCodeText
//                                                     .statusCodeText401);
//                                           } else if (value == "403") {
//                                             CustomDialogs.errorDialogs(
//                                                 context,
//                                                 StatusCodeText
//                                                     .statusCodeText403);
//                                           } else if (value == "404") {
//                                             CustomDialogs.errorDialogs(
//                                                 context,
//                                                 StatusCodeText
//                                                     .statusCodeText404);
//                                           } else {
//                                             CustomDialogs.errorDialogs(
//                                                 context,
//                                                 StatusCodeText
//                                                     .statusCodeText500);
//                                           }
//                                         }).whenComplete(() => userSaler.onTap(false));
//                                       }
//                                     }
//                                   }
//                                 },
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               Text(
//                                 "ສະແດງຂໍ້ມູນເຄື່ອງຂາຍ",
//                                 style: TextStyle(
//                                     fontFamily: phetsarath,
//                                     color: colorblack,
//                                     fontSize: fontmenu,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               const SizedBox(
//                                 height: 5,
//                               ),
//                               userSaler.listEmei.isEmpty
//                                   ? Center(
//                                       child: Text("ຂໍ້ມູນວ່າງເປົ່າ. . .",
//                                           style: TextStyle(
//                                               color: colorred,
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: fontmenu,
//                                               fontFamily: phetsarath)),
//                                     )
//                                   : userSaler.onloading.value == "200"
//                                       ? Expanded(
//                                           child: SingleChildScrollView(
//                                             child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Container(
//                                                     width: double.infinity,
//                                                     color: colorwhite,
//                                                     child: PaginatedDataTable(
//                                                       columnSpacing:
//                                                           defaultPadding,
//                                                       showCheckboxColumn: false,
//                                                       showFirstLastButtons:
//                                                           true,
//                                                       columns: [
//                                                         DataColumn(
//                                                             label: Text("ລຳດັບ",
//                                                                 style: TextStyle(
//                                                                     color:
//                                                                         colorblack,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold,
//                                                                     fontSize:
//                                                                         fontmenu,
//                                                                     fontFamily:
//                                                                         phetsarath))),
//                                                         DataColumn(
//                                                             label: Text("ປະເພດ",
//                                                                 style: TextStyle(
//                                                                     color:
//                                                                         colorblack,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold,
//                                                                     fontSize:
//                                                                         fontmenu,
//                                                                     fontFamily:
//                                                                         phetsarath))),
//                                                         DataColumn(
//                                                             label: Text(
//                                                                 "ຍີ່ຫໍ້",
//                                                                 style: TextStyle(
//                                                                     color:
//                                                                         colorblack,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold,
//                                                                     fontSize:
//                                                                         fontmenu,
//                                                                     fontFamily:
//                                                                         phetsarath))),
//                                                         DataColumn(
//                                                             label: Text(
//                                                                 "ລະຫັດເຄື່ອງ",
//                                                                 style: TextStyle(
//                                                                     color:
//                                                                         colorblack,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold,
//                                                                     fontSize:
//                                                                         fontmenu,
//                                                                     fontFamily:
//                                                                         phetsarath))),
//                                                         DataColumn(
//                                                             label: Text(
//                                                                 "ເລກອ້າງອີງ",
//                                                                 style: TextStyle(
//                                                                     color:
//                                                                         colorblack,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold,
//                                                                     fontSize:
//                                                                         fontmenu,
//                                                                     fontFamily:
//                                                                         phetsarath))),
//                                                         DataColumn(
//                                                             label: Text(
//                                                                 "ເລກ EMEI",
//                                                                 style: TextStyle(
//                                                                     color:
//                                                                         colorblack,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold,
//                                                                     fontSize:
//                                                                         fontmenu,
//                                                                     fontFamily:
//                                                                         phetsarath))),
//                                                         DataColumn(
//                                                             label: Text(
//                                                                 "ວັນທີລົງທະບຽນ",
//                                                                 style: TextStyle(
//                                                                     color:
//                                                                         colorblack,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold,
//                                                                     fontSize:
//                                                                         fontmenu,
//                                                                     fontFamily:
//                                                                         phetsarath))),
//                                                         DataColumn(
//                                                             label: Text(
//                                                                 "ສະຖານະ",
//                                                                 style: TextStyle(
//                                                                     color:
//                                                                         colorblack,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold,
//                                                                     fontSize:
//                                                                         fontmenu,
//                                                                     fontFamily:
//                                                                         phetsarath))),
//                                                         DataColumn(
//                                                             label: Text("",
//                                                                 style: TextStyle(
//                                                                     color:
//                                                                         colorblack,
//                                                                     fontSize:
//                                                                         fontgeneral,
//                                                                     fontFamily:
//                                                                         phetsarath))),
//                                                       ],
//                                                       source: MyDataTable(
//                                                           reportData: userSaler
//                                                                       .txtsearch
//                                                                       .value ==
//                                                                   ""
//                                                               ? userSaler
//                                                                   .listEmei
//                                                               : userSaler
//                                                                   .listEmei
//                                                                   .where((e) =>
//                                                                       e.deviceCode
//                                                                               .toString() ==
//                                                                           userSaler
//                                                                               .txtsearch
//                                                                               .value ||
//                                                                       e.deviceImei
//                                                                               .toString() ==
//                                                                           userSaler
//                                                                               .txtsearch
//                                                                               .value)
//                                                                   .toList(),
//                                                           context: context),
//                                                       rowsPerPage: 15,
//                                                     ))
//                                               ],
//                                             ),
//                                           ),
//                                         )
//                                       : Center(
//                                           child: Text("ຂໍ້ມູນວ່າງເປົ່າ. . .",
//                                               style: TextStyle(
//                                                   color: colorred,
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: fontmenu,
//                                                   fontFamily: phetsarath)),
//                                         )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//     );
//   }
// }

// class MyDataTable extends DataTableSource {
//   MyDataTable({@required List<EmeideviceMd> reportData, BuildContext context})
//       : _reportData = reportData,
//         _context = context,
//         assert(reportData != null);
//   final List<EmeideviceMd> _reportData;
//   final BuildContext _context;
//   bool get isRowCountApproximate => false;
//   int get rowCount => _reportData.length;
//   int get selectedRowCount => 0;
//   DateFormat format = DateFormat("dd/MM/yyyy");
//   SettingUserSalerCTR userSaler = Get.put(SettingUserSalerCTR());
//   DataRow getRow(int index) {
//     return DataRow(
//         onSelectChanged: (value) {
//           userSaler.id = _reportData[index].deviceCode.toString();
//           userSaler.unitid.text = _reportData[index].deviceCode.toString();
//           userSaler.emei.text = _reportData[index].deviceImei.toString();
//           userSaler.device = _reportData[index].deviceTypeId.toString();
//           userSaler.getallbranch().then((value) {
//             if (value == "200") {
//               userSaler.branch = null;
//               userSaler.branch = _reportData[index].branchId.toString();
//             }
//           });

//           userSaler.getDevice();
//           userSaler.getBran(userSaler.device).then((value) {
//             if (value == "200") {
//               userSaler.bran = null;
//               userSaler.bran = _reportData[index].brandId.toString();
//             } else {
//               userSaler.bran = null;
//             }
//           });
//         },
//         cells: [
//           DataCell(Text(
//               userSaler.txtsearch.value == ""
//                   ? index.toString()
//                   : _reportData[index].deviceCode.toString(),
//               style: TextStyle(
//                   color: colorblack,
//                   fontSize: fontgeneral,
//                   fontFamily: phetsarath))),
//           DataCell(
//             Text(_reportData[index].deviceTypeName ?? "ວ່າງເປົ່າ",
//                 style: TextStyle(
//                     color: colorblack,
//                     fontSize: fontgeneral,
//                     fontFamily: phetsarath)),
//           ),
//           DataCell(Text(_reportData[index].brandName ?? "ວ່າງເປົ່າ",
//               style: TextStyle(
//                   color: colorblack,
//                   fontSize: fontgeneral,
//                   fontFamily: phetsarath))),
//           DataCell(Text(_reportData[index].deviceCode.toString() ?? "ວ່າງເປົ່າ",
//               style: TextStyle(
//                   color: colorblack,
//                   fontSize: fontgeneral,
//                   fontFamily: phetsarath))),
//           DataCell(Text(_reportData[index].deviceRef.toString() ?? "ວ່າງເປົ່າ",
//               style: TextStyle(
//                   color: colorblack,
//                   fontSize: fontgeneral,
//                   fontFamily: phetsarath))),
//           DataCell(Text(_reportData[index].deviceImei.toString() ?? "ວ່າງເປົ່າ",
//               style: TextStyle(
//                   color: colorblack,
//                   fontSize: fontgeneral,
//                   fontFamily: phetsarath))),
//           DataCell(Text(
//               format.format(_reportData[index].deviceDate) ?? "ວ່າງເປົ່າ",
//               style: TextStyle(
//                   color: colorblack,
//                   fontSize: fontgeneral,
//                   fontFamily: phetsarath))),
//           DataCell(Text(_reportData[index].statusName.toString() ?? "ວ່າງເປົ່າ",
//               style: TextStyle(
//                   color: colorblack,
//                   fontSize: fontgeneral,
//                   fontFamily: phetsarath))),
//           DataCell(
//             Row(
//               children: [
//                 InkWell(
//                     onTap: () async {
//                       userSaler.id = _reportData[index].deviceCode.toString();
//                       userSaler.unitid.text =
//                           _reportData[index].deviceCode.toString();
//                       userSaler.emei.text =
//                           _reportData[index].deviceImei.toString();
//                       userSaler.device =
//                           _reportData[index].deviceTypeId.toString();
//                       userSaler.getallbranch().then((value) {
//                         if (value == "200") {
//                           userSaler.branch = null;
//                           userSaler.branch =
//                               _reportData[index].branchId.toString();
//                         }
//                       });

//                       userSaler.getDevice();
//                       userSaler.getBran(userSaler.device).then((value) {
//                         if (value == "200") {
//                           userSaler.bran = null;
//                           userSaler.bran =
//                               _reportData[index].brandId.toString();
//                         } else {
//                           userSaler.bran = null;
//                         }
//                       });
//                     },
//                     child: const Icon(
//                       Icons.edit,
//                       color: colordarkblue,
//                     )),
//                 const SizedBox(
//                   width: 15,
//                 ),
//                 InkWell(
//                     onTap: () async {
//                       CustomDialogs.deleteDialogs(_context, () {
//                         userSaler
//                             .deleteDevice(
//                                 _reportData[index].deviceCode.toString())
//                             .then((value) {
//                           if (value == "200") {
//                             Navigator.of(_context).pop();

//                             Get.snackbar(
//                                "Warning Messages !", "",
//                                               messageText: Text(
//                                                   StatusCodeText
//                                                       .statusCodeText200Delete,
//                                                   style: TextStyle(
//                                                       fontFamily: phetsarath,
//                                                       color: colorblack,
//                                                       fontSize: fontgeneral,
//                                                       fontWeight:
//                                                           FontWeight.normal)),
//                                 maxWidth: 500,
//                                 backgroundColor: colorwhite,
//                                 snackPosition: SnackPosition.TOP,
//                                 icon: const Icon(
//                                   Icons.message,
//                                   color: colorgreen,
//                                 ));
//                             userSaler.clear();
//                             FocusScope.of(_context).requestFocus(userSaler.f1);
//                             userSaler
//                                 .getEmeidevice()
//                                 .then((value) => userSaler.onloading(value));
//                           } else if (value == "401") {
//                             Navigator.of(_context).pop();
//                             CustomDialogs.errorDialogs(
//                                 _context, StatusCodeText.statusCodeText401);
//                           } else if (value == "403") {
//                             Navigator.of(_context).pop();
//                             CustomDialogs.errorDialogs(
//                                 _context, StatusCodeText.statusCodeText403);
//                           } else if (value == "404") {
//                             Navigator.of(_context).pop();
//                             CustomDialogs.errorDialogs(
//                                 _context, StatusCodeText.statusCodeText404);
//                           } else {
//                             Navigator.of(_context).pop();
//                             CustomDialogs.errorDialogs(
//                                 _context, StatusCodeText.statusCodeText500);
//                           }
//                         });
//                       });
//                     },
//                     child: const Icon(
//                       Icons.delete,
//                       color: colorblack,
//                     )),
//               ],
//             ),
//           ),
//         ]);
//   }
// }
