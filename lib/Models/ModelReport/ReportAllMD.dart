// To parse this JSON data, do
//
//     final reportAllMd = reportAllMdFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<ReportAllMd> reportAllMdFromJson(String str) => List<ReportAllMd>.from(json.decode(str).map((x) => ReportAllMd.fromJson(x)));

String reportAllMdToJson(List<ReportAllMd> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReportAllMd {
    ReportAllMd({
        this.totalQuota,
        this.totalSale,
        this.totalWon,
        this.totalBalance,
        this.quota,
        this.sales,
        this.won,
        this.balance,
    });

    String totalQuota;
    String totalSale;
    String totalWon;
    String totalBalance;
    List<Quota> quota;
    List<Sale> sales;
    List<Won> won;
    Balance balance;

    factory ReportAllMd.fromJson(Map<String, dynamic> json) => ReportAllMd(
        totalQuota: json["totalQuota"],
        totalSale: json["totalSale"],
        totalWon: json["totalWon"],
        totalBalance: json["totalBalance"],
        quota: List<Quota>.from(json["quota"].map((x) => Quota.fromJson(x))),
        sales: List<Sale>.from(json["sales"].map((x) => Sale.fromJson(x))),
        won: List<Won>.from(json["won"].map((x) => Won.fromJson(x))),
        balance: Balance.fromJson(json["balance"]),
    );

    Map<String, dynamic> toJson() => {
        "totalQuota": totalQuota,
        "totalSale": totalSale,
        "totalWon": totalWon,
        "totalBalance": totalBalance,
        "quota": List<dynamic>.from(quota.map((x) => x.toJson())),
        "sales": List<dynamic>.from(sales.map((x) => x.toJson())),
        "won": List<dynamic>.from(won.map((x) => x.toJson())),
        "balance": balance.toJson(),
    };
}

class Balance {
    Balance({
        this.d1,
        this.d2,
        this.d3,
        this.d4,
        this.d5,
        this.d6,
    });

    String d1;
    String d2;
    String d3;
    String d4;
    String d5;
    String d6;

    factory Balance.fromJson(Map<String, dynamic> json) => Balance(
        d1: json["d1"],
        d2: json["d2"],
        d3: json["d3"],
        d4: json["d4"],
        d5: json["d5"],
        d6: json["d6"],
    );

    Map<String, dynamic> toJson() => {
        "d1": d1,
        "d2": d2,
        "d3": d3,
        "d4": d4,
        "d5": d5,
        "d6": d6,
    };
}

class Quota {
    Quota({
        this.len,
        this.quota,
    });

    int len;
    String quota;

    factory Quota.fromJson(Map<String, dynamic> json) => Quota(
        len: json["len"],
        quota: json["quota"],
    );

    Map<String, dynamic> toJson() => {
        "len": len,
        "quota": quota,
    };
}

class Sale {
    Sale({
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

    factory Sale.fromJson(Map<String, dynamic> json) => Sale(
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

class Won {
    Won({
        this.wd1,
        this.wd2,
        this.wd3,
        this.wd4,
        this.wd5,
        this.wd6,
    });

    String wd1;
    String wd2;
    String wd3;
    String wd4;
    String wd5;
    String wd6;

    factory Won.fromJson(Map<String, dynamic> json) => Won(
        wd1: json["wd1"],
        wd2: json["wd2"],
        wd3: json["wd3"],
        wd4: json["wd4"],
        wd5: json["wd5"],
        wd6: json["wd6"],
    );

    Map<String, dynamic> toJson() => {
        "wd1": wd1,
        "wd2": wd2,
        "wd3": wd3,
        "wd4": wd4,
        "wd5": wd5,
        "wd6": wd6,
    };
}
