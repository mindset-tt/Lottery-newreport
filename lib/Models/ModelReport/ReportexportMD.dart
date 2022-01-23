
// ignore_for_file: file_names
// To parse this JSON data, do
//
//     final reportExportMd = reportExportMdFromJson(jsonString);

import 'dart:convert';

List<ReportExportMd> reportExportMdFromJson(String str) => List<ReportExportMd>.from(json.decode(str).map((x) => ReportExportMd.fromJson(x)));

String reportExportMdToJson(List<ReportExportMd> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReportExportMd {
    ReportExportMd({
        this.sale,
        this.data,
    });

    List<Sale> sale;
    List<Datum> data;

    factory ReportExportMd.fromJson(Map<String, dynamic> json) => ReportExportMd(
        sale: List<Sale>.from(json["sale"].map((x) => Sale.fromJson(x))),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sale": List<dynamic>.from(sale.map((x) => x.toJson())),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.won,
        this.percent,
        this.balance,
    });

    Won won;
    String percent;
    String balance;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        won: Won.fromJson(json["won"]),
        percent: json["percent"],
        balance: json["balance"],
    );

    Map<String, dynamic> toJson() => {
        "won": won.toJson(),
        "percent": percent,
        "balance": balance,
    };
}

class Won {
    Won({
        this.deviceCode,
        this.wd1,
        this.wd2,
        this.wd3,
        this.wd4,
        this.wd5,
        this.wd6,
        this.totalwon,
    });

    String deviceCode;
    String wd1;
    String wd2;
    String wd3;
    String wd4;
    String wd5;
    String wd6;
    String totalwon;

    factory Won.fromJson(Map<String, dynamic> json) => Won(
        deviceCode: json["device_code"],
        wd1: json["wd1"],
        wd2: json["wd2"],
        wd3: json["wd3"],
        wd4: json["wd4"],
        wd5: json["wd5"],
        wd6: json["wd6"],
        totalwon: json["totalwon"],
    );

    Map<String, dynamic> toJson() => {
        "device_code": deviceCode,
        "wd1": wd1,
        "wd2": wd2,
        "wd3": wd3,
        "wd4": wd4,
        "wd5": wd5,
        "wd6": wd6,
        "totalwon": totalwon,
    };
}

class Sale {
    Sale({
        this.row,
        this.deviceCode,
        this.sd1,
        this.sd2,
        this.sd3,
        this.sd4,
        this.sd5,
        this.sd6,
        this.totalsale,
        this.branchName,
        this.dateOffline,
        this.periodNumber,
    });

    String row;
    String deviceCode;
    String sd1;
    String sd2;
    String sd3;
    String sd4;
    String sd5;
    String sd6;
    String totalsale;
    String branchName;
    String dateOffline;
    String periodNumber;

    factory Sale.fromJson(Map<String, dynamic> json) => Sale(
        row: json["row"],
        deviceCode: json["device_code"],
        sd1: json["sd1"],
        sd2: json["sd2"],
        sd3: json["sd3"],
        sd4: json["sd4"],
        sd5: json["sd5"],
        sd6: json["sd6"],
        totalsale: json["totalsale"],
        branchName: json["branch_name"],
        dateOffline: json["date_offline"],
        periodNumber: json["period_number"],
    );

    Map<String, dynamic> toJson() => {
        "row": row,
        "device_code": deviceCode,
        "sd1": sd1,
        "sd2": sd2,
        "sd3": sd3,
        "sd4": sd4,
        "sd5": sd5,
        "sd6": sd6,
        "totalsale": totalsale,
        "branch_name": branchName,
        "date_offline": dateOffline,
        "period_number": periodNumber,
    };
}
