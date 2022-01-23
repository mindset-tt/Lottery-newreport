import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lotterymanagement/Colors/Colors.dart';
import 'package:lotterymanagement/Controllers/MenuCTR.dart';
import 'package:lotterymanagement/Fonts/Fonts.dart';

class HeaderMobile extends StatefulWidget implements PreferredSizeWidget {
  const HeaderMobile(
      {Key key, this.onChanged, this.controller, this.onTap, this.hintText})
      : super(key: key);
  final Function(String) onChanged;
  final TextEditingController controller;
  final Function onTap;
  final String hintText;
  @override
  Size get preferredSize => const Size.fromHeight(56);
  @override
  _HeaderMobileState createState() => _HeaderMobileState();
}
class _HeaderMobileState extends State<HeaderMobile> {
  MenuCTR menu = Get.put(MenuCTR());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => menu.user.value == null
          ? null
          : AppBar(
              backgroundColor: colorbackground,
              centerTitle: true,
              leading: InkWell(
                onTap: () {
                  menu.controllMenu();
                },
                child: const Icon(
                  Icons.menu,
                  color: colorblack,
                  size: 33,
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  menu.disable.value == false
                      ? SizedBox(
                          width: 230,
                          height: 42,
                          child: TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(50),
                            ],
                            onChanged: widget.onChanged,
                            controller: widget.controller,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                                color: colorblack,
                                fontSize: fontmenu,
                                fontFamily: phetsarath,
                                fontWeight: FontWeight.normal),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: colorblack)),
                              suffixIcon: InkWell(
                                  onTap: widget.onTap,
                                  child: const Icon(
                                    Icons.search,
                                    color: colorblack,
                                  )),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              hintText: widget.hintText,
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: colorblack),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  
                  const SizedBox(
                    width: 2,
                  ),
                  PopupMenuButton(
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          enabled: false,
                          child: Center(
                            child: SizedBox(
                              child: Column(
                                children: [
                                  const Icon(
                                    Icons.account_circle,
                                    color: colorblack,
                                    size: 40,
                                  ),
                                  Text(
                                    "ຂໍ້ມູນຜູ້ໃຊ້",
                                    style: TextStyle(
                                        fontFamily: phetsarath,
                                        color: colorblack,
                                        fontSize: fontgeneral,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "ຊື່ຜູ້ໃຊ້ ${menu.user.value}",
                                    style: TextStyle(
                                        fontFamily: phetsarath,
                                        color: colordarkblue,
                                        fontSize: fontgeneral,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "ອີເມລ ${menu.email.value}",
                                    style: TextStyle(
                                        fontFamily: phetsarath,
                                        color: colordarkblue,
                                        fontSize: fontgeneral,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.offAllNamed("/lottery/login");
                                    },
                                    child: const Icon(
                                      Icons.exit_to_app,
                                      color: colorred,
                                      size: 30,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ];
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    offset: const Offset(0, 50),
                    color: colorbackground,
                    tooltip: 'info',
                    child: const Icon(
                      Icons.account_circle,
                      color: colorblack,
                      size: 40,
                    ),
                    initialValue: 2,
                  ),
                ],
              ),
            ),
    );
  }
}