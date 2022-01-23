// To parse this JSON data, do
//
//     final sellerMd = sellerMdFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<SellerMd> sellerMdFromJson(String str) => List<SellerMd>.from(json.decode(str).map((x) => SellerMd.fromJson(x)));

String sellerMdToJson(List<SellerMd> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SellerMd {
    SellerMd({
      this.row,
        this.usid,
        this.usName,
        this.usPhone,
        this.usAddress,
        this.unitName,
        this.branchId,
        this.branchName,
        this.unitId,
        this.usStatus,
        this.deviceCode,
        this.maxSell,
        this.password,
    });
String row;
    int usid;
    String usName;
    String usPhone;
    String usAddress;
    String unitName;
    int branchId;
    String branchName;
    int unitId;
    String usStatus;
    String deviceCode;
    int maxSell;
    String password;

    factory SellerMd.fromJson(Map<String, dynamic> json) => SellerMd(
      row: json["row"],
        usid: json["usid"],
        usName: json["us_name"],
        usPhone: json["us_phone"],
        usAddress: json["us_address"],
        unitName: json["unit_name"],
        branchId: json["branch_id"],
        branchName: json["branch_name"],
        unitId: json["unit_id"],
        usStatus: json["us_status"],
        deviceCode: json["device_code"],
        maxSell: json["max_sell"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
      "row": row,
        "usid": usid,
        "us_name": usName,
        "us_phone": usPhone,
        "us_address": usAddress,
        "unit_name": unitName,
        "branch_id": branchId,
        "branch_name": branchName,
        "unit_id": unitId,
        "us_status": usStatus,
        "device_code": deviceCode,
        "max_sell": maxSell,
        "password": password,
    };
}
