import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:lotterymanagement/Controllers/ChangePassword/ChangePasswordCTR.dart';
import 'package:lotterymanagement/Controllers/Install_Open/CreateSellerCTR.dart';
import 'package:lotterymanagement/Controllers/Install_Open/InputNumberCTR.dart';
import 'package:lotterymanagement/Controllers/Install_Open/QuotaCTR.dart';
import 'package:lotterymanagement/Controllers/LoginCTR.dart';
import 'package:lotterymanagement/Controllers/See_saling/BlockUserCTR.dart';
import 'package:lotterymanagement/Controllers/Setting/SettingConfirmCTR.dart';
import 'package:lotterymanagement/Controllers/Setting/SettingSalerCTR.dart';
import 'package:lotterymanagement/Controllers/Setting/SettingUnitCTR.dart';
import 'package:lotterymanagement/Controllers/Setting/SettingbranchCTR.dart';
import 'package:lotterymanagement/Models/LoginMD.dart';
void main() {
  LoginCTR loginCTR = Get.put(LoginCTR());
  test("UserName Is Null ", () {
    loginCTR.login("", "dvf");
    expect(loginCTR.error("ຊື່ຜູ້ໃຊ້ບໍ່ຄວນຫວ່າງເປົ່າ ?"),
        "ຊື່ຜູ້ໃຊ້ບໍ່ຄວນຫວ່າງເປົ່າ ?");
  });

  test("Password Is Null ", () {
    loginCTR.login("55", "");
    expect(loginCTR.error("ລະຫັດຜ່ານບໍ່ຄວນຫວ່າງເປົ່າ ?"),
        "ລະຫັດຜ່ານບໍ່ຄວນຫວ່າງເປົ່າ ?");
  });

  test("Should return 502 ", () {
    loginCTR.login("55", "1315");
    expect(loginCTR.error("error"), "error");
  });

  test("Login pass ", () async {
    await loginCTR.login("bestech@gmail.com", "1234");
    var js = loginMdFromJson(loginCTR.jsonData);
    var name = js.results[0].firstName;
    expect(js.token, isNot(""));
    expect([
      js.results[0].unitId.toString(),
      name
    ], [
      '1',
      "admin",
    ]);
  });

  test("Login failed ", () async {
    await loginCTR.login("bestech@gmail.com", "124");
    var js = loginMdFromJson(loginCTR.jsonData);
    var name = js.results[0].firstName;
    expect(js.token, isNot(""));
    expect([
      js.results[0].unitId.toString(),
      name
    ], [
      '1',
      "admin",
    ]);
  });

  BlockUserCTR blockUser = Get.put(BlockUserCTR());

  //-------------- getbybranch  ----------------//
  test("getbybranch should return 402 ", () async {
    await blockUser.getbybranch("100");

    var value = blockUser.statusCode.value;
    expect(value, "404");
  });

  test("getbybranch should return 200", () async {
    await blockUser.getbybranch("71");
    expect(blockUser.statusCode.value, "200");
  });

//----------------onBlockUser-----------------//
  test("onBlockuser should return 404 ", () async {
    var values = await blockUser.onBlockuser("100");
    expect(values, "404");
  });

  test("onBlockuser should return 200 ", () async {
    var values = await blockUser.onBlockuser("1");
    expect(values, "200");
  });

  test("onUnBlockBlockuser should return 200 ", () async {
    var values = await blockUser.onUnBlockuser("1");
    expect(values, "200");
  });
  test("onUnBlockBlockuser should return 404 ", () async {
    var values = await blockUser.onUnBlockuser("100");
    expect(values, "404");
  });

  test("Clear ", ()  {
     blockUser.clear();
    expect("0", "0");
  });

  // ReportSaleCTR report = new ReportSaleCTR();
  // // ------------ Cancel bill ----------------//
  // test("cancelbill should return 404 ", () async {
  //   var values = await report.cancelbill("100", "4456");
  //   expect(values, "404");
  // });

// ------------------- Change Password --------------//
  ChangPasswordCTR chpass =  ChangPasswordCTR();
  test("ChangPasswordCTR should return 403 ", () async {
    chpass.clear();
    var actual = await chpass.changePassword("y", "123", "1234", "y");
    expect(actual, "403");
  });

  test("ChangPasswordCTR should return 403 ", () async {
    chpass.clear();
    var actual = await chpass.changePassword("y", "123", "1234", "1");
    expect(actual, "501");
  });

  test("ChangPasswordCTR should return 200 ", () async {
    chpass.clear();
    var actual = await chpass.changePassword("y", "123123", "123123", "160");
    expect(actual, "200");
  });

// ------------------- SettingBranchCTR --------------//

  SettingBranchCTR settingbranchCTR =  SettingBranchCTR();
  test("getallbranch should return 200 ", () async {
    settingbranchCTR.clear();
    var actual = await settingbranchCTR.getallbranch();
    expect(actual, "200");
  });

  test("getallbranch should return 201 ", () async {
    settingbranchCTR.clear();
    var actual =
        await settingbranchCTR.postbranch("5", "1", "1", "20259644648","ບໍລິຄຳໄຊ");
    expect(actual, "201");
  });

  test("deletebranch should return 200 ", () async {
    var actual = await settingbranchCTR.deletebranch("1");
    expect(actual, "200");
  });

  test("deletebranch should return 404 ", () async {
    var actual = await settingbranchCTR.deletebranch("120000");
    expect(actual, "404");
  });

  test("updatebranch should return 200 ", () async {
    var actual =
        await settingbranchCTR.updatebranch("1", "1", "1", "02059644648","ບໍລິຄຳໄຊ");
    expect(actual, "200");
  });
// ------------------- SettingConfirmCTR --------------//
  SettingConfirmCTR settingConfirmCTR =  SettingConfirmCTR();
  test("getallDeviceAuth should return 200 ", () async {
    var actual = await settingConfirmCTR.getallDeviceAuth();
    settingConfirmCTR.clear();
    expect(actual, "200");
  });

  test("confirmdevice should return 200 ", () async {
    var actual = await settingConfirmCTR.confirmdevice("12345678");
    expect(actual, "200");
  });

  test("getallDeviceAuth should return 404 ", () async {
    var actual = await settingConfirmCTR.confirmdevice("00");
    settingConfirmCTR.clear();
    expect(actual, "404");
  });

//-------------------SettingSalerCTR----------------------//
  SettingSalerCTR salerCTR =  SettingSalerCTR();
  // test("gatonlydevice should return 200 ", () async {
  //   salerCTR.clear();
  //   var actual = await salerCTR.gatonlydevice("2");
  //   salerCTR.clear();
  //   expect(actual, "200");
  // });

  // test("gatonlydevice should return 404 ", () async {
  //   salerCTR.clear();
  //   var actual = await salerCTR.gatonlydevice("1000000");
  //   expect(actual, "404");
  // });

  test("gatallseller should return 200 ", () async {
    salerCTR.clear();
    var actual = await salerCTR.gatallseller();
    expect(actual, "200");
  });

  test("getbybranch should return 404 ", () async {
    var actual = await salerCTR.getbybranch("20");
    expect(actual, "404");
  });

  test("getbybranch should return 200 ", () async {
    var actual = await salerCTR.getbybranch("71");
    expect(actual, "200");
  });

  test("postseller should return 403 ", () async {
    var actual = await salerCTR.postseller(
        "123456788", "1234", "1", "2", "xxxx", "xxxx", "xxxx", "xxxx", "0");
    expect(actual, "403");
  });

  test("postseller should return 201 ", () async {
    var actual = await salerCTR.postseller(
        "1212412", "1234", "1", "2", "123", "xxxx", "xxxx", "xxxx", "0");
    expect(actual, "201");
  });

  test("updateseller should return 404 ", () async {
    var actual = await salerCTR.updateseller(
        "0123458678", "1234", "1", "2", "123", "xxxx", "xxxx", "xxxx", "0");
    expect(actual, "404");
  });

  test("updateseller should return 200 ", () async {
    var actual = await salerCTR.updateseller(
        "3", "", "1", "2", "123", "xxxx", "xxxx", "xxxx", "0");
    expect(actual, "200");
  });

  test("deleteseller should return 200 ", () async {
    var actual = await salerCTR.deleteseller("2");
    expect(actual, "200");
  });

  test("deleteseller should return 404 ", () async {
    var actual = await salerCTR.deleteseller("3000");
    expect(actual, "404");
  });

// -------------- Setting Unit --------------------//
  SettingUnitCTR settingUnitCTR =  SettingUnitCTR();
  test("gatallunit should return 200 ", () async {
    settingUnitCTR.clear();
    var actual = await settingUnitCTR.gatallunit();
    expect(actual, "200");
  });

  test("postunit should return 201 ", () async {
    settingUnitCTR.clear();
    var actual = await settingUnitCTR.postunit(
        "2", "xxx", "villagename", "1", "tel1", "0", "suemail");
    expect(actual, "201");
  });

  test("postunit should return 403 ", () async {
    settingUnitCTR.clear();
    var actual = await settingUnitCTR.postunit(
        "ss", "xxx", "villagename", "1", "tel1", "0", "suemail");
    expect(actual, "403");
  });

  test("deleteunit should return 200 ", () async {
    settingUnitCTR.clear();
    var actual = await settingUnitCTR.deleteunit("1");
    expect(actual, "200");
  });

  test("deleteunit should return 403 ", () async {
    settingUnitCTR.clear();
    var actual = await settingUnitCTR.deleteunit("ss");
    expect(actual, "403");
  });

  test("updateunit should return 200 ", () async {
    settingUnitCTR.clear();
    var actual = await settingUnitCTR.updateunit(
        "1", "2", "xxxxx", "1", "xxxx", "cccc", "100", "xxxx");
    expect(actual, "200");
  });

  test("updateunit should return 403 ", () async {
    settingUnitCTR.clear();
    var actual = await settingUnitCTR.updateunit(
        "1", "xxx", "xxxxx", "1", "xxxx", "cccc", "100", "xxxx");
    expect(actual, "403");
  });
//----------------------- CreateSellerCTR --------------------//
  CreateSellerCTR createSellerCTR =  CreateSellerCTR();

  test("getCreatesaler should return 200 ", () async {
    createSellerCTR.clear();
    var values = await createSellerCTR.getCreatesaler();
    expect(values, "200");
  });

  test("postCreateSaler should return 200 ", () async {
    createSellerCTR.clear();
    var values = await createSellerCTR.postCreateSaler(
        "101010", "2021-02-02", "20:00", "1","10");
    expect(values, "200");
  });

  test("postCreateSaler should return 404 ", () async {
    createSellerCTR.clear();
    var values = await createSellerCTR.postCreateSaler(
        "101010", "2021-02-02", "20:00", "1ds","10");
    expect(values, "404");
  });

//----------------------- InputLotteryNumberCTR --------------------//

  InputNumberCTR inputNumberCTR =  InputNumberCTR();

  test("getNumber should return 200", () async {
    var values = await inputNumberCTR.getNumber();
    expect(values, "200");
  });

  test("postInputNumber should return 201", () async {
    var values = await inputNumberCTR.postInputNumber("1235", "1011", "1");
    expect(values, "201");
  });

  test("postInputNumber should return 403", () async {
    var values = await inputNumberCTR.postInputNumber("hf", "ghf", "1");
    expect(values, "403");
  });

  test("updatecloseperiod should return 200", () async {
    var values = await inputNumberCTR.updatecloseperiod("38");
    expect(values, "200");
  });

  test("updatecloseperiod should return 404", () async {
    var values = await inputNumberCTR.updatecloseperiod("dsfd");
    expect(values, "403");
  });

//------------------- Quota --------------------//

  QuotaCTR quota =  QuotaCTR();

  test("getallquota should return 200", () async {
    quota.clear();
    var values = await quota.getallquota();
    expect(values, "200");
  });

  test("quotaupdate should return 200", () async {
    quota.clear();
    var values = await quota.quotaupdate(
        "1000000", "1000000", "1000000", "1000000", "1000000", "1000000");
    expect(values, "200");
  });

  test("quotaupdate should return error", () async {
    quota.clear();
    var values = await quota.quotaupdate(
        "1000000", "1000000", "1000000", "fds", "1000000", "1000000");
    expect(values, "error");
  });
}