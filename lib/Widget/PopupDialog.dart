// ignore_for_file: file_names, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lotterymanagement/Colors/Colors.dart';
import 'package:lotterymanagement/Controllers/MenuCTR.dart';
import 'package:lotterymanagement/Fonts/Fonts.dart';
import 'package:lotterymanagement/Responsive/Responsive.dart';

class InfoPopup extends StatefulWidget {
  const InfoPopup(
      {Key key,
      this.search,
      this.onTap,
      this.title,
      this.onChanged,
      this.inputFormatters,
      this.hintText})
      : super(key: key);
  final TextEditingController search;
  final Function onTap;
  final Function(String) onChanged;
  final String title;
  final String hintText;
  final List<TextInputFormatter> inputFormatters;
  @override
  _InfoPopupState createState() => _InfoPopupState();
}

class _InfoPopupState extends State<InfoPopup> {
  MenuCTR menu = Get.put(MenuCTR());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => menu.user.value == null
          ? null
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      if (!Responsive.isDesktop(context))
                        IconButton(
                            onPressed: () {
                              menu.controllMenu();
                            },
                            icon: const Icon(
                              Icons.menu,
                              color: colorblack,
                            )),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.title,
                        style: TextStyle(
                            fontFamily: phetsarath,
                            color: colorblack,
                            fontSize: fonttitle,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    width: 340,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        menu.disable.value == false
                            ? Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: SizedBox(
                                  width: 250,
                                  height: 42,
                                  child: TextFormField(
                                    inputFormatters: widget.inputFormatters,
                                    onChanged: widget.onChanged,
                                    controller: widget.search,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        color: colorblack,
                                        fontSize: fontmenu,
                                        fontFamily: phetsarath,
                                        fontWeight: FontWeight.normal),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: colorblack)),
                                      suffixIcon: InkWell(
                                          onTap: widget.onTap,
                                          child: const Icon(
                                            Icons.search,
                                            color: colorblack,
                                          )),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 25),
                                      hintText: widget.hintText,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: colorblack),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                        PopupMenuButton(
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
                                          size: 50,
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
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
