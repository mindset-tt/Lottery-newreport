// To parse this JSON data, do
//
//     final unitMd = unitMdFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<UnitMd> unitMdFromJson(String str) =>
    List<UnitMd>.from(json.decode(str).map((x) => UnitMd.fromJson(x)));

String unitMdToJson(List<UnitMd> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UnitMd {
  UnitMd({
    this.row,
    this.suId,
    this.serviceUnitName,
    this.branchName,
    this.villageName,
    this.tel1,
    this.suPercent,
    this.suEmail,
    this.branchId,
  });
  String row;
  int suId;
  String serviceUnitName;
  String branchName;
  String villageName;
  String tel1;
  int suPercent;
  String suEmail;
  int branchId;
  factory UnitMd.fromJson(Map<String, dynamic> json) => UnitMd(
        row: json["row"],
        suId: json["su_id"],
        serviceUnitName: json["service_unit_name"],
        branchName: json["branch_name"],
        villageName: json["village_name"],
        tel1: json["tel1"],
        suPercent: json["su_percent"],
        suEmail: json["su_email"],
        branchId: json["branch_id"],
      );

  Map<String, dynamic> toJson() => {
         "row": row,
        "su_id": suId,
        "service_unit_name": serviceUnitName,
        "branch_name": branchName,
        "village_name": villageName,
        "tel1": tel1,
        "su_percent": suPercent,
        "su_email": suEmail,
        "branch_id": branchId,
      };
}
