// To parse this JSON data, do
//
//     final reportBillMd = reportBillMdFromJson(jsonString);
// ignore_for_file: file_names
import 'dart:convert';

List<ReportBillMd> reportBillMdFromJson(String str) => List<ReportBillMd>.from(
    json.decode(str).map((x) => ReportBillMd.fromJson(x)));

String reportBillMdToJson(List<ReportBillMd> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReportBillMd {
  String row;
  String deviceCode;
  String branchName;
  String dateOfffline;
  String periodNumber;
  String billNumber;
  String wd1;
  String wd2;
  String wd3;
  String wd4;
  String wd5;
  String wd6;
  String total;
  int pay;
  String date;

  ReportBillMd(
      {this.row,
      this.deviceCode,
      this.branchName,
      this.dateOfffline,
      this.periodNumber,
      this.billNumber,
      this.wd1,
      this.wd2,
      this.wd3,
      this.wd4,
      this.wd5,
      this.wd6,
      this.total,
      this.pay,
      this.date});

  ReportBillMd.fromJson(Map<String, dynamic> json) {
    row = json['row'];
    deviceCode = json['device_code'];
    branchName = json['branch_name'];
    dateOfffline = json['date_offfline'];
    periodNumber = json['period_number'];
    billNumber = json['bill_number'];
    wd1 = json['wd1'];
    wd2 = json['wd2'];
    wd3 = json['wd3'];
    wd4 = json['wd4'];
    wd5 = json['wd5'];
    wd6 = json['wd6'];
    total = json['total'];
    pay = json['pay'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['row'] = this.row;
    data['device_code'] = this.deviceCode;
    data['branch_name'] = this.branchName;
    data['date_offfline'] = this.dateOfffline;
    data['period_number'] = this.periodNumber;
    data['bill_number'] = this.billNumber;
    data['wd1'] = this.wd1;
    data['wd2'] = this.wd2;
    data['wd3'] = this.wd3;
    data['wd4'] = this.wd4;
    data['wd5'] = this.wd5;
    data['wd6'] = this.wd6;
    data['total'] = this.total;
    data['pay'] = this.pay;
    data['date'] = this.date;
    return data;
  }
}
