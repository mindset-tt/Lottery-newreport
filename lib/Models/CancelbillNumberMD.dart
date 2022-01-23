// To parse this JSON data, do
//
//     final cancelbillNumberMd = cancelbillNumberMdFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<CancelbillNumberMd> cancelbillNumberMdFromJson(String str) =>
    List<CancelbillNumberMd>.from(
        json.decode(str).map((x) => CancelbillNumberMd.fromJson(x)));

String cancelbillNumberMdToJson(List<CancelbillNumberMd> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CancelbillNumberMd {
  CancelbillNumberMd({
    this.row,
    this.cancelId,
    this.billNumber,
    this.periodNumber,
    this.dateCancel,
    this.timeCancel,
    this.billPrice,
    this.sellerId,
    this.deviceNumber,
    this.dateBill,
    this.timeBill,
    this.cancelBy,
  });
  String row;
  String cancelId;
  String billNumber;
  String periodNumber;
  String dateCancel;
  String timeCancel;
  int billPrice;
  String sellerId;
  int deviceNumber;
  String dateBill;
  String timeBill;
  String cancelBy;

  factory CancelbillNumberMd.fromJson(Map<String, dynamic> json) =>
      CancelbillNumberMd(
        row: json["row"],
        cancelId: json["cancel_id"],
        billNumber: json["bill_number"],
        periodNumber: json["period_number"],
        dateCancel: json["date_cancel"],
        timeCancel: json["time_cancel"],
        billPrice: json["bill_price"],
        sellerId: json["seller_id"],
        deviceNumber: json["device_number"],
        dateBill: json["date_bill"],
        timeBill: json["time_bill"],
        cancelBy: json["cancel_by"],
      );

  Map<String, dynamic> toJson() => {
    "row": row,
        "cancel_id": cancelId,
        "bill_number": billNumber,
        "period_number": periodNumber,
        "date_cancel": dateCancel,
        "time_cancel": timeCancel,
        "bill_price": billPrice,
        "seller_id": sellerId,
        "device_number": deviceNumber,
        "date_bill": dateBill,
        "time_bill": timeBill,
        "cancel_by": cancelBy,
      };
}
