// To parse this JSON data, do
//
//     final reportWonMd = reportWonMdFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<ReportWonMd> reportWonMdFromJson(String str) => List<ReportWonMd>.from(
    json.decode(str).map((x) => ReportWonMd.fromJson(x)));

String reportWonMdToJson(List<ReportWonMd> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReportWonMd {
  List<Won> won;
  List<Balance> balance;

  ReportWonMd({this.won, this.balance});

  ReportWonMd.fromJson(Map<String, dynamic> json) {
    if (json['won'] != null) {
      won = <Won>[];
      json['won'].forEach((v) {
        won.add(new Won.fromJson(v));
      });
    }
    if (json['balance'] != null) {
      balance = <Balance>[];
      json['balance'].forEach((v) {
        balance.add(new Balance.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.won != null) {
      data['won'] = this.won.map((v) => v.toJson()).toList();
    }
    if (this.balance != null) {
      data['balance'] = this.balance.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Won {
  String row;
  String deviceCode;
  String branchName;
  String dateOffline;
  String periodNumber;
  String wd1;
  String wd2;
  String wd3;
  String wd4;
  String wd5;
  String wd6;
  String total;

  Won(
      {this.row,
      this.deviceCode,
      this.branchName,
      this.dateOffline,
      this.periodNumber,
      this.wd1,
      this.wd2,
      this.wd3,
      this.wd4,
      this.wd5,
      this.wd6,
      this.total});

  Won.fromJson(Map<String, dynamic> json) {
    row = json['row'];
    deviceCode = json['device_code'];
    branchName = json['branch_name'];
    dateOffline = json['date_offline'];
    periodNumber = json['period_number'];
    wd1 = json['wd1'];
    wd2 = json['wd2'];
    wd3 = json['wd3'];
    wd4 = json['wd4'];
    wd5 = json['wd5'];
    wd6 = json['wd6'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['row'] = this.row;
    data['device_code'] = this.deviceCode;
    data['branch_name'] = this.branchName;
    data['date_offline'] = this.dateOffline;
    data['period_number'] = this.periodNumber;
    data['wd1'] = this.wd1;
    data['wd2'] = this.wd2;
    data['wd3'] = this.wd3;
    data['wd4'] = this.wd4;
    data['wd5'] = this.wd5;
    data['wd6'] = this.wd6;
    data['total'] = this.total;
    return data;
  }
}

class Balance {
  String balance;

  Balance({this.balance});

  Balance.fromJson(Map<String, dynamic> json) {
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['balance'] = this.balance;
    return data;
  }
}
