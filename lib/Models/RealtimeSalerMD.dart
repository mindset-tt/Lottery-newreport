// To parse this JSON data, do
//
//     final realtimeSalerMd = realtimeSalerMdFromJson(jsonString);
// ignore_for_file: file_names
import 'dart:convert';

List<RealtimeSalerMd> realtimeSalerMdFromJson(String str) => List<RealtimeSalerMd>.from(json.decode(str).map((x) => RealtimeSalerMd.fromJson(x)));

String realtimeSalerMdToJson(List<RealtimeSalerMd> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RealtimeSalerMd {
    RealtimeSalerMd({
        this.allQuota,
        this.allSale,
        this.percentSaleAll,
        this.deviceRuning,
        this.deviceUnruning,
        this.devicePercent,
        this.quota,
        this.salevalue,
        this.percent,
    });

    String allQuota;
    String allSale;
    String percentSaleAll;
    String deviceRuning;
    String deviceUnruning;
    String devicePercent;
    List<Quota> quota;
    Salevalue salevalue;
    Percent percent;

    factory RealtimeSalerMd.fromJson(Map<String, dynamic> json) => RealtimeSalerMd(
        allQuota: json["AllQuota"],
        allSale: json["AllSale"],
        percentSaleAll: json["PercentSaleAll"],
        deviceRuning: json["DeviceRuning"],
        deviceUnruning: json["DeviceUnruning"],
        devicePercent: json["DevicePercent"],
        quota: List<Quota>.from(json["Quota"].map((x) => Quota.fromJson(x))),
        salevalue: Salevalue.fromJson(json["Salevalue"]),
        percent: Percent.fromJson(json["Percent"]),
    );

    Map<String, dynamic> toJson() => {
        "AllQuota": allQuota,
        "AllSale": allSale,
        "PercentSaleAll": percentSaleAll,
        "DeviceRuning": deviceRuning,
        "DeviceUnruning": deviceUnruning,
        "DevicePercent": devicePercent,
        "Quota": List<dynamic>.from(quota.map((x) => x.toJson())),
        "Salevalue": salevalue.toJson(),
        "Percent": percent.toJson(),
    };
}

class Percent {
    Percent({
        this.pd1,
        this.pd2,
        this.pd3,
        this.pd4,
        this.pd5,
        this.pd6,
    });

    String pd1;
    String pd2;
    String pd3;
    String pd4;
    String pd5;
    String pd6;

    factory Percent.fromJson(Map<String, dynamic> json) => Percent(
        pd1: json["pd1"],
        pd2: json["pd2"],
        pd3: json["pd3"],
        pd4: json["pd4"],
        pd5: json["pd5"],
        pd6: json["pd6"],
    );

    Map<String, dynamic> toJson() => {
        "pd1": pd1,
        "pd2": pd2,
        "pd3": pd3,
        "pd4": pd4,
        "pd5": pd5,
        "pd6": pd6,
    };
}

class Quota {
    Quota({
        this.d,
        this.quota,
    });

    int d;
    String quota;

    factory Quota.fromJson(Map<String, dynamic> json) => Quota(
        d: json["d"],
        quota: json["quota"],
    );

    Map<String, dynamic> toJson() => {
        "d": d,
        "quota": quota,
    };
}

class Salevalue {
    Salevalue({
        this.sd1,
        this.sd2,
        this.sd3,
        this.sd4,
        this.sd5,
        this.sd6,
    });

    String sd1;
    String sd2;
    String sd3;
    String sd4;
    String sd5;
    String sd6;

    factory Salevalue.fromJson(Map<String, dynamic> json) => Salevalue(
        sd1: json["sd1"],
        sd2: json["sd2"],
        sd3: json["sd3"],
        sd4: json["sd4"],
        sd5: json["sd5"],
        sd6: json["sd6"],
    );

    Map<String, dynamic> toJson() => {
        "sd1": sd1,
        "sd2": sd2,
        "sd3": sd3,
        "sd4": sd4,
        "sd5": sd5,
        "sd6": sd6,
    };
}
