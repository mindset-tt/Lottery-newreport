// ignore_for_file: file_names, prefer_collection_literals, missing_return, prefer_typing_uninitialized_variables
import 'package:get/get.dart';
import 'package:lotterymanagement/Models/LoginMD.dart';
import 'package:lotterymanagement/UrlRespose/Http_Url.dart';
import 'package:http/http.dart' as http;
import 'package:lotterymanagement/UrlRespose/StatusCodeError.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCTR extends GetxController {
  RxString error = "".obs;
  var jsonData;
  Future<String> login(String email, String password) async {
    try {
      if (email == "") {
        return error("ຊື່ຜູ້ໃຊ້ບໍ່ຄວນຫວ່າງເປົ່າ ?");
      } else if (password == "") {
        return error("ລະຫັດຜ່ານບໍ່ຄວນຫວ່າງເປົ່າ ?");
      } else {
        var data = await http.post(
          Uri.parse("${HttpUrl.httpurl + HttpUrl.login}/$email/$password"),
        );
        if (data.statusCode == 200) {
          jsonData = data.body;
          error("");
          SharedPreferences prefs = await SharedPreferences.getInstance();
          var json = loginMdFromJson(jsonData);
          prefs.setString("token", json.token);
          prefs.setString("userid", json.results[0].userid.toString());
          prefs.setString("username", json.results[0].firstName);
          prefs.setString("email", json.results[0].userEmail);
          StatusCodeText.jsontoken = json.token;
          return error(data.statusCode.toString());
        } else if (data.statusCode == 404) {
          return error("ລະຫັດຜ່ານ ຫລື ຊື່ຂອງຜູ້ໃຊ້ ບໍ່ຖືກຕ້ອງ ?");
        } else if (data.statusCode == 500) {
          return error("ບໍ່ມີການຕອບສະຫນອງຈາກ Server !");
        }
      }
    } catch (e) {
      return error("error");
    }
  }
}
