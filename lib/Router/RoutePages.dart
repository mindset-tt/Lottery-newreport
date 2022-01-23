// ignore_for_file: file_names, non_constant_identifier_names
import 'package:get/get.dart';
import 'package:lotterymanagement/Bindings/AdminPageBD.dart';
import 'package:lotterymanagement/Bindings/LoginBD.dart';
import 'package:lotterymanagement/Views/AdmimPages.dart';
import 'package:lotterymanagement/Views/Loginpage.dart';
import 'package:lotterymanagement/Views/Settings/SettingBranch.dart';
import 'package:lotterymanagement/Views/Settings/SettingConfirm.dart';
import 'package:lotterymanagement/Views/Settings/SettingSaler.dart';
import 'package:lotterymanagement/Views/Settings/SettingUnit.dart';
import 'Route.dart';

class RoutePages {
  static var listPages = [
    GetPage(
        name: Routes.LOGIN, 
        page: () => const LoginPages(), 
        binding: LoginBD()),
    GetPage(
        name: Routes.ADMINPAGE,
        page: () => const AdminPages(),
        binding: AdminPageBD()),
    GetPage(
        name: Routes.ADMINPAGE,
        page: () => const SettingBranch(),
        binding: AdminPageBD()),
    GetPage(
        name: Routes.ADMINPAGE,
        page: () => const SettingUnit(),
        binding: AdminPageBD()),
    GetPage(
        name: Routes.ADMINPAGE,
        page: () => const SettingSaler(),
        binding: AdminPageBD()),
    GetPage(
        name: Routes.ADMINPAGE,
        page: () => const SettingConfirm(),
        binding: AdminPageBD()),
  ];
}
