// To parse this JSON data, do
//
//     final branchMd = branchMdFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators, file_names

// To parse this JSON data, do
//
//     final branchMd = branchMdFromJson(jsonString);

// To parse this JSON data, do
//
//     final branchMd = branchMdFromJson(jsonString);

import 'dart:convert';

List<BranchMd> branchMdFromJson(String str) =>
    List<BranchMd>.from(json.decode(str).map((x) => BranchMd.fromJson(x)));

String branchMdToJson(List<BranchMd> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BranchMd {
  BranchMd({
    this.row,
    this.branchId,
    this.branchCode,
    this.phone,
    this.branchname,
    this.branchName,
  });
  String row;
  int branchId;
  String branchCode;
  String phone;
  String branchname;
  String branchName;

  factory BranchMd.fromJson(Map<String, dynamic> json) => BranchMd(
        row: json["row"],
        branchId: json["branch_id"],
        branchCode: json["branch_code"],
        phone: json["phone"],
        branchname: json["branchname"] == null ? null : json["branchname"],
        branchName: json["branch_name"],
      );

  Map<String, dynamic> toJson() => {
        "row": row,
        "branch_id": branchId,
        "branch_code": branchCode,
        "phone": phone,
        "branchname": branchname == null ? null : branchname,
        "branch_name": branchName,
      };
}
