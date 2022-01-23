// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuCTR extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldglobalKey = GlobalKey<ScaffoldState>();
  final Future<SharedPreferences> preferenc = SharedPreferences.getInstance();
  RxString userid = "".obs;
  RxString user = "".obs;
  RxString email = "".obs;
  RxString token = "".obs;
  RxBool disable = false.obs;
  SharedPreferences prefs;
  GlobalKey<ScaffoldState> get globalKey => scaffoldglobalKey;
  void controllMenu() {
    if (!scaffoldglobalKey.currentState.isDrawerOpen) {
      scaffoldglobalKey.currentState.openDrawer();
    }
  }

  loadSharedPreferences() async {
    prefs = await preferenc;
    userid(prefs.getString("userid"));
    user(prefs.getString("username"));
    email(prefs.getString("email"));
    token(prefs.getString("token"));
  }

  MenuCTR() {
    loadSharedPreferences();
  }
}
