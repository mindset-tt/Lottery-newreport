// ignore_for_file: file_names
import 'package:get/get.dart';
import 'package:lotterymanagement/Controllers/LoginCTR.dart';
class LoginBD extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginCTR>(() => LoginCTR());
  }
}
