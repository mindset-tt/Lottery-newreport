// ignore_for_file: file_names
import 'package:get/get.dart';
import 'package:lotterymanagement/Controllers/AdminCTR.dart';
import 'package:lotterymanagement/Controllers/Setting/SettingConfirmCTR.dart';
import 'package:lotterymanagement/Controllers/Setting/SettingSalerCTR.dart';
import 'package:lotterymanagement/Controllers/Setting/SettingUnitCTR.dart';
import 'package:lotterymanagement/Controllers/Setting/SettingbranchCTR.dart';

class AdminPageBD extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminCTR>(() => AdminCTR());
     Get.lazyPut<SettingBranchCTR>(() => SettingBranchCTR());
      Get.lazyPut<SettingUnitCTR>(() => SettingUnitCTR());
       Get.lazyPut<SettingSalerCTR>(() => SettingSalerCTR());
        Get.lazyPut<SettingConfirmCTR>(() => SettingConfirmCTR());
  }
}
