// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:lotterymanagement/AlertDialogs/TokenError.dart';
import 'package:lotterymanagement/Colors/Colors.dart';
import 'package:lotterymanagement/Fonts/Fonts.dart';
import 'package:lotterymanagement/Responsive/Responsive.dart';
import 'package:lotterymanagement/UrlRespose/StatusCodeError.dart';
import 'package:lotterymanagement/Views/Changepassword/Changepassword.dart';
import 'package:lotterymanagement/Views/Installment_Open/Createsell.dart';
import 'package:lotterymanagement/Views/Installment_Open/InputLottery.dart';
import 'package:lotterymanagement/Views/Installment_Open/Quota.dart';
import 'package:lotterymanagement/Views/Money/Award.dart';
import 'package:lotterymanagement/Views/Reports/PrintReport.dart';
import 'package:lotterymanagement/Views/See_saling/BlockUser.dart';
import 'package:lotterymanagement/Views/See_saling/Reportsale.dart';
import 'package:lotterymanagement/Views/See_saling/SeeOnlinesaler.dart';
import 'package:lotterymanagement/Views/Settings/SettingConfirm.dart';
import 'package:lotterymanagement/Views/Settings/SettingSaler.dart';
import 'package:lotterymanagement/Views/Settings/SettingUnit.dart';
import 'Settings/SettingBranch.dart';

class AdminPages extends StatefulWidget {
  const AdminPages({Key key}) : super(key: key);
  @override
  _AdminPagesState createState() => _AdminPagesState();
}
String select = "0";
String onselect1 = "1";
String showwidget = "ຕັ້ງຄ່າສາຂາ";
class _AdminPagesState extends State<AdminPages> {
  @override
  Widget build(BuildContext context) {
    if (StatusCodeText.jsontoken == "1") {
      return const TokenPage();
    } else {
      return Scaffold(
        key: menu.scaffoldglobalKey,
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(
                //   height: 75,
                //   width: double.infinity,
                //   child: DrawerHeader(
                //     child: Center(
                //       child: Text(
                //         "Lottery LTT",
                //         style: TextStyle(
                //             fontFamily: phetsarath,
                //             fontSize: fonttitle,
                //             fontWeight: FontWeight.bold),
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  width: double.infinity,
                  height: 80,
                  child: Center(
                    child: Text(
                      "Lottery LTT",
                      style: TextStyle(
                          color: colordarkblue,
                          fontFamily: phetsarath,
                          fontSize: fonttitle,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                //ຕັ້ງຄ່າ
                ExpansionTile(
                  // trailing: const Text(''),
                  onExpansionChanged: (value) {
                    setState(() {
                      onselect1 = "1";
                    });
                  },
                  title: Text("ຕັ້ງຄ່າ",
                      style: TextStyle(
                          fontFamily: phetsarath,
                          fontSize: fontmenu,
                          color: onselect1 == "1" ? colordarkblue : colorblack,
                          fontWeight: FontWeight.bold)),
                  leading: Icon(Icons.settings,
                      color: onselect1 == "1" ? colordarkblue : colorblack),
                  children: [
                    ListTitleSetting(
                      onTap: () {
                        setState(() {
                          select = "0";
                          onselect1 = "1";
                          showwidget = "ຕັ້ງຄ່າສາຂາ";
                          Navigator.of(context).pop();
                          //  Get.offAllNamed("/adminpage/settingbranch");
                        });
                      },
                      text: "ຕັ້ງຄ່າສາຂາ",
                      coloricon: select == "0" ? colordarkblue : colorblack,
                      colortext: select == "0" ? colordarkblue : colorblack,
                    ),
                    ListTitleSetting(
                      onTap: () {
                        setState(() {
                          select = "1";
                          onselect1 = "1";
                          showwidget = "ຕັ້ງຄ່າຫນ່ວຍ";
                          Navigator.of(context).pop();
                          // Get.toNamed("/adminpage/settingunit");
                        });
                      },
                      coloricon: select == "1" ? colordarkblue : colorblack,
                      colortext: select == "1" ? colordarkblue : colorblack,
                      text: "ຕັ້ງຄ່າຫນ່ວຍ",
                    ),
                    ListTitleSetting(
                      onTap: () {
                        setState(() {
                          select = "2";
                          onselect1 = "1";
                          showwidget = "ຕັ້ງຄ່າຄົນຂາຍ";
                          Navigator.of(context).pop();
                          // Get.toNamed("/adminpage/settingsaler");
                        });
                      },
                      coloricon: select == "2" ? colordarkblue : colorblack,
                      colortext: select == "2" ? colordarkblue : colorblack,
                      text: "ຕັ້ງຄ່າຄົນຂາຍ",
                    ),
                    // ListTitleSetting(
                    //   onTap: () {
                    //     setState(() {
                    //       select = "3";
                    //       onselect1 = "1";
                    //       showwidget = "ຕັ້ງຄ່າເຄື່ອງຂາຍ";
                    //       //  Get.toNamed("/adminpage/settingconfirm");
                    //     });
                    //   },
                    //   coloricon:
                    //       select == "3" ? colordarkblue : colorblack,
                    //   colortext:
                    //       select == "3" ? colordarkblue : colorblack,
                    //   text: "ຕັ້ງຄ່າເຄື່ອງຂາຍ",
                    // ),
                    ListTitleSetting(
                      onTap: () {
                        setState(() {
                          select = "4";
                          onselect1 = "1";
                          showwidget = "ອານຸມັດເຄື່ອງຂາຍ";
                          Navigator.of(context).pop();
                          //  Get.toNamed("/adminpage/settingconfirm");
                        });
                      },
                      coloricon: select == "4" ? colordarkblue : colorblack,
                      colortext: select == "4" ? colordarkblue : colorblack,
                      text: "ອານຸມັດເຄື່ອງຂາຍ",
                    ),
                  ],
                ),
                // ການຕັ້ງງວດ ແລະ ເປີດ
                ExpansionTile(
                  //  trailing: const Text(''),
                  onExpansionChanged: (value) {
                    setState(() {
                      onselect1 = "2";
                    });
                  },
                  title: Text("ການຕັ້ງງວດ ແລະ ເປີດ",
                      style: TextStyle(
                          fontFamily: phetsarath,
                          fontSize: fontmenu,
                          color: onselect1 == "2" ? colordarkblue : colorblack,
                          fontWeight: FontWeight.bold)),
                  leading: Icon(Icons.check_circle,
                      color: onselect1 == "2" ? colordarkblue : colorblack),
                  children: [
                    ListTitleSetting(
                      onTap: () {
                        setState(() {
                          select = "5";
                          onselect1 = "2";
                          showwidget = "ສ້າງງວດຈຳຫນ່າຍ";
                          Navigator.of(context).pop();
                        });
                      },
                      text: "ສ້າງງວດຈຳຫນ່າຍ",
                      coloricon: select == "5" ? colordarkblue : colorblack,
                      colortext: select == "5" ? colordarkblue : colorblack,
                    ),
                    ListTitleSetting(
                      onTap: () {
                        setState(() {
                          select = "6";
                          onselect1 = "2";
                          showwidget = "ປ້ອນເລກອອກ";
                          Navigator.of(context).pop();
                        });
                      },
                      coloricon: select == "6" ? colordarkblue : colorblack,
                      colortext: select == "6" ? colordarkblue : colorblack,
                      text: "ປ້ອນເລກອອກ",
                    ),
                    ListTitleSetting(
                      onTap: () {
                        setState(() {
                          select = "7";
                          onselect1 = "2";
                          showwidget = "ກຳນົດ Quota ການຂາຍ";
                          Navigator.of(context).pop();
                        });
                      },
                      coloricon: select == "7" ? colordarkblue : colorblack,
                      colortext: select == "7" ? colordarkblue : colorblack,
                      text: "ກຳນົດ Quota ການຂາຍ",
                    ),
                  ],
                ),
                //ເບີ່ງຂໍ້ມູນຂາຍ
                ExpansionTile(
                  //  trailing: const Text(''),
                  onExpansionChanged: (value) {
                    setState(() {
                      onselect1 = "3";
                    });
                  },
                  title: Text("ເບີ່ງຂໍ້ມູນຂາຍ",
                      style: TextStyle(
                          fontFamily: phetsarath,
                          fontSize: fontmenu,
                          color: onselect1 == "3" ? colordarkblue : colorblack,
                          fontWeight: FontWeight.bold)),
                  leading: Icon(Icons.calculate,
                      color: onselect1 == "3" ? colordarkblue : colorblack),
                  children: [
                    // ListTitleSetting(
                    //   onTap: () {
                    //     setState(() {
                    //       select = "8";
                    //       onselect1 = "3";
                    //     });
                    //   },
                    //   text: "ເບີ່ງການຂາຍປະຈຸບັນ",
                    //   coloricon:
                    //       select == "8" ? colordarkblue : colorblack,
                    //   colortext:
                    //       select == "8" ? colordarkblue : colorblack,
                    // ),
                    // ListTitleSetting(
                    //   onTap: () {
                    //     setState(() {
                    //       select = "9";
                    //       onselect1 = "3";
                    //     });
                    //   },
                    //   coloricon:
                    //       select == "9" ? colordarkblue : colorblack,
                    //   colortext:
                    //       select == "9" ? colordarkblue : colorblack,
                    //   text: "ເບີ່ງຜູ້ຂາຍ",
                    // ),
                    ListTitleSetting(
                      onTap: () {
                        setState(() {
                          select = "10";
                          onselect1 = "3";
                          showwidget = "Block ຜູ້ຂາຍ";
                          Navigator.of(context).pop();
                        });
                      },
                      coloricon: select == "10" ? colordarkblue : colorblack,
                      colortext: select == "10" ? colordarkblue : colorblack,
                      text: "Block ຜູ້ຂາຍ",
                    ),
                    ListTitleSetting(
                      onTap: () {
                        setState(() {
                          select = "11";
                          onselect1 = "3";
                          showwidget = "ເບີ່ງຂໍ້ມູນຂາຍປະຈຸບັນ";
                          Navigator.of(context).pop();
                        });
                      },
                      coloricon: select == "11" ? colordarkblue : colorblack,
                      colortext: select == "11" ? colordarkblue : colorblack,
                      text: "ເບີ່ງຂໍ້ມູນຂາຍປະຈຸບັນ",
                    ),
                    ListTitleSetting(
                      onTap: () {
                        setState(() {
                          select = "12";
                          onselect1 = "3";
                          showwidget = "ຍົກເລີກບິນຂາຍ";
                        Navigator.of(context).pop();
                        });
                      },
                      coloricon: select == "12" ? colordarkblue : colorblack,
                      colortext: select == "12" ? colordarkblue : colorblack,
                      text: "ຍົກເລີກບິນຂາຍ",
                    ),
                  ],
                ),
                //ການເງິນ
                ExpansionTile(
                  //  trailing: const Text(''),
                  onExpansionChanged: (value) {
                    setState(() {
                      onselect1 = "4";
                    });
                  },
                  title: Text("ການເງິນ",
                      style: TextStyle(
                          fontFamily: phetsarath,
                          fontSize: fontmenu,
                          color: onselect1 == "4" ? colordarkblue : colorblack,
                          fontWeight: FontWeight.bold)),
                  leading: Icon(Icons.monetization_on,
                      color: onselect1 == "4" ? colordarkblue : colorblack),

                  children: [
                    ListTitleSetting(
                      onTap: () {
                        setState(() {
                          select = "13";
                          onselect1 = "4";
                          showwidget = "ກວດຈ່າຍເງິນລາງວັນ";
                          Navigator.of(context).pop();
                        });
                      },
                      text: "ກວດຈ່າຍເງິນລາງວັນ",
                      coloricon: select == "13" ? colordarkblue : colorblack,
                      colortext: select == "13" ? colordarkblue : colorblack,
                    ),
                    // ListTitleSetting(
                    //   onTap: () {
                    //     setState(() {
                    //       select = "8";
                    //       onselect1 = "3";
                    //     });
                    //   },
                    //   coloricon: select == "14" ? colordarkblue : colorblack,
                    //   colortext: select == "14" ? colordarkblue : colorblack,
                    //   text: "ເບີ່ງຜູ້ຂາຍ",
                    // ),
                    // ListTitleSetting(
                    //   onTap: () {
                    //     setState(() {
                    //       select = "15";
                    //       onselect1 = "3";
                    //     });
                    //   },
                    //   coloricon: select == "15" ? colordarkblue : colorblack,
                    //   colortext: select == "15" ? colordarkblue : colorblack,
                    //   text: "Block ຜູ້ຂາຍ",
                    // ),
                    // ListTitleSetting(
                    //   onTap: () {
                    //     setState(() {
                    //       select = "16";
                    //       onselect1 = "3";
                    //     });
                    //   },
                    //   coloricon: select == "16" ? colordarkblue : colorblack,
                    //   colortext: select == "16" ? colordarkblue : colorblack,
                    //   text: "ປະຫວັດການຂາຍ",
                    // ),
                    // ListTitleSetting(
                    //   onTap: () {
                    //     setState(() {
                    //       select = "17";
                    //       onselect1 = "3";
                    //     });
                    //   },
                    //   coloricon: select == "17" ? colordarkblue : colorblack,
                    //   colortext: select == "17" ? colordarkblue : colorblack,
                    //   text: "ຍົກເລີກບິນຂາຍ",
                    // ),
                  ],
                ),
                //ລາຍງານ
                ExpansionTile(
                  //  trailing: const Text(''),
                  // trailing: const Icon(
                  //   Icons.close,
                  //   color: colorred,
                  // ),
                  // trailing: const Text(''),
                  onExpansionChanged: (value) {
                    setState(() {
                      onselect1 = "8";
                    });
                  },
                  title: Text("ລາຍງານ",
                      style: TextStyle(
                          fontFamily: phetsarath,
                          fontSize: fontmenu,
                          color: onselect1 == "8" ? colordarkblue : colorblack,
                          fontWeight: FontWeight.bold)),
                  leading: Icon(Icons.view_comfortable_outlined,
                      color: onselect1 == "8" ? colordarkblue : colorblack),
                  children: [
                    ListTitleSetting(
                      onTap: () {
                        setState(() {
                          select = "8";
                          onselect1 = "8";
                          showwidget = "ພິມການຂາຍ";
                          Navigator.of(context).pop();
                        });
                      },
                      text: "ພິມການຂາຍ",
                      coloricon: select == "8" ? colordarkblue : colorblack,
                      colortext: select == "8" ? colordarkblue : colorblack,
                    ),
                    // ListTitleSetting(
                    //   onTap: () {
                    //     setState(() {
                    //       select = "8";
                    //       onselect1 = "3";
                    //     });
                    //   },
                    //   coloricon: select == "8" ? colordarkblue : colorblack,
                    //   colortext: select == "8" ? colordarkblue : colorblack,
                    //   text: "ເບີ່ງຜູ້ຂາຍ",
                    // ),
                    // ListTitleSetting(
                    //   onTap: () {
                    //     setState(() {
                    //       select = "9";
                    //       onselect1 = "3";
                    //     });
                    //   },
                    //   coloricon: select == "9" ? colordarkblue : colorblack,
                    //   colortext: select == "9" ? colordarkblue : colorblack,
                    //   text: "Block ຜູ້ຂາຍ",
                    // ),
                    // ListTitleSetting(
                    //   onTap: () {
                    //     setState(() {
                    //       select = "10";
                    //       onselect1 = "3";
                    //     });
                    //   },
                    //   coloricon: select == "10" ? colordarkblue : colorblack,
                    //   colortext: select == "10" ? colordarkblue : colorblack,
                    //   text: "ປະຫວັດການຂາຍ",
                    // ),
                    // ListTitleSetting(
                    //   onTap: () {
                    //     setState(() {
                    //       select = "11";
                    //       onselect1 = "3";
                    //     });
                    //   },
                    //   coloricon: select == "11" ? colordarkblue : colorblack,
                    //   colortext: select == "11" ? colordarkblue : colorblack,
                    //   text: "ຍົກເລີກບິນຂາຍ",
                    // ),
                  ],
                ),
                //ປ່ຽນລະຫັດ
                ExpansionTile(
                  trailing: const Text(''),
                  onExpansionChanged: (value) {
                    setState(() {
                      select = "";
                      onselect1 = "5";
                      showwidget = "ປ່ຽນລະຫັດ";
                      Navigator.of(context).pop();
                    });
                  },
                  title: Text("ປ່ຽນລະຫັດ",
                      style: TextStyle(
                          fontFamily: phetsarath,
                          fontSize: fontmenu,
                          color: onselect1 == "5" ? colordarkblue : colorblack,
                          fontWeight: FontWeight.bold)),
                  leading: Icon(Icons.lock,
                      color: onselect1 == "5" ? colordarkblue : colorblack),
                  //  children: [
                  // ListTitleSetting(
                  //   onTap: () {
                  //     setState(() {
                  //       select = "7";
                  //       onselect1 = "3";
                  //     });
                  //   },
                  //   text: "ເບີ່ງການຂາຍປະຈຸບັນ",
                  //   coloricon: select == "7" ? colordarkblue : colorblack,
                  //   colortext: select == "7" ? colordarkblue : colorblack,
                  // ),
                  // ListTitleSetting(
                  //   onTap: () {
                  //     setState(() {
                  //       select = "8";
                  //       onselect1 = "3";
                  //     });
                  //   },
                  //   coloricon: select == "8" ? colordarkblue : colorblack,
                  //   colortext: select == "8" ? colordarkblue : colorblack,
                  //   text: "ເບີ່ງຜູ້ຂາຍ",
                  // ),
                  // ListTitleSetting(
                  //   onTap: () {
                  //     setState(() {
                  //       select = "9";
                  //       onselect1 = "3";
                  //     });
                  //   },
                  //   coloricon: select == "9" ? colordarkblue : colorblack,
                  //   colortext: select == "9" ? colordarkblue : colorblack,
                  //   text: "Block ຜູ້ຂາຍ",
                  // ),
                  // ListTitleSetting(
                  //   onTap: () {
                  //     setState(() {
                  //       select = "10";
                  //       onselect1 = "3";
                  //     });
                  //   },
                  //   coloricon: select == "10" ? colordarkblue : colorblack,
                  //   colortext: select == "10" ? colordarkblue : colorblack,
                  //   text: "ປະຫວັດການຂາຍ",
                  // ),
                  // ListTitleSetting(
                  //   onTap: () {
                  //     setState(() {
                  //       select = "11";
                  //       onselect1 = "3";
                  //     });
                  //   },
                  //   coloricon: select == "11" ? colordarkblue : colorblack,
                  //   colortext: select == "11" ? colordarkblue : colorblack,
                  //   text: "ຍົກເລີກບິນຂາຍ",
                  // ),
                  //  ],
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                    child: Drawer(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // SizedBox(
                        //   height: 75,
                        //   width: double.infinity,
                        //   child: DrawerHeader(
                        //     child: Center(
                        //       child: Text(
                        //         "Lottery LTT",
                        //         style: TextStyle(
                        //             fontFamily: phetsarath,
                        //             fontSize: fonttitle,
                        //             fontWeight: FontWeight.bold),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          width: double.infinity,
                          height: 80,
                          child: Center(
                            child: Text(
                              "Lottery LTT",
                              style: TextStyle(
                                  color: colordarkblue,
                                  fontFamily: phetsarath,
                                  fontSize: fonttitle,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        //ຕັ້ງຄ່າ
                        ExpansionTile(
                          // trailing: const Text(''),
                          onExpansionChanged: (value) {
                            setState(() {
                              onselect1 = "1";
                            });
                          },
                          title: Text("ຕັ້ງຄ່າ",
                              style: TextStyle(
                                  fontFamily: phetsarath,
                                  fontSize: fontmenu,
                                  color: onselect1 == "1"
                                      ? colordarkblue
                                      : colorblack,
                                  fontWeight: FontWeight.bold)),
                          leading: Icon(Icons.settings,
                              color: onselect1 == "1"
                                  ? colordarkblue
                                  : colorblack),
                          children: [
                            ListTitleSetting(
                              onTap: () {
                                setState(() {
                                  select = "0";
                                  onselect1 = "1";
                                  showwidget = "ຕັ້ງຄ່າສາຂາ";
                                  //  Get.offAllNamed("/adminpage/settingbranch");
                                });
                              },
                              text: "ຕັ້ງຄ່າສາຂາ",
                              coloricon:
                                  select == "0" ? colordarkblue : colorblack,
                              colortext:
                                  select == "0" ? colordarkblue : colorblack,
                            ),
                            ListTitleSetting(
                              onTap: () {
                                setState(() {
                                  select = "1";
                                  onselect1 = "1";
                                  showwidget = "ຕັ້ງຄ່າຫນ່ວຍ";
                                  // Get.toNamed("/adminpage/settingunit");
                                });
                              },
                              coloricon:
                                  select == "1" ? colordarkblue : colorblack,
                              colortext:
                                  select == "1" ? colordarkblue : colorblack,
                              text: "ຕັ້ງຄ່າຫນ່ວຍ",
                            ),
                            ListTitleSetting(
                              onTap: () {
                                setState(() {
                                  select = "2";
                                  onselect1 = "1";
                                  showwidget = "ຕັ້ງຄ່າຄົນຂາຍ";
                                  // Get.toNamed("/adminpage/settingsaler");
                                });
                              },
                              coloricon:
                                  select == "2" ? colordarkblue : colorblack,
                              colortext:
                                  select == "2" ? colordarkblue : colorblack,
                              text: "ຕັ້ງຄ່າຄົນຂາຍ",
                            ),
                            // ListTitleSetting(
                            //   onTap: () {
                            //     setState(() {
                            //       select = "3";
                            //       onselect1 = "1";
                            //       showwidget = "ຕັ້ງຄ່າເຄື່ອງຂາຍ";
                            //       //  Get.toNamed("/adminpage/settingconfirm");
                            //     });
                            //   },
                            //   coloricon:
                            //       select == "3" ? colordarkblue : colorblack,
                            //   colortext:
                            //       select == "3" ? colordarkblue : colorblack,
                            //   text: "ຕັ້ງຄ່າເຄື່ອງຂາຍ",
                            // ),
                            ListTitleSetting(
                              onTap: () {
                                setState(() {
                                  select = "4";
                                  onselect1 = "1";
                                  showwidget = "ອານຸມັດເຄື່ອງຂາຍ";
                                  //  Get.toNamed("/adminpage/settingconfirm");
                                });
                              },
                              coloricon:
                                  select == "4" ? colordarkblue : colorblack,
                              colortext:
                                  select == "4" ? colordarkblue : colorblack,
                              text: "ອານຸມັດເຄື່ອງຂາຍ",
                            ),
                          ],
                        ),
                        // ການຕັ້ງງວດ ແລະ ເປີດ
                        ExpansionTile(
                          //  trailing: const Text(''),
                          onExpansionChanged: (value) {
                            setState(() {
                              onselect1 = "2";
                            });
                          },
                          title: Text("ການຕັ້ງງວດ ແລະ ເປີດ",
                              style: TextStyle(
                                  fontFamily: phetsarath,
                                  fontSize: fontmenu,
                                  color: onselect1 == "2"
                                      ? colordarkblue
                                      : colorblack,
                                  fontWeight: FontWeight.bold)),
                          leading: Icon(Icons.check_circle,
                              color: onselect1 == "2"
                                  ? colordarkblue
                                  : colorblack),
                          children: [
                            ListTitleSetting(
                              onTap: () {
                                setState(() {
                                  select = "5";
                                  onselect1 = "2";
                                  showwidget = "ສ້າງງວດຈຳຫນ່າຍ";
                                });
                              },
                              text: "ສ້າງງວດຈຳຫນ່າຍ",
                              coloricon:
                                  select == "5" ? colordarkblue : colorblack,
                              colortext:
                                  select == "5" ? colordarkblue : colorblack,
                            ),
                            ListTitleSetting(
                              onTap: () {
                                setState(() {
                                  select = "6";
                                  onselect1 = "2";
                                  showwidget = "ປ້ອນເລກອອກ";
                                });
                              },
                              coloricon:
                                  select == "6" ? colordarkblue : colorblack,
                              colortext:
                                  select == "6" ? colordarkblue : colorblack,
                              text: "ປ້ອນເລກອອກ",
                            ),
                            ListTitleSetting(
                              onTap: () {
                                setState(() {
                                  select = "7";
                                  onselect1 = "2";
                                  showwidget = "ກຳນົດ Quota ການຂາຍ";
                                });
                              },
                              coloricon:
                                  select == "7" ? colordarkblue : colorblack,
                              colortext:
                                  select == "7" ? colordarkblue : colorblack,
                              text: "ກຳນົດ Quota ການຂາຍ",
                            ),
                          ],
                        ),
                        //ເບີ່ງຂໍ້ມູນຂາຍ
                        ExpansionTile(
                          //  trailing: const Text(''),
                          onExpansionChanged: (value) {
                            setState(() {
                              onselect1 = "3";
                            });
                          },
                          title: Text("ເບີ່ງຂໍ້ມູນຂາຍ",
                              style: TextStyle(
                                  fontFamily: phetsarath,
                                  fontSize: fontmenu,
                                  color: onselect1 == "3"
                                      ? colordarkblue
                                      : colorblack,
                                  fontWeight: FontWeight.bold)),
                          leading: Icon(Icons.calculate,
                              color: onselect1 == "3"
                                  ? colordarkblue
                                  : colorblack),
                          children: [
                            // ListTitleSetting(
                            //   onTap: () {
                            //     setState(() {
                            //       select = "8";
                            //       onselect1 = "3";
                            //     });
                            //   },
                            //   text: "ເບີ່ງການຂາຍປະຈຸບັນ",
                            //   coloricon:
                            //       select == "8" ? colordarkblue : colorblack,
                            //   colortext:
                            //       select == "8" ? colordarkblue : colorblack,
                            // ),
                            // ListTitleSetting(
                            //   onTap: () {
                            //     setState(() {
                            //       select = "9";
                            //       onselect1 = "3";
                            //     });
                            //   },
                            //   coloricon:
                            //       select == "9" ? colordarkblue : colorblack,
                            //   colortext:
                            //       select == "9" ? colordarkblue : colorblack,
                            //   text: "ເບີ່ງຜູ້ຂາຍ",
                            // ),
                            ListTitleSetting(
                              onTap: () {
                                setState(() {
                                  select = "10";
                                  onselect1 = "3";
                                  showwidget = "Block ຜູ້ຂາຍ";
                                });
                              },
                              coloricon:
                                  select == "10" ? colordarkblue : colorblack,
                              colortext:
                                  select == "10" ? colordarkblue : colorblack,
                              text: "Block ຜູ້ຂາຍ",
                            ),
                            ListTitleSetting(
                              onTap: () {
                                setState(() {
                                  select = "11";
                                  onselect1 = "3";
                                  showwidget = "ເບີ່ງຂໍ້ມູນຂາຍປະຈຸບັນ";
                                });
                              },
                              coloricon:
                                  select == "11" ? colordarkblue : colorblack,
                              colortext:
                                  select == "11" ? colordarkblue : colorblack,
                              text: "ເບີ່ງຂໍ້ມູນຂາຍປະຈຸບັນ",
                            ),
                            ListTitleSetting(
                              onTap: () {
                                setState(() {
                                  select = "12";
                                  onselect1 = "3";
                                  showwidget = "ຍົກເລີກບິນຂາຍ";
                                });
                              },
                              coloricon:
                                  select == "12" ? colordarkblue : colorblack,
                              colortext:
                                  select == "12" ? colordarkblue : colorblack,
                              text: "ຍົກເລີກບິນຂາຍ",
                            ),
                          ],
                        ),
                        //ການເງິນ
                        ExpansionTile(
                          //  trailing: const Text(''),
                          onExpansionChanged: (value) {
                            setState(() {
                              onselect1 = "4";
                            });
                          },
                          title: Text("ການເງິນ",
                              style: TextStyle(
                                  fontFamily: phetsarath,
                                  fontSize: fontmenu,
                                  color: onselect1 == "4"
                                      ? colordarkblue
                                      : colorblack,
                                  fontWeight: FontWeight.bold)),
                          leading: Icon(Icons.monetization_on,
                              color: onselect1 == "4"
                                  ? colordarkblue
                                  : colorblack),

                          children: [
                            ListTitleSetting(
                              onTap: () {
                                setState(() {
                                  select = "13";
                                  onselect1 = "4";
                                  showwidget = "ກວດຈ່າຍເງິນລາງວັນ";
                                });
                              },
                              text: "ກວດຈ່າຍເງິນລາງວັນ",
                              coloricon:
                                  select == "13" ? colordarkblue : colorblack,
                              colortext:
                                  select == "13" ? colordarkblue : colorblack,
                            ),
                            // ListTitleSetting(
                            //   onTap: () {
                            //     setState(() {
                            //       select = "8";
                            //       onselect1 = "3";
                            //     });
                            //   },
                            //   coloricon: select == "14" ? colordarkblue : colorblack,
                            //   colortext: select == "14" ? colordarkblue : colorblack,
                            //   text: "ເບີ່ງຜູ້ຂາຍ",
                            // ),
                            // ListTitleSetting(
                            //   onTap: () {
                            //     setState(() {
                            //       select = "15";
                            //       onselect1 = "3";
                            //     });
                            //   },
                            //   coloricon: select == "15" ? colordarkblue : colorblack,
                            //   colortext: select == "15" ? colordarkblue : colorblack,
                            //   text: "Block ຜູ້ຂາຍ",
                            // ),
                            // ListTitleSetting(
                            //   onTap: () {
                            //     setState(() {
                            //       select = "16";
                            //       onselect1 = "3";
                            //     });
                            //   },
                            //   coloricon: select == "16" ? colordarkblue : colorblack,
                            //   colortext: select == "16" ? colordarkblue : colorblack,
                            //   text: "ປະຫວັດການຂາຍ",
                            // ),
                            // ListTitleSetting(
                            //   onTap: () {
                            //     setState(() {
                            //       select = "17";
                            //       onselect1 = "3";
                            //     });
                            //   },
                            //   coloricon: select == "17" ? colordarkblue : colorblack,
                            //   colortext: select == "17" ? colordarkblue : colorblack,
                            //   text: "ຍົກເລີກບິນຂາຍ",
                            // ),
                          ],
                        ),
                        //ລາຍງານ
                        ExpansionTile(
                          //  trailing: const Text(''),
                          // trailing: const Icon(
                          //   Icons.close,
                          //   color: colorred,
                          // ),
                          // trailing: const Text(''),
                          onExpansionChanged: (value) {
                            setState(() {
                              onselect1 = "8";
                            });
                          },
                          title: Text("ລາຍງານ",
                              style: TextStyle(
                                  fontFamily: phetsarath,
                                  fontSize: fontmenu,
                                  color: onselect1 == "8"
                                      ? colordarkblue
                                      : colorblack,
                                  fontWeight: FontWeight.bold)),
                          leading: Icon(Icons.view_comfortable_outlined,
                              color: onselect1 == "8"
                                  ? colordarkblue
                                  : colorblack),
                          children: [
                            ListTitleSetting(
                              onTap: () {
                                setState(() {
                                  select = "8";
                                  onselect1 = "8";
                                  showwidget = "ພິມການຂາຍ";
                                });
                              },
                              text: "ພິມການຂາຍ",
                              coloricon:
                                  select == "8" ? colordarkblue : colorblack,
                              colortext:
                                  select == "8" ? colordarkblue : colorblack,
                            ),
                            // ListTitleSetting(
                            //   onTap: () {
                            //     setState(() {
                            //       select = "8";
                            //       onselect1 = "3";
                            //     });
                            //   },
                            //   coloricon: select == "8" ? colordarkblue : colorblack,
                            //   colortext: select == "8" ? colordarkblue : colorblack,
                            //   text: "ເບີ່ງຜູ້ຂາຍ",
                            // ),
                            // ListTitleSetting(
                            //   onTap: () {
                            //     setState(() {
                            //       select = "9";
                            //       onselect1 = "3";
                            //     });
                            //   },
                            //   coloricon: select == "9" ? colordarkblue : colorblack,
                            //   colortext: select == "9" ? colordarkblue : colorblack,
                            //   text: "Block ຜູ້ຂາຍ",
                            // ),
                            // ListTitleSetting(
                            //   onTap: () {
                            //     setState(() {
                            //       select = "10";
                            //       onselect1 = "3";
                            //     });
                            //   },
                            //   coloricon: select == "10" ? colordarkblue : colorblack,
                            //   colortext: select == "10" ? colordarkblue : colorblack,
                            //   text: "ປະຫວັດການຂາຍ",
                            // ),
                            // ListTitleSetting(
                            //   onTap: () {
                            //     setState(() {
                            //       select = "11";
                            //       onselect1 = "3";
                            //     });
                            //   },
                            //   coloricon: select == "11" ? colordarkblue : colorblack,
                            //   colortext: select == "11" ? colordarkblue : colorblack,
                            //   text: "ຍົກເລີກບິນຂາຍ",
                            // ),
                          ],
                        ),
                        //ປ່ຽນລະຫັດ
                        ExpansionTile(
                          trailing: const Text(''),
                          onExpansionChanged: (value) {
                            setState(() {
                              select = "";
                              onselect1 = "5";
                              showwidget = "ປ່ຽນລະຫັດ";
                            });
                          },
                          title: Text("ປ່ຽນລະຫັດ",
                              style: TextStyle(
                                  fontFamily: phetsarath,
                                  fontSize: fontmenu,
                                  color: onselect1 == "5"
                                      ? colordarkblue
                                      : colorblack,
                                  fontWeight: FontWeight.bold)),
                          leading: Icon(Icons.lock,
                              color: onselect1 == "5"
                                  ? colordarkblue
                                  : colorblack),
                          //  children: [
                          // ListTitleSetting(
                          //   onTap: () {
                          //     setState(() {
                          //       select = "7";
                          //       onselect1 = "3";
                          //     });
                          //   },
                          //   text: "ເບີ່ງການຂາຍປະຈຸບັນ",
                          //   coloricon: select == "7" ? colordarkblue : colorblack,
                          //   colortext: select == "7" ? colordarkblue : colorblack,
                          // ),
                          // ListTitleSetting(
                          //   onTap: () {
                          //     setState(() {
                          //       select = "8";
                          //       onselect1 = "3";
                          //     });
                          //   },
                          //   coloricon: select == "8" ? colordarkblue : colorblack,
                          //   colortext: select == "8" ? colordarkblue : colorblack,
                          //   text: "ເບີ່ງຜູ້ຂາຍ",
                          // ),
                          // ListTitleSetting(
                          //   onTap: () {
                          //     setState(() {
                          //       select = "9";
                          //       onselect1 = "3";
                          //     });
                          //   },
                          //   coloricon: select == "9" ? colordarkblue : colorblack,
                          //   colortext: select == "9" ? colordarkblue : colorblack,
                          //   text: "Block ຜູ້ຂາຍ",
                          // ),
                          // ListTitleSetting(
                          //   onTap: () {
                          //     setState(() {
                          //       select = "10";
                          //       onselect1 = "3";
                          //     });
                          //   },
                          //   coloricon: select == "10" ? colordarkblue : colorblack,
                          //   colortext: select == "10" ? colordarkblue : colorblack,
                          //   text: "ປະຫວັດການຂາຍ",
                          // ),
                          // ListTitleSetting(
                          //   onTap: () {
                          //     setState(() {
                          //       select = "11";
                          //       onselect1 = "3";
                          //     });
                          //   },
                          //   coloricon: select == "11" ? colordarkblue : colorblack,
                          //   colortext: select == "11" ? colordarkblue : colorblack,
                          //   text: "ຍົກເລີກບິນຂາຍ",
                          // ),
                          //  ],
                        ),
                      ],
                    ),
                  ),
                )),
              Expanded(
                  flex: 5,
                  child: Container(
                    color: colorbackground,
                    child: showwidget == "ຕັ້ງຄ່າສາຂາ"
                        ? const SettingBranch()
                        : showwidget == "ຕັ້ງຄ່າຫນ່ວຍ"
                            ? const SettingUnit()
                            : showwidget == "ຕັ້ງຄ່າຄົນຂາຍ"
                                ? const SettingSaler()
                                : showwidget == "ອານຸມັດເຄື່ອງຂາຍ"
                                    ? const SettingConfirm()
                                    : showwidget == "ກຳນົດ Quota ການຂາຍ"
                                        ? const Quota()
                                        : showwidget == "ປ້ອນເລກອອກ"
                                            ? const InputLotttery()
                                            : showwidget == "ສ້າງງວດຈຳຫນ່າຍ"
                                                ? const CreateSell()
                                                : showwidget == "ພິມການຂາຍ"
                                                    ? const PrintReport()
                                                    : showwidget ==
                                                            "Block ຜູ້ຂາຍ"
                                                        ? const BlockUser()
                                                        : showwidget ==
                                                                "ຍົກເລີກບິນຂາຍ"
                                                            ? const ReportSale()
                                                            : showwidget ==
                                                                    "ປ່ຽນລະຫັດ"
                                                                ? const Changepassword()
                                                                : showwidget ==
                                                                        "ເບີ່ງຂໍ້ມູນຂາຍປະຈຸບັນ"
                                                                    ? const SeeOnlineSaler()
                                                                    : showwidget ==
                                                                            "ກວດຈ່າຍເງິນລາງວັນ"
                                                                        ? const AwardPayment()
                                                                        :
                                                                        // null
                                                                        Center(
                                                                            child:
                                                                                Text(
                                                                            "ກຳລັງພັດທະນາ . . .",
                                                                            style: TextStyle(
                                                                                fontFamily: phetsarath,
                                                                                color: colorblack,
                                                                                fontSize: fonttitle,
                                                                                fontWeight: FontWeight.bold),
                                                                          )),
                  ))
            ],
          ),
        ),
      );
    }
  }
}

class ListTitleSetting extends StatelessWidget {
  const ListTitleSetting({
    Key key,
    this.onTap,
    this.text,
    this.coloricon,
    this.colortext,
  }) : super(key: key);
  final Function onTap;
  final String text;
  final Color coloricon;
  final Color colortext;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      hoverColor: colorbackground,
      leading: Icon(Icons.circle, size: 15, color: coloricon),
      title: Text(text,
          style: TextStyle(
              fontFamily: phetsarath,
              fontSize: fontgeneral,
              color: colortext,
              fontWeight: FontWeight.normal)),
    );
  }
}
