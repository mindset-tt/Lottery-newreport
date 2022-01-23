// ignore_for_file: file_names, missing_return
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lotterymanagement/AlertDialogs/CustomDialog.dart';
import 'package:lotterymanagement/Colors/Colors.dart';
import 'package:lotterymanagement/Controllers/LoginCTR.dart';
import 'package:lotterymanagement/Fonts/Fonts.dart';
import 'package:lotterymanagement/Responsive/Responsive.dart';
// import 'package:lotterymanagement/Widget/TextfieldUpercase.dart';
class LoginPages extends StatefulWidget {
  const LoginPages({Key key}) : super(key: key);
  @override
  _LoginPagesState createState() => _LoginPagesState();
}
class _LoginPagesState extends State<LoginPages> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  LoginCTR loginCTR = Get.put(LoginCTR());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: colorgray,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: colorwhite,
            ),
            width: 500,
            height: 600,
            child: Padding(
              padding: EdgeInsets.only(left: width / 20, right: width / 20),
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (Responsive.isDesktop(context))
                      SizedBox(
                        width: 220,
                        height: 200,
                        child: Image.asset(
                          "assets/images/logo.png",
                        ),
                      ),
                    if (!Responsive.isDesktop(context))
                      SizedBox(
                        width: 220,
                        height: 200,
                        child: Image.asset(
                          "assets/images/logo.png",
                        ),
                      ),
                    Text(
                      "ເຂົ້າສູ່ລະບົບ",
                      style: TextStyle(
                          fontFamily: phetsarath,
                          color: colorblack,
                          fontSize: fonttitle,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      loginCTR.error.value,
                      style: TextStyle(
                          color: colorred,
                          fontFamily: phetsarath,
                          fontSize: fontgeneral,
                          fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Textfield(
                      //  inputFormatters: [UpperCaseTextFormatter()],
                      obscureText: false,
                      controller: username,
                      hintText: "ອີເມລຜູ້ໃຊ້",
                      labelText: "ອີເມລຜູ້ໃຊ້",
                      icon: const Icon(
                        Icons.person,
                        color: colorgray,
                      ),
                      textInputType: TextInputType.text,
                      size: double.infinity,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Textfield(
                      obscureText: true,
                      controller: password,
                      hintText: "ລະຫັດຜ່ານ",
                      labelText: "ລະຫັດຜ່ານ",
                      icon: const Icon(
                        Icons.lock,
                        color: colorgray,
                      ),
                      textInputType: TextInputType.text,
                      size: double.infinity,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ButtonLogin(
                      colorstype: colorwhite,
                      fontFamily: phetsarath,
                      fontSize: fontmiddle,
                      onPressed: () {
                        CustomDialogs.loadingDialogs(
                            context, "ກຳລັງໂຫລດຂໍ້ມູນ...");
                        loginCTR
                            .login(username.text, password.text)
                            .then((value) {
                          if (value == "200") {
                            Get.offAllNamed("/lottery/adminpage");
                          } else if (value == "error") {
                            CustomDialogs.loadingDialogs(
                                context, "ກຳລັງໂຫລດຂໍ້ມູນ... $value");
                          } else {
                            Get.back();
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class ButtonLogin extends StatelessWidget {
  final double fontSize;
  final String fontFamily;
  final Function onPressed;
  final Color colorstype;
  const ButtonLogin(
      {Key key,
      this.fontSize,
      this.fontFamily,
      this.onPressed,
      this.colorstype})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: RaisedButton(
        color: colordarkblue,
        textColor: colorwhite,
        padding: const EdgeInsets.all(10),
        child: Text(
          "ເຂົ້າສູ່ລະບົບ",
          style: TextStyle(
              color: colorstype, fontSize: fontSize, fontFamily: fontFamily),
        ),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class Textfield extends StatelessWidget {
  const Textfield({
    Key key,
    this.hintText,
    this.labelText,
    this.textInputType,
    this.controller,
    this.size,
    this.icon,
    this.obscureText,
    this.inputFormatters,
  }) : super(key: key);
  final TextEditingController controller;
  final String hintText, labelText;
  final TextInputType textInputType;
  final double size;
  final Icon icon;
  final bool obscureText;
  final List<TextInputFormatter> inputFormatters;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: TextFormField(
        inputFormatters: inputFormatters,
        obscureText: obscureText,
        autofocus: true,
        controller: controller,
        keyboardType: textInputType,
        style: TextStyle(fontSize: fontmenu, fontFamily: phetsarath),
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: colorgray)),
          prefixIcon: icon,
          contentPadding: const EdgeInsets.symmetric(horizontal: 25),
          labelStyle: const TextStyle(
            color: colorgray,
          ),
          hintText: hintText,
          labelText: hintText,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: colorgray),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
